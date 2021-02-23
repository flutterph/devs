import 'package:flutter/material.dart';

import '../../core/models/dev.dart';
import '../../core/repositories/devs_repository.dart';

class DashboardModel extends ChangeNotifier {
  DashboardModel(this.devsRepository);

  final IDevsRepository devsRepository;

  int selectedPageIndex = 0;
  final List<Dev> _cacheDevs = [];
  Future<List<Dev>> getDevs() async {
    if (_cacheDevs.isEmpty) {
      _cacheDevs.addAll(
        await devsRepository.getDevs(),
      );
    }

    tempSearch = _cacheDevs;
    notifyListeners();
    return _cacheDevs;
  }

  void setSelectedPageIndex(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }

  void addCacheDevs(List<Dev> devs) {
    _cacheDevs.addAll(devs);
  }

  List<Dev> tempSearch = [];

  List<Dev> searchDevs(String search) {
    if (search.isEmpty) {
      tempSearch = _cacheDevs;
      notifyListeners();
      return tempSearch;
    }

    tempSearch = _cacheDevs
        .where(
          (dev) => dev.name.toLowerCase().contains(
                search.toLowerCase(),
              ),
        )
        .toList();

    notifyListeners();
    return tempSearch;
  }
}
