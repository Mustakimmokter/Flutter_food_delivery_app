import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/svg.dart';

class CartItems extends StatelessWidget {
  const CartItems(
      {super.key,
        required this.increaseItem,
        required this.decreaseItem,
        this.index,
        this.foodItem,
        this.foodName,
        this.foodQuantity,
        this.foodPrice,
      });

  final int? index,foodQuantity;
  final VoidCallback increaseItem, decreaseItem;
  final String? foodItem,foodName,foodPrice;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 30,
          bottom: 33,
          child: CustomContainer(
            height: 50,
            width: 50,
            color: Colors.deepOrange,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                'assets/icons/Trash.svg',
                color: Colors.white,
              ),
            ),
          ),
        ),
        Dismissible(
          key: Key(index.toString()),
          onDismissed: (DismissDirection value) {},
          direction: DismissDirection.endToStart,

          //confirmDismiss: onConfirm,
          child: CustomContainer(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 08,
            ),
            radius: 10,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      foodItem?? '',
                      height: 60,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextOne(
                          text: foodName ?? '',
                          fontWeight: FontWeight.w500,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 05),
                        CustomTextOne(
                          text:
                              foodPrice?? '',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
                // Quantity
                Row(
                  children: [
                    DecreaseBtn(
                      onTap: decreaseItem,
                    ),
                    const SizedBox(width: 05),
                    CustomTextOne(
                      text: foodQuantity.toString(),
                      fontSize: 18,
                    ),
                    const SizedBox(width: 05),
                    IncreaseBtn(
                      onTap: increaseItem,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
