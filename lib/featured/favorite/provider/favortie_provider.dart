import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/models/popular_food/popular_foods.dart';
import 'package:flutter_food_app1/shared/utils/color_utils.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<PopularFoods> _foodList = [];


  List<PopularFoods> get foodList => _foodList;

  void addFavorite(BuildContext context, {
    required PopularFoods food,
    required bool isFavorite,
  }) {
    print(isFavorite);
    if (isFavorite) {
      _foodList.add(food);
      notifyListeners();
      food.isFavorite = false;
    } else {
      print('Already exist');
    }
    final snackBar = SnackBar(
      content: isFavorite == true ?
      const Text('The item added in the favorite') :
      const Text('The following item is already exist'),
      backgroundColor: brandColor,
      elevation: 20,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  void removeFavoriteItem(String dismiss, int index) {
    if (dismiss == 'dismiss') {
      _foodList[index].isFavorite = true;
      _foodList.removeAt(index);
      notifyListeners();
    }
  }
}
