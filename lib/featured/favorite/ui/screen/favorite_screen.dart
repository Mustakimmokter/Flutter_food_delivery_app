import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomTextOne(text: 'Favorite'),
    );
  }
}
