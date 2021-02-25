import 'package:devs/core/datasource/local/devs_local_datasource.dart';
import 'package:devs/core/datasource/memory/devs_memory_datasource.dart';
import 'package:devs/core/models/dev.dart';

abstract class IDevsRepository {
  Future<List<Dev>> getDevs();
}

class DevsRepository implements IDevsRepository {
  DevsRepository(this.localDataSource, this.memoryDataSource)
      : assert(localDataSource != null || memoryDataSource != null);

  final DevsLocalDataSource localDataSource;
  final DevsMemoryDataSource memoryDataSource;

  @override
  Future<List<Dev>> getDevs() async {
    List<Dev> memory = await memoryDataSource.getDevs();
    if (memory == null) {
      List<Dev> local = await localDataSource.getDevs();
      memoryDataSource.setCache(local);
      return local;
    } else return memory;
  }
}
