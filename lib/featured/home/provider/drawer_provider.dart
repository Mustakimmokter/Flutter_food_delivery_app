import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  int _colorIndex = 0;

  int get colorIndex => _colorIndex;

  void getColorIndex(int index) {
    _colorIndex = index;
    notifyListeners();
  }
}
