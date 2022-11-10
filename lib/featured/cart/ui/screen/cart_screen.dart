import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/models/list_models.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.screenHeight,
      width: SizeUtils.screenWidth,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 60, bottom: 30, left: 20, right: 20),
        child: Column(
          children: [
            // back
            GestureDetector(
              onTap: () {},
              child: const CustomTextOne(text: 'Back'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(ModelList.getNearRestaurants().length,
                      (index) {
                    return CustomContainer(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(10),
                      radius: 10,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 05,
                          color: Colors.grey.shade100,
                          offset: const Offset(0.5, 0.5),
                        ),
                      ],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            ModelList.getNearRestaurants()[index].logo,
                            height: 73,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width:
                                    SizeUtils.getProportionateScreenWidth(175),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextOne(
                                      text:
                                          ModelList.getNearRestaurants()[index]
                                              .name,
                                      fontWeight: FontWeight.w500,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                    const Icon(
                                      Icons.favorite,
                                      color: Colors.deepOrange,
                                    ),
                                  ],
                                ),
                              ),
                              const CustomTextOne(
                                text: r'$12.40',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const CustomContainer(
              height: 120,
              color: Colors.white,
              width: double.maxFinite,
              radius: 12,
            ),
            const SizedBox(height: 30),
            CustomBtn(
              height: 50,
              borderRadius: 50,
              text: 'Place Order',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
