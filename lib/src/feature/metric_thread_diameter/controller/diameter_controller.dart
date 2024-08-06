import 'package:flutter/material.dart';
import 'package:thread/src/feature/metric_thread_diameter/data/i_diameter_repository.dart';
import 'package:thread/src/feature/metric_thread_diameter/model/diameter.dart';
import 'diameter_state.dart';

class DiameterController with ChangeNotifier {
  final IDiameterRepository _repository;
  DiameterState _state = const DiameterState();
  bool _isDisposed = false;

  DiameterController(this._repository) {
    _repository.diameterChanges().listen((diameters) {
      _updateState(diameters: diameters);
    });
  }

  DiameterState get state => _state;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Future<void> loadDiameters() async {
    _updateState(isLoading: true, error: null);
    try {
      final diameters = await _repository.fetchDiameters();
      _updateState(isLoading: false, diameters: diameters);
    } catch (e) {
      _updateState(isLoading: false, error: e.toString());
    }
  }

  void _updateState({
    List<Diameter>? diameters,
    bool? isLoading,
    String? error,
  }) {
    if (_isDisposed) return;

    _state = _state.copyWith(
      diameters: diameters,
      isLoading: isLoading,
      error: error,
    );
    notifyListeners();
  }
}
