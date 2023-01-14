import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/splash_screen/ui/component/splash_body.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';

class SplashScreenTwo extends StatelessWidget {
  const SplashScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      body: SplashBody(
        headers: 'Get fastest delivery\nat your door step',
        swipe: (){
          Navigator.pushNamed(context, '/splashThree');
        },
        illustration: 'assets/start_illus/start_2.svg',
      ),
    );
  }
}
