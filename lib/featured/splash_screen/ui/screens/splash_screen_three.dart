import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/splash_screen/ui/component/splash_body.dart';


class SplashScreenThree extends StatelessWidget {
  const SplashScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SplashBody(
        headers: 'Enjoy delicious foods\n and have fun',
        swipe: (){
          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
        },
        illustration: 'assets/start_illus/start_3.svg',
      ),
    );
  }
}
