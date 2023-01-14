import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/models/list_models.dart';
import 'package:flutter_food_app1/shared/models/popular_food/popular_foods.dart';

class CartProvider extends ChangeNotifier {
  final _foodList = ModelList.getPopularFoods();

  List<PopularFoods> get foodList => _foodList;
  void getQuantity(String value, int index) {
    value == '+'
        ? _foodList[index].quantity++
        : value == '-'
            ? _foodList[index].quantity < 1
                ? 0
                : _foodList[index].quantity--
            : 1;

    notifyListeners();
  }
}
