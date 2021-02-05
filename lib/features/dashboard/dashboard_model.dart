import 'package:flutter/material.dart';

class DashboardModel extends ChangeNotifier {
  int selectedPageIndex = 0;

  void setSelectedPageIndex(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }
}
