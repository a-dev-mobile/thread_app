import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thread/src/common/log/l_setup.dart';
import 'package:thread/src/feature/metric_thread_diameter/data/i_diameter_repository.dart';
import 'package:thread/src/feature/metric_thread_diameter/model/diameter_model.dart';

part 'diameter_controller.freezed.dart';
part 'diameter_controller.g.dart';
part 'diameter_state.dart';

final _l = L('diameter_controller');

class DiameterController with ChangeNotifier {
  final IDiameterRepository _repository;
  DiameterState _state = const DiameterState();
  bool _isDisposed = false;

  DiameterController(this._repository);

  DiameterState get state => _state;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Future<void> loadDiameters() async {
    _updateState(isLoading: true, error: null, diameters: state.diameters);
    try {
      final diameters = await _repository.fetchDiameters();
      _updateState(isLoading: false, diameters: diameters);
    } catch (e, s) {
      _l.e('error loadDiameters', error: e, stackTrace: s);
      _updateState(isLoading: false, error: e.toString(), diameters: state.diameters);
    }
  }

  void _updateState({
    List<DiameterModel>? diameters,
    required bool isLoading,
    String? error,
  }) {
    if (_isDisposed) return;

    _state = _state.copyWith(
      diameters: diameters ?? state.diameters,
      isLoading: isLoading,
      error: error,
    );
    notifyListeners();
  }
}
