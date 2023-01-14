import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/svg.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize = 30,
    required this.selectedValue,
    required this.groupValue,
    required this.onChange,
    required this.onTap,
    this.paymentValue,
  });
  final String icon;
  final Widget text;
  final double? iconSize;
  final dynamic groupValue, selectedValue,paymentValue;
  final Function(dynamic) onChange;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        padding: const EdgeInsets.symmetric(horizontal: 03),
        borderWidth:  selectedValue == groupValue? 1.5:0,
        borderColor: selectedValue == groupValue? brandColor:Colors.transparent,
        radius: 06,
        color: Colors.white,
        child: Row(
          children: [
            Radio(
              value: selectedValue,
              activeColor: brandColor,
              groupValue: groupValue,
              onChanged: onChange,
            ),
            SvgPicture.asset(
              icon,
              height: iconSize,
            ),
            const SizedBox(width: 14),
            text,
          ],
        ),
      ),
    );
  }
}
