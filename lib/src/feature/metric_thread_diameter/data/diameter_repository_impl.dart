import 'dart:async';
import 'package:dio/dio.dart';
import 'package:thread/src/feature/metric_thread_diameter/data/i_diameter_repository.dart';
import 'package:thread/src/feature/metric_thread_diameter/model/diameter.dart';

class DiameterRepositoryImpl implements IDiameterRepository {
  DiameterRepositoryImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;
  final StreamController<List<Diameter>> _diameterController = StreamController<List<Diameter>>.broadcast();
  List<Diameter> _diameters = [];

  @override
  FutureOr<List<Diameter>> getDiameters() => _diameters;

  @override
  Stream<List<Diameter>> diameterChanges() => _diameterController.stream;

  @override
  Future<List<Diameter>> fetchDiameters() async {
    final response = await _dio.get('http://localhost:5068/api/metric/diameters/');
    // final response = await _dio.get('http://91.223.70.72:3003/api/metric/diameters/');
    final List<dynamic> data = response.data;
    final diameters = data.map((json) => Diameter.fromJson(json)).toList();
    _diameters = diameters;
    _diameterController.add(_diameters);
    return _diameters;
  }
}
