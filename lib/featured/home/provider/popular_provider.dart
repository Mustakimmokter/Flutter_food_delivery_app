import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/models/index.dart';
import 'package:flutter_food_app1/shared/models/list_models.dart';

class PopularFoodProvider extends ChangeNotifier{

  int _currentIndex = 0;
  final List<PopularFoods> _foodList = ModelList.getPopularFoods();

  int get currentIndex => _currentIndex;
  List<PopularFoods> get foodList => _foodList;

  void getOnChange(int index){
    _currentIndex = index;
    notifyListeners();
  }


}