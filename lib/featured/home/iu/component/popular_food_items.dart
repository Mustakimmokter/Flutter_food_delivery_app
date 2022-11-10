import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/models/list_models.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularFoods extends StatelessWidget {
  PopularFoods({super.key});

  final PageController pageController = PageController(
    viewportFraction: .55,
    keepPage: false,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      width: double.infinity,
      child: PageView.builder(
        itemCount: ModelList.getPopularFoods().length,
        controller: pageController,
        padEnds: false,
        itemBuilder: (context, index) {
          return CustomContainer(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(
              left: 20,
              bottom: 20,
              top: 14,
            ),
            radius: 10,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.grey.shade300,
                offset: const Offset(1, 1),
              ),
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.favorite, color: Colors.redAccent),
                ),
                SvgPicture.asset(
                  ModelList.getPopularFoods()[index].foodItem,
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextOne(
                          text: ModelList.getPopularFoods()[index].foodName,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 04),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Color(0xffFFB200),
                              size: 16,
                            ),
                            CustomTextOne(
                              text: '4.5 Mc Donald',
                              textColor: Colors.grey,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        const SizedBox(height: 04),
                        const CustomTextOne(
                          text: '\$9',
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    CustomBtn(
                      height: 22,
                      width: 22,
                      backgroundColor: Colors.deepOrangeAccent,
                      onPressed: () {},
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
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
