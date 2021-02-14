import 'package:devs/core/models/dev.dart';

abstract class IDevsDataSource {
  Future<List<Dev>> getDevs();
}