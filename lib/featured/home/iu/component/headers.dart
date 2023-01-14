import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.profile,
    required this.drawer,
    required this.userInfo,
  });

  final VoidCallback profile, drawer;
  final String userInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: drawer,
            child: SizedBox(
              height: 22,
              width: 22,
              child: SvgPicture.asset(
                'assets/icons/menu_drawer.svg',
              ),
            ),
          ),
          CustomTextOne(text: userInfo),
          GestureDetector(
            onTap: profile,
            child: const CustomContainer(
              height: 35,
              width: 35,
              borderColor: Colors.deepOrangeAccent,
              borderWidth: 1.5,
              decorationImage: DecorationImage(
                image: AssetImage('assets/images/300_by_300_01.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
