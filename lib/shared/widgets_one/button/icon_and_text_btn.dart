import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/svg.dart';

class IconAndTextBtn extends StatelessWidget {
  const IconAndTextBtn(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.color});
  final String icon, title;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                icon,
                color: color,
              ),
              const SizedBox(width: 16),
              CustomTextOne(
                text: title,
                fontWeight: FontWeight.w500,
                textColor: color,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
