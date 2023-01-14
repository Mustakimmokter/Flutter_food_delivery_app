import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/custom_text.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice(
      {super.key,
      required this.subtotal,
      required this.deliveryFee,
      required this.total,
      });

  final String subtotal, deliveryFee, total;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _titleAndPrice(title: 'Subtotal', text: subtotal),
        _titleAndPrice(title: 'Delivery Fee', text: deliveryFee),
        const Divider(
          thickness: 1.5,
        ),
        _titleAndPrice(title: 'Total',size: 18, text: total),
      ],
    );
  }

  Widget _titleAndPrice({
    required String title, required String text,double? size,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _text(
          fontSize: size,
          text: title,
        ),
        _text(
          fontSize: size,
          text: text,
        ),
      ],
    );
  }

  Widget _text({
    required String text,double? fontSize,
  }){
    return  CustomTextOne(
      fontSize: fontSize,
      text: text,
      fontWeight: FontWeight.w500,
      textOverflow: TextOverflow.ellipsis,
    );
  }
}
