import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/models/list_models.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NearByRestaurants extends StatelessWidget {
  NearByRestaurants({super.key});

  final PageController pageController = PageController(
    viewportFraction: .80,
    keepPage: false,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.getProportionateScreenHeight(145),
      width: double.infinity,
      child: PageView.builder(
        controller: pageController,
        itemCount: ModelList.getNearRestaurants().length,
        padEnds: false,
        itemBuilder: (context, index) {
          return CustomContainer(
            margin: EdgeInsets.only(
              left: index == ModelList.getNearRestaurants().length - 1 ? 0 : 20,
              top: 16,
              bottom: 16,
              right:
                  index == ModelList.getNearRestaurants().length - 1 ? 20 : 0,
            ),
            padding: EdgeInsets.all(10),
            radius: 10,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.grey.shade300,
                offset: Offset(1, 1),
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
                      width: SizeUtils.getProportionateScreenWidth(175),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextOne(
                            text: ModelList.getNearRestaurants()[index].name,
                            fontWeight: FontWeight.w500,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          const Icon(Icons.favorite, color: Colors.deepOrange),
                        ],
                      ),
                    ),
                    const CustomTextOne(
                      text: r'$$ Fast Food, Pizza Hut',
                      textColor: Colors.grey,
                      fontSize: 14,
                    ),
                    const SizedBox(height: 03),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFB200),
                          size: 16,
                        ),
                        CustomTextOne(
                          text: '4.5(180)',
                          textColor: Colors.grey,
                          fontSize: 14,
                        ),
                      ],
                    ),
                    const SizedBox(height: 04),
                    Row(
                      children: [
                        CustomContainer(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 05, vertical: 02),
                          color: Colors.grey.shade200,
                          child: const CustomTextOne(
                            text: '2.0 km',
                            textColor: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 06),
                        CustomContainer(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 05, vertical: 02),
                          color: Colors.grey.shade200,
                          child: const CustomTextOne(
                            text: '30 mins',
                            textColor: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
