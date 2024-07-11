import 'package:flutter/material.dart';

import 'package:thread/src/common/network/dio_log/dio_log.dart';

class HttpLogListWidget extends StatefulWidget {
  const HttpLogListWidget({super.key});
  static const path = '/HttpLogListWidget';
  static const name = 'HttpLogListWidget';

  @override
  HttpLogListWidgetState createState() => HttpLogListWidgetState();
}

class HttpLogListWidgetState extends State<HttpLogListWidget> {
  Map<String, NetOptions>? _cachedLogMap;
  List<String>? _cachedKeys;
  String currentFilter = 'ALL';
  bool isFilterAscending = true;

  String currentSort = 'Time';
  bool isSortAscending = false;

  @override
  void initState() {
    super.initState();
    _updateCache();
  }

  void _updateCache() {
    _cachedLogMap = LogPoolManager.instance.logMap;
    _cachedKeys = LogPoolManager.instance.keys;
  }

  @override
  Widget build(BuildContext context) {
    if (_cachedLogMap != LogPoolManager.instance.logMap || _cachedKeys != LogPoolManager.instance.keys) {
      _updateCache();
    }
    _cachedLogMap = LogPoolManager.instance.logMap;
    _cachedKeys = LogPoolManager.instance.keys;
    final theme = Theme.of(context);
    applyFiltersAndSorting();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Logs'),
        elevation: 1,
        iconTheme: theme.iconTheme,
        actions: <Widget>[
          _buildFilterAction(),
          _buildSortAction(),
          InkWell(
            onTap: () {
              if (debugBtnIsShow()) {
                dismissDebugBtn();
              } else {
                // TODO
                showHttpLogBtn(context);
              }
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                child: Text(
                  debugBtnIsShow() ? 'close overlay' : 'open overlay',
                  style: theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              LogPoolManager.instance.clear();
              setState(() {});
            },
          ),
        ],
      ),
      body: _cachedLogMap!.isEmpty
          ? const Center(
              child: Text('No request logs found. Try again later.'),
            )
          : ListView.builder(
              itemCount: _cachedKeys!.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _cachedLogMap![_cachedKeys![index]]!;

                return LogEntryWidget(
                  item: item,
                );
              },
            ),
    );
  }

  Widget _buildSortAction() {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          if (currentSort == value) {
            isSortAscending = !isSortAscending;
          } else {
            currentSort = value;
            isSortAscending = true;
          }
        });
      },
      itemBuilder: (BuildContext context) {
        return ['Time', 'Status', 'Duration'].map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
      icon: const Icon(Icons.sort),
    );
  }

  Widget _buildFilterAction() {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          if (currentFilter == value) {
            isFilterAscending = !isFilterAscending;
          } else {
            currentFilter = value;
            isFilterAscending = true;
          }
        });
      },
      itemBuilder: (BuildContext context) {
        return ['ALL', 'GET', 'POST', 'PUT', 'DELETE'].map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
      icon: const Icon(Icons.filter_list),
    );
  }

  void applyFiltersAndSorting() {
    if (currentFilter != 'ALL') {
      _cachedKeys = LogPoolManager.instance.logMap.keys
          .where(
            (key) => LogPoolManager.instance.logMap[key]?.reqOptions?.method == currentFilter,
          )
          .toList();
    } else {
      _cachedKeys = LogPoolManager.instance.keys;
    }
    // Apply sorting with order
    int Function(String, String) comparator;
    switch (currentSort) {
      case 'Time':
        comparator = (String a, String b) => LogPoolManager.instance.logMap[a]!.reqOptions!.requestTime!.compareTo(
              LogPoolManager.instance.logMap[b]!.reqOptions!.requestTime!,
            );

      case 'Status':
        comparator = (String a, String b) => LogPoolManager.instance.logMap[a]!.resOptions!.statusCode!.compareTo(
              LogPoolManager.instance.logMap[b]!.resOptions!.statusCode!,
            );

      case 'Duration':
        comparator = (String a, String b) => LogPoolManager.instance.logMap[a]!.resOptions!.duration!.compareTo(
              LogPoolManager.instance.logMap[b]!.resOptions!.duration!,
            );

      default:
        throw Exception('Invalid sort criteria');
    }

    if (isSortAscending) {
      _cachedKeys!.sort(comparator);
    } else {
      _cachedKeys!.sort((a, b) => comparator(b, a));
    }
  }
}

class LogEntryWidget extends StatelessWidget {
  const LogEntryWidget({
    required this.item,
    super.key,
  });
  final NetOptions item;

  IconData _getMethodIcon(String? method) {
    switch (method) {
      case 'GET':
        return Icons.cloud_download;
      case 'POST':
        return Icons.cloud_upload;
      case 'PUT':
        return Icons.system_update_alt;
      case 'DELETE':
        return Icons.delete_forever;

      default:
        return Icons.error_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final resOpt = item.resOptions;
    final reqOpt = item.reqOptions!;
    final requestTime = getTimeStr1(reqOpt.requestTime!);
    final methodColor = _getRequestMethodColor(reqOpt.method ?? '');
    final statusCodeIcon = _getResponseStatusCodeIcon(resOpt?.statusCode);
    final statusCodeColor = _getResponseStatusCodeColor(resOpt?.statusCode);

    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) {
                return LogWidget(item);
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Tooltip(
                    message: 'Method: ${reqOpt.method}',
                    child: Icon(
                      _getMethodIcon(reqOpt.method),
                      color: methodColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      reqOpt.method ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: methodColor,
                      ),
                    ),
                  ),
                  Text(
                    'Status: ${resOpt?.statusCode}',
                    style: TextStyle(
                      fontSize: 14,
                      color: statusCodeColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Tooltip(
                    message: 'Status: ${resOpt?.statusCode}',
                    child: Icon(
                      statusCodeIcon,
                      color: statusCodeColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'URL: ${reqOpt.url}',
                softWrap: true,
                style: TextStyle(color: Colors.grey[600]),
              ),
              Text(
                'Time: $requestTime, Duration: ${resOpt?.duration ?? 0}ms',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Добавляем функцию для определения цвета в зависимости от типа запроса
  Color _getRequestMethodColor(String method) {
    switch (method) {
      case 'GET':
        return Colors.green;
      case 'POST':
        return Colors.blue;
      case 'PUT':
        return Colors.orange;
      case 'DELETE':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

// Функция для определения цвета в зависимости от статуса HTTP-ответа
  Color _getResponseStatusCodeColor(int? statusCode) {
    if (statusCode == null) return Colors.grey;
    if (statusCode >= 200 && statusCode < 300) return Colors.green; // Успех
    if (statusCode >= 300 && statusCode < 400) return Colors.orange; // Редирект
    if (statusCode >= 400 && statusCode < 500) {
      return Colors.red; // Ошибка клиента
    }
    return Colors.purple; // Ошибки сервера и другие статусы
  }

  IconData _getResponseStatusCodeIcon(int? statusCode) {
    if (statusCode == null) return Icons.help_outline;
    if (statusCode >= 200 && statusCode < 300) {
      return Icons.check_circle; // Success
    }
    if (statusCode >= 300 && statusCode < 400) return Icons.loop; // Redirect
    if (statusCode >= 400 && statusCode < 500) {
      return Icons.warning; // Client error
    }
    return Icons.error; // Server error
  }
}
