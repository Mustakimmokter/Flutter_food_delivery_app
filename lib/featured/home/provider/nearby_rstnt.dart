import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app1/shared/models/index.dart';
import 'package:flutter_food_app1/shared/models/list_models.dart';


 class NearState extends NearRestaurantProvider{

}

class NearRestaurantProvider extends ChangeNotifier{

  final List<NearRestaurants> _restaurantList = ModelList.getNearRestaurants();
  int _nearRstIndex = 0;


  List<NearRestaurants> get restaurantList => _restaurantList;
  int get nearRstIndex => _nearRstIndex;


  void onChange(int index){
    _nearRstIndex = index;
    notifyListeners();
  }



}
class NearRestaurant extends ChangeNotifier{

  final List<NearRestaurants> _restaurantList = ModelList.getNearRestaurants();
  int _nearRstIndex = 0;


  List<NearRestaurants> get restaurantList => _restaurantList;
  int get nearRstIndex => _nearRstIndex;


  void onChange(int index){
    _nearRstIndex = index;
    notifyListeners();
  }



}

class NEar extends ChangeNotifier{}