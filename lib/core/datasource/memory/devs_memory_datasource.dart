import 'package:devs/core/datasource/devs_datasource.dart';
import 'package:devs/core/models/dev.dart';

// FIXME: This seems redundant since streams stores the list internally
class DevsMemoryDataSource implements IDevsDataSource {

  List<Dev> _devList;

  @override
  Future<List<Dev>> getDevs() async {
    return _devList;
  }

  // TODO: Add a memory datasource abstract class for better polymorphism
  void setCache(List<Dev> devList) => _devList = devList;

}
