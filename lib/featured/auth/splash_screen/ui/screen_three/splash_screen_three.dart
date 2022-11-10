import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenThree extends StatelessWidget {
  const SplashScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 16, top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 05),
              child: GestureDetector(
                child: const CustomTextOne(
                  text: 'Skip',
                  //textDecoration: TextDecoration.underline,
                  textColor: Colors.deepOrangeAccent,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
            const Align(
              child: CustomTextOne(
                textAlign: TextAlign.center,
                text: 'Enjoy delicious foods\n and have fun',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTextOne(
                    text: 'Swipe',
                    //textDecoration: TextDecoration.underline,
                    textColor: Colors.deepOrangeAccent,
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset('assets/icons/arrow.svg'),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            SizedBox(
              width: double.maxFinite,
              height: 260,
              child: SvgPicture.asset(
                'assets/start_illus/start_3.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
