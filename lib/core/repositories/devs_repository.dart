import 'package:devs/core/datasource/local/devs_local_datasource.dart';
import 'package:devs/core/models/dev.dart';

abstract class IDevsRepository {
  Future<List<Dev>> getDevs();
}

class DevsRepository implements IDevsRepository {
  DevsRepository(this.localDataSource);

  final IDevsLocalDataSource localDataSource;

  @override
  Future<List<Dev>> getDevs() async {
    return localDataSource.getDevs();
  }
}
