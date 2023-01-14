import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/splash_screen/ui/component/splash_body.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenOne extends StatelessWidget {
  const SplashScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SplashBody(
        headers: 'Find your favorite food\nfrom top restaurants',
        swipe: (){
          Navigator.pushNamed(context, '/splashTwo');
        },
        illustration: 'assets/start_illus/start_1.svg',
      ),
    );
  }
}
