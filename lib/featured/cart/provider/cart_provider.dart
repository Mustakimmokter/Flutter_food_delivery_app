import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/models/popular_food/popular_foods.dart';
import 'package:flutter_food_app1/shared/utils/color_utils.dart';

class CartProvider extends ChangeNotifier {
  final List<PopularFoods> _foodList = [];


  List<PopularFoods> get foodList => _foodList;

  double totalPrice(int index){
    return _foodList[index].quantity * _foodList[index].price!;
  }


  void addCart(BuildContext context,{
    required PopularFoods food,
    required bool isExist,
  }){
    print(isExist);
    if(isExist){
      _foodList.add(food);
      notifyListeners();
      food.isCart = false;

    }else{
      print('Already exist');
    }
    final snackBar = SnackBar(
      content: isExist == true?
     const Text('The item added in the cart'):
     const Text('The following item is already exist'),
      backgroundColor: brandColor,
      elevation: 20,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }

  void getQuantity(String value, int index) {
    // value == '+'
    //     ? _foodList[index].quantity++
    //     : value == '-'
    //         ? _foodList[index].quantity < 1
    //             ? 0
    //             : _foodList[index].quantity--
    //         : 1;
    //
    if( value == '+'){
      _foodList[index].quantity++;
    }else if( value == '-'){
        _foodList[index].quantity--;
    }
    notifyListeners();
  }

  void removeCartItem(String dismiss,int index){
    if(dismiss == 'dismiss'){
      _foodList[index].isCart = true;
      _foodList[index].quantity = 1;
      _foodList.removeAt(index);

      notifyListeners();
    }else if(_foodList[index].quantity == 0){
      _foodList[index].isCart = true;
      _foodList[index].quantity = 1;
      _foodList.removeAt(index);

      notifyListeners();
    }
  }
}
