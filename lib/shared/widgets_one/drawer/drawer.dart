import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/models/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer(
      {super.key, required this.onTap, this.color, required this.colorIndex});

  final Function(int) onTap;
  final Color? color;
  final int colorIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        _titleAndIcon().length,
        (index) => IconAndTextBtn(
          icon: _titleAndIcon()[index].icon!,
          title: _titleAndIcon()[index].title!,
          color: colorIndex == index ? color : Colors.black87,
          onTap: () {
            onTap(index);
          },
        ),
      ),
    );
  }

  List<TitleAndIcon> _titleAndIcon() {
    final _titleAndIconList = [
      TitleAndIcon(title: 'Home', icon: 'assets/icons/drawer_icons/home.svg'),
      TitleAndIcon(
          title: 'Setting', icon: 'assets/icons/drawer_icons/settings.svg'),
      TitleAndIcon(
          title: 'Tracking Order',
          icon: 'assets/icons/drawer_icons/tracking.svg'),
      TitleAndIcon(
          title: 'Wishlist', icon: 'assets/icons/drawer_icons/heart.svg'),
      TitleAndIcon(
          title: 'Terms and Conditions',
          icon: 'assets/icons/drawer_icons/terms.svg'),
      TitleAndIcon(
          title: 'About Us', icon: 'assets/icons/drawer_icons/attention.svg'),
      TitleAndIcon(title: 'Help', icon: 'assets/icons/drawer_icons/help.svg')
    ];

    return _titleAndIconList;
  }
}
