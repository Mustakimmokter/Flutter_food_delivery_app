import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class IncreaseBtn extends StatelessWidget {
  const IncreaseBtn({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const CustomContainer(
        radius: 05,
        height: 25,
        width: 25,
        color: Colors.deepOrange,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}
