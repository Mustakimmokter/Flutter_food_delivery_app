import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class CustomFlatBtn extends StatelessWidget {
  const CustomFlatBtn({
    super.key,
    this.onTap,
    this.child,
    this.textColor,
    this.iconColor,
    this.iconSize,
    this.textSize,
    this.icon,
    this.text,
    this.color,
  });
  final VoidCallback? onTap;
  final Widget? child;
  final Color? textColor, iconColor, color;
  final double? iconSize, textSize;
  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: child ??
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor ?? brandColor,
                size: iconSize ?? 30,
              ),
              CustomTextOne(
                text: text ?? '',
                fontSize: textSize ?? 14,
                textColor: textColor ?? brandColor,
              ),
            ],
          ),
    );
  }
}
