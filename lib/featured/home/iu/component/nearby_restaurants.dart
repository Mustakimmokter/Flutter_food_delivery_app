import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/models/index.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NearByRestaurants extends StatelessWidget {
  NearByRestaurants(
      {super.key,
      required this.selectedIndex,
      required this.addToFav,
      required this.title,
      required this.ratting,
      required this.time,
      required this.distance, required this.onChange,
        required this.restaurantList,
      });
  final int selectedIndex;
  final Function(int) addToFav, onChange;
  final String title, ratting, time, distance;
  final List<NearRestaurants> restaurantList;

  final PageController pageController = PageController(
    viewportFraction: .80,
    keepPage: false,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.getProportionateScreenHeight(145),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
            right: selectedIndex ==
                    restaurantList.length - 1
                ? 20
                : 0,
        ),
        child: PageView.builder(
          controller: pageController,
          itemCount: restaurantList.length,
          padEnds: false,
          onPageChanged: onChange,
          itemBuilder: (context, index) {
            return CustomContainer(
              margin: const EdgeInsets.only(
                left: 20,
                top: 16,
                bottom: 16,
              ),
              padding: const EdgeInsets.all(10),
              radius: 10,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.grey.shade300,
                  offset: const Offset(1, 1),
                ),
              ],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    restaurantList[index].logo,
                    height: 70,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextOne(
                              text: restaurantList[index].name,
                              fontWeight: FontWeight.w500,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Colors.deepOrange,
                              size: 20,
                            ),
                          ],
                        ),
                        CustomTextOne(
                          text: title,
                          textColor: Colors.grey,
                          fontSize: 13,
                        ),
                        const SizedBox(height: 03),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xffFFB200),
                              size: 16,
                            ),
                            CustomTextOne(
                              text: ratting,
                              textColor: Colors.grey,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        const SizedBox(height: 04),
                        Row(
                          children: [
                            _deliveryTimeWidget(distance),
                            const SizedBox(width: 06),
                            _deliveryTimeWidget(time),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _deliveryTimeWidget(String text) {
    return CustomContainer(
      padding: const EdgeInsets.symmetric(horizontal: 05, vertical: 02),
      color: Colors.grey.shade200,
      child: CustomTextOne(
        text: text,
        textColor: Colors.grey,
        fontSize: 13,
      ),
    );
  }
}
