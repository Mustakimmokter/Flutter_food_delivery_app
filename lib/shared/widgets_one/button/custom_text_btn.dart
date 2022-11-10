import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class CustomTextBtn extends StatelessWidget {
  const CustomTextBtn({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomTextOne(
        fontSize: 15,
        text: text,
        textColor: Colors.deepOrange,
      ),
    );
  }
}
