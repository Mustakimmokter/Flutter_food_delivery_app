import 'package:flutter/material.dart';

class NavBerProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void getSelectedIndex(int index) {
    _selectedIndex = index;
    print(selectedIndex);
    notifyListeners();
  }
}
