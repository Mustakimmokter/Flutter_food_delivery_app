import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/models/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar(
      {super.key, required this.onTap, required this.selectIndex});

  final Function(int) onTap;
  final int selectIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return CustomFlatBtn(
          onTap: () {
            onTap(index);
          },
          icon: _titleAndIcon(selectIndex, index)[index].iconData,
          text: _titleAndIcon(selectIndex, index)[index].title,
          color: selectIndex == index
              ? Colors.deepOrangeAccent
              : const Color(0xff717171),
        );
      }),
    );
  }

  List<TitleAndIcon> _titleAndIcon(int pIndex, int vIndex) {
    final _titleAndIconList = [
      TitleAndIcon(
          title: 'Home',
          iconData: pIndex == vIndex ? Icons.home : Icons.home_outlined),
      TitleAndIcon(
          title: 'Offer',
          iconData: pIndex == vIndex
              ? Icons.local_offer
              : Icons.local_offer_outlined),
      TitleAndIcon(
          title: 'Cart',
          iconData: pIndex == vIndex
              ? Icons.shopping_bag
              : Icons.shopping_bag_outlined),
      TitleAndIcon(
          title: 'Favorite',
          iconData: pIndex == vIndex ? Icons.favorite : Icons.favorite_outline),
    ];
    return _titleAndIconList;
  }
}
