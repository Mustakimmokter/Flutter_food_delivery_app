import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/svg.dart';

class OrderSuccessful extends StatelessWidget {
  const OrderSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              SvgPicture.asset('assets/icons/success.svg',
                height: SizeUtils.getProportionateScreenHeight(180),
              ),
              const SizedBox(height: 30),
              const CustomTextOne(text: 'Thank you for\nYour order',
              textAlign: TextAlign.center,
              textColor: brandColor,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 20),
              const CustomTextOne(text: 'You can check the delivery\nin order section',
              textAlign: TextAlign.center,),
            ],
          ),
          Column(
            children: [
              CustomBtn(
                height: 50,
                text: 'Track my order',
                borderRadius: 50,
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, '/track', (route) => false);
                },
              ),
              const SizedBox(height: 20),
              const CustomTextOne(text: 'Order something else'),
            ],
          ),
        ],
      ),
    );
  }
}
