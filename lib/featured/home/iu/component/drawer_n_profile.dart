import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/svg.dart';

class DrawerNProfile extends StatelessWidget {
  const DrawerNProfile({super.key, required this.profile});
  final VoidCallback profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(
                'assets/icons/menu_drawer.svg',
              ),
            ),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          const CustomTextOne(text: 'Mustakim, Dhaka'),
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
