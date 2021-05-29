import 'package:flutter/material.dart';
import 'package:taskify/task_list/screens/add_task_screen.dart';
import 'package:taskify/vedant_task/slidebar.dart';
import 'package:taskify/views/tabs/dashboard.dart';
import 'package:taskify/views/tabs/peers.dart';
import 'package:taskify/views/tabs/profile.dart';
import 'package:taskify/views/tabs/status.dart';

class TabViews extends ChangeNotifier {
  int selectedIndex = 0;
  bool showBottomNavigationBar = true;
  void setTabView(int i) {
    selectedIndex = i;
    notifyListeners();
  }

  void setBottomNavigationBar(bool result) {
    showBottomNavigationBar = result;
    notifyListeners();
  }

  Widget getTabView(BuildContext context) {
    Widget ob;
    ob = AppContainer();
    switch (selectedIndex) {
      case 0:
        ob = AppContainer();
        break;
      case 1:
        ob = PeersTab();
        break;
      case 2:
        ob = StatusTab();
        break;
      case 3:
        ob = ProfileTab();
        break;
    }
    return ob;
  }
}
