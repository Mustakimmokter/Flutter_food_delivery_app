import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/home/index.dart';
import 'package:flutter_food_app1/shared/models/list_models.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brandSecondaryColor,
      body: SizedBox(
        height: SizeUtils.screenHeight,
        width: SizeUtils.screenWidth,
        child: Padding(
          padding: const EdgeInsets.only(top: 60, bottom: 30, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // back
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomBackBtn(
                  onTap: () {
                    Navigator.pop(context);
                    NavBerProvider().selectedIndex;
                  },
                  title: 'My Cart',
                ),
              ),
              const SizedBox(height: 20),
              // Cart
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: List.generate(
                          ModelList.getPopularFoods().length, (index) {
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

                              //confirmDismiss: (){},
                              child: CustomContainer(
                                margin: const EdgeInsets.only(bottom: 20),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 08,
                                ),
                                radius: 10,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          ModelList.getPopularFoods()[index]
                                              .foodItem!,
                                          height: 60,
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomTextOne(
                                              text: ModelList.getPopularFoods()[
                                                      index]
                                                  .foodName!,
                                              fontWeight: FontWeight.w500,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                            CustomTextOne(
                                              text:
                                                  '\$${ModelList.getPopularFoods()[index].price!}',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        CustomContainer(
                                          radius: 05,
                                          height: 22,
                                          width: 22,
                                          borderWidth: 2,
                                          color: Colors.transparent,
                                          borderColor: Colors.grey,
                                          child: Icon(Icons.remove, size: 16),
                                        ),
                                        SizedBox(width: 05),
                                        CustomTextOne(
                                          text: '1',
                                          fontSize: 18,
                                        ),
                                        SizedBox(width: 05),
                                        CustomContainer(
                                          radius: 05,
                                          height: 22,
                                          width: 22,
                                          color: Colors.deepOrange,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              // Total price
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomContainer(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: SizeUtils.getProportionateScreenHeight(140),
                  color: Colors.white,
                  width: double.maxFinite,
                  radius: 12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTextOne(
                            text: 'Subtotal',
                            fontWeight: FontWeight.w500,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          CustomTextOne(
                            text: r'$34.20',
                            fontWeight: FontWeight.w500,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTextOne(
                            text: 'Delivery Fee',
                            fontWeight: FontWeight.w500,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          CustomTextOne(
                            text: r'$1.15',
                            fontWeight: FontWeight.w500,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTextOne(
                            text: 'Delivery Fee',
                            fontWeight: FontWeight.w500,
                            textOverflow: TextOverflow.ellipsis,
                            fontSize: 18,
                          ),
                          CustomTextOne(
                            text: r'$1.15',
                            fontWeight: FontWeight.w500,
                            textOverflow: TextOverflow.ellipsis,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomBtn(
                  height: 50,
                  borderRadius: 50,
                  text: 'Place Order',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
