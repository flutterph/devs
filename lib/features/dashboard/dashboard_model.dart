import 'dart:async';

import 'package:devs/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/models/dev.dart';
import '../../core/repositories/devs_repository.dart';

const _DEBOUNCE_TIME = 300;

class DashboardModel extends ChangeNotifier {
  DashboardModel(this.devsRepository) {
    _search.add(""); // Initial data
  }

  final IDevsRepository devsRepository;

  int selectedPageIndex = 0;

// TODO: Use RxDart Subjects
  StreamController<String> _search = StreamController();

  Stream<List<Dev>> getDevs() {
    return _search.stream
        .debounceTime(Duration(milliseconds: _DEBOUNCE_TIME))
        .asyncMap((query) async {
      List<Dev> devsList = await devsRepository.getDevs();
      return query.isEmpty
          ? devsList
          : devsList
              .where((dev) =>
                  // TODO: Improve null safety efficiency, maybe utilizing extension function
                  (dev.name?.containsIgnoreCase(query) ?? false) ||
                  (dev.about?.containsIgnoreCase(query) ?? false) ||
                  (dev.username?.containsIgnoreCase(query) ?? false) ||
                  (dev.roles?.any((String role) =>
                          role?.containsIgnoreCase(query) ?? false) ??
                      false) ||
                  (dev.socials?.facebook?.containsIgnoreCase(query) ?? false) ||
                  (dev.socials?.linkedin?.containsIgnoreCase(query) ?? false) ||
                  (dev.socials?.twitter?.containsIgnoreCase(query) ?? false))
              .toList();
    });
  }

  void search(String query) {
    _search.add(query);
  }

  void setSelectedPageIndex(int index) {
    selectedPageIndex = index;
    // TODO: Add a switch statement to handle stream switching when selecting page
    notifyListeners();
  }

  @override
  void dispose() {
    _search.close();
    super.dispose();
  }
}
