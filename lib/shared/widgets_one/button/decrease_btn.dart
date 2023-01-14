import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class DecreaseBtn extends StatelessWidget {
  const DecreaseBtn({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const CustomContainer(
        radius: 05,
        height: 25,
        width: 25,
        borderWidth: 2,
        color: Colors.transparent,
        borderColor: Colors.grey,
        child: Icon(
          Icons.remove,
          size: 16,
        ),
      ),
    );
  }
}
