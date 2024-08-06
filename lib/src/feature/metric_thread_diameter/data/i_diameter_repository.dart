import 'dart:async';

import 'package:thread/src/feature/metric_thread_diameter/model/diameter.dart';


abstract class IDiameterRepository {
  Stream<List<Diameter>> diameterChanges();
  FutureOr<List<Diameter>> getDiameters();
  Future<List<Diameter>> fetchDiameters();
}
