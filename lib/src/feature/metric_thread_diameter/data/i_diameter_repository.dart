import 'dart:async';

import 'package:thread/src/feature/metric_thread_diameter/model/diameter_model.dart';

abstract class IDiameterRepository {
  Future<List<DiameterModel>> fetchDiameters();
}
