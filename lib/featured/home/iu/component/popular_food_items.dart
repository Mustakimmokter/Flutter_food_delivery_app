import 'package:flutter/material.dart';
import 'package:flutter_food_app1/shared/models/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularFoodsList extends StatelessWidget {
  PopularFoodsList({
    super.key,
    required this.currentIndex,
    required this.foodList,
    required this.onChange,
    required this.addToFav, required this.addCart,
    this.isFavorite = false,
  });
  final int currentIndex;
  final List<PopularFoods> foodList;
  final Function(int) onChange, addToFav, addCart;
  final bool? isFavorite;

  final PageController pageController = PageController(
    viewportFraction: .55,
    keepPage: false,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: currentIndex == (foodList.length - 2) ? 20 : 0,
      ),
      child: SizedBox(
        height: 255,
        width: double.infinity,
        child: PageView.builder(
          itemCount: foodList.length,
          controller: pageController,
          padEnds: false,
          onPageChanged: onChange,
          itemBuilder: (context, index) {
            //final scale = getCurrentIndex.currentIndex == index? 1.0: 0.8;
            return CustomContainer(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                // ignore: unrelated_type_equality_checks
                left: 20,
                // left: getCurrentIndex.isMargin? 20: 0,
                // right: getCurrentIndex.isMargin? 0: 20,
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
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      child: Icon(
                        isFavorite!? Icons.favorite_outline: Icons.favorite,
                        color: Colors.redAccent,
                        size: 22,
                      ),
                      onTap: () {
                        addToFav(index);
                      },
                    ),
                  ),
                  SvgPicture.asset(
                    foodList[index].foodItem!,
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
                            text: foodList[index].foodName!,
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
                          CustomTextOne(
                            text: '${foodList[index].price}',
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      CustomBtn(
                        height: 22,
                        width: 22,
                        backgroundColor: Colors.deepOrangeAccent,
                        onPressed: () {
                          addCart(index);
                        },
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
      ),
    );
  }
}
