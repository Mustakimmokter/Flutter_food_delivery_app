import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/button/text_and_icon_btn.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
    required this.headers,
    required this.illustration,
    this.skip,
    required this.swipe,
  });

  final String headers, illustration;
  final VoidCallback? skip;
  final VoidCallback swipe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeUtils.screenWidth,
      height: SizeUtils.screenHeight,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 16, top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Skip
            Padding(
              padding: const EdgeInsets.only(right: 05),
              child: CustomTextBtn(
                  text: 'Skip',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
              ),
            ),
            // Header
            Align(
              child: CustomTextOne(
                textAlign: TextAlign.center,
                text: headers,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextAndIconBtn(onTap: swipe, title: 'Swipe',icon: 'assets/icons/arrow.svg'),
            // Illustration
            SvgPicture.asset(
              illustration,
              height: 290,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
