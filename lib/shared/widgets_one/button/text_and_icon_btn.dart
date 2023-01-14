import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextAndIconBtn extends StatelessWidget {
  const TextAndIconBtn({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final VoidCallback onTap;
  final String title, icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextOne(
            text: title,
            //textDecoration: TextDecoration.underline,
            textColor: Colors.deepOrangeAccent,
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(icon),
        ],
      ),
    );
  }
}
