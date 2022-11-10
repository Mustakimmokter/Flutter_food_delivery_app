import 'package:flutter/material.dart';

class ProviderStateOne extends ChangeNotifier {
  int _foodItemsIndex = 0;
  int _navBarIndex = 0;

  int get foodItemsIndex => _foodItemsIndex;
  int get navBarIndex => _navBarIndex;

  void getTrueFalse(int index, String? val) {
    val == 'navBar'
        ? _navBarIndex = index
        : val == 'foodItems'
            ? _foodItemsIndex = index
            : null;
    notifyListeners();
  }
}
