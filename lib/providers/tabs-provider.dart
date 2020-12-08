import 'package:flutter/material.dart';

class TabsProvider with ChangeNotifier {
  int _selectedTab = 0;

  int get selectedTab {
    return _selectedTab;
  }
 void selectTab(int tabIndex){
    _selectedTab = tabIndex;
    notifyListeners();
  }

}
