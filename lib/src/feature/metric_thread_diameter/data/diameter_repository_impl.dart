import 'dart:async';

import 'package:dio/dio.dart';
import 'package:thread/src/feature/metric_thread_diameter/data/i_diameter_repository.dart';
import 'package:thread/src/feature/metric_thread_diameter/model/diameter_model.dart';

class DiameterRepositoryImpl implements IDiameterRepository {
  DiameterRepositoryImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;
    List<DiameterModel> _diameters = [];

  @override
  Future<List<DiameterModel>> fetchDiameters() async {
    final response = await _dio.get('/api/metric/diameters/');
    final List<dynamic> data = response.data;
    final diameters = data.map((json) => DiameterModel.fromJson(json)).toList();
    _diameters = diameters;
    return _diameters;
  }
}
