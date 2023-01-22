import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/cart/ui/screen/cart_screen.dart';
import 'package:flutter_food_app1/featured/favorite/ui/screen/favorite_screen.dart';
import 'package:flutter_food_app1/featured/home/iu/component/body.dart';
import 'package:flutter_food_app1/featured/offer/ui/screen/offer_screen.dart';


class NavBerProvider extends ChangeNotifier {

  final List<Widget> _screen = [
    const HomeScreenBody(),
    const OfferScreen(),
    const CartScreen(),
    const FavoriteScreen()
  ];

  int _selectedScreenIndex = 0;



  int get selectedScreenIndex => _selectedScreenIndex;

  List<Widget> get screen => _screen;



  void getSelectedScreen(BuildContext context,int index) {
    index == 2
        ? Navigator.pushNamed(context, '/cart')
        : index == 0?_selectedScreenIndex = 0:
    _selectedScreenIndex = index;
    notifyListeners();
  }


}
