import 'package:flutter/material.dart';
import 'package:flutter_food_app1/provider/true_false/provider_state_one.dart';
import 'package:flutter_food_app1/shared/models/list_models.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FoodItems extends StatelessWidget {
  FoodItems({super.key});

  final PageController foodItemController =
      PageController(viewportFraction: 0.22, initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderStateOne>(
      builder: (context, providerStateOne, child) {
        return SizedBox(
          height: 130,
          width: double.infinity,
          child: PageView.builder(
            controller: foodItemController,
            itemCount: ModelList.getFoodItemList().length,
            padEnds: false,
            //pageSnapping: false,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      child: CustomContainer(
                        margin: const EdgeInsets.only(top: 17, bottom: 12),
                        color: index == providerStateOne.foodItemsIndex
                            ? const Color(0xffFEFBF3)
                            : Colors.white,
                        width: 60,
                        height: 60,
                        radius: 12,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            color: Colors.grey.shade300,
                            offset: const Offset(1, 1),
                          ),
                        ],
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            ModelList.getFoodItemList()[index].foodItem,
                            color: const Color(0xff717171),
                          ),
                        ),
                      ),
                      onTap: () {
                        providerStateOne.getTrueFalse(index, 'foodItems');
                        print(index);
                      },
                    ),
                    CustomTextOne(
                      text: ModelList.getFoodItemList()[index].foodName,
                      fontSize: 14,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
