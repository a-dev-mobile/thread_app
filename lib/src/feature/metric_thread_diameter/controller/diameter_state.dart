import 'package:flutter/material.dart';
import 'package:thread/src/feature/metric_thread_diameter/model/diameter.dart';

@immutable
class DiameterState {
  final List<Diameter> diameters;
  final bool isLoading;
  final String? error;

  const DiameterState({
    this.diameters = const [],
    this.isLoading = false,
    this.error,
  });

  DiameterState copyWith({
    List<Diameter>? diameters,
    bool? isLoading,
    String? error,
  }) {
    return DiameterState(
      diameters: diameters ?? this.diameters,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
