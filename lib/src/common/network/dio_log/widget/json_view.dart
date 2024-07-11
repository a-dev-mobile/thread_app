import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thread/src/common/network/dio_log/dio_log.dart';


///

///

class JsonView extends StatefulWidget {
  const JsonView({
    super.key,
    this.json,
    this.isShowAll = false,
    this.fontSize = 14,
  });

  ///json данные для отображения
  final dynamic json;

  ///Расширять ли весь json
  final bool? isShowAll;

  final double fontSize;

  @override
  JsonViewState createState() => JsonViewState();
}

class JsonViewState extends State<JsonView> {
  Map<String, bool?> showMap = {};

  ///Текущий номер узла
  int currentIndex = 0;

  @override
  void didUpdateWidget(JsonView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isShowAll != widget.isShowAll) {
      _flexAll(widget.isShowAll);
    }
  }

  @override
  Widget build(BuildContext context) {
    currentIndex = 0;
    Widget w;
    final type = getType(widget.json);
    if (type == JsonType.object) {
      w = _buildObject(widget.json);
    } else if (type == JsonType.array) {
      final list = widget.json as List?;
      w = _buildArray(list, '');
    } else {
      w = _getDefText(_safeConvertToJson(widget.json));
    }
    return w;
  }

  /// Converts any object safely to a JSON string. If the object is not directly
  /// encodable, it uses a default string representation.
  String _safeConvertToJson(dynamic data) {
    try {
      const je = JsonEncoder.withIndent('  ');
      return je.convert(data);
    } catch (e) {
      return data.toString(); // Default to toString if JSON conversion fails
    }
  }

  /// Builds a key-value display for different types of values.
  Widget _buildKeyValue(dynamic v, {dynamic k}) {
    final valueStr = v is String ? '"$v"' : _safeConvertToJson(v);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        _copy(v);
      },
      child: _getDefText('${k ?? ''}:$valueStr,'),
    );
  }

  ///Создание отображения узлов объектов
  Widget _buildObject(dynamic json, {String? key}) {
    if (json is! Map<String, dynamic>) {
      // If json is not a Map, return an error message or an empty Widget
      return const Text('Invalid JSON object');
    }
    final listW = <Widget>[];

    ///добавить узел
    currentIndex++;

    ///узел объекта
    Widget keyW;
    if (_isShow(currentIndex)) {
      keyW = _getDefText(key == null ? '{' : '$key:{');
    } else {
      keyW = _getDefText(key == null ? '{...}' : '$key:{...}');
    }
    listW.add(_wrapFlex(currentIndex, keyW));

    ///object Показать содержимое
    if (_isShow(currentIndex)) {
      final listObj = <Widget>[];
      json.forEach((k, v) {
        Widget w;
        final type = getType(v);
        if (type == JsonType.object) {
          w = _buildObject(v, key: k);
        } else if (type == JsonType.array) {
          final list = v as List;
          w = _buildArray(list, k);
        } else {
          w = _buildKeyValue(v, k: k);
        }
        listObj.add(w);
      });

      listObj.add(_getDefText('},'));

      ///Добавить отступ
      listW.add(
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: listObj,
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listW,
    );
  }

  ///Отображение узлов построения массива
  Widget _buildArray(List<dynamic>? listJ, String key) {
    final listW = <Widget>[];

    ///добавить узел
    currentIndex++;

    ///Добавить ключевой дисплей
    Widget keyW;
    if (key.isEmpty) {
      keyW = _getDefText('[');
    } else if (_isShow(currentIndex)) {
      keyW = _getDefText('$key:[');
    } else {
      keyW = _getDefText('$key:[...]');
    }

    ///Добавляем событие нажатия клавиши
    ///Добавить ключевой дисплей
    listW.add(
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPress: () {
          _copy(listJ.toString());
        },
        child: _wrapFlex(currentIndex, keyW),
      ),
    );

    if (_isShow(currentIndex)) {
      final listArr = <Widget>[];
      for (final val in listJ!) {
        final type = getType(val);
        Widget w;
        if (type == JsonType.object) {
          w = _buildObject(val);
        } else {
          w = _buildKeyValue(val);
        }
        listArr.add(w);
      }
      listArr.add(_getDefText(']'));

      ///添加缩进
      listW.add(
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: listArr,
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listW,
    );
  }

  ///包裹展开按钮
  Widget _wrapFlex(int key, Widget keyW) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (key == 0) {
          _flexAll(!_isShow(key));
          setState(() {});
        }
        _flexSwitch(key.toString());
      },
      child: Row(
        children: <Widget>[
          Transform.rotate(
            angle: _isShow(key) ? 0 : 3.14 * 1.5,
            child: const Icon(
              Icons.expand_more,
              size: 12,
            ),
          ),
          keyW,
        ],
      ),
    );
  }

  ///json Отображается ли узел
  bool _isShow(int key) {
    ///Описание является корневым узлом
    if (key == 1) return true;
    if (widget.isShowAll!) {
      return showMap[key.toString()] ?? true;
    } else {
      return showMap[key.toString()] ?? false;
    }
  }

  ///Развернуть и закрыть переключатель
  void _flexSwitch(String key) {
    showMap.putIfAbsent(key, () => false);
    showMap[key] = !showMap[key]!;
    setState(() {});
  }

  ///Развернуть и закрыть все
  void _flexAll(bool? flex) {
    showMap.forEach((k, v) {
      showMap[k] = flex;
    });
  }

  ///Определяем тип значения
  JsonType getType(dynamic json) {
    if (json is List) {
      return JsonType.array;
    } else if (json is Map<String, dynamic>) {
      return JsonType.object;
    } else {
      return JsonType.str;
    }
  }

  ///Размер текста по умолчанию
  Text _getDefText(String str) {
    return Text(
      str,
      style: TextStyle(fontSize: widget.fontSize),
    );
  }

  ///Копируем на монтажный стол мобильного телефона
  void _copy(dynamic value) {
    copyClipboard(context, value);
  }
}

enum JsonType {
  object,
  array,
  str,
}
