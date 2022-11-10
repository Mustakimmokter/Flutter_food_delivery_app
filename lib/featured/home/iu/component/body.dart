import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/home/iu/component/index.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        DrawerNProfile(
          profile: () {
            print('profile');
          },
        ),
        // body
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search And Filter
                Padding(
                  padding: const EdgeInsets.only(top: 05, left: 20, right: 20),
                  child: SearchAndFilter(
                    filterTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        //backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        builder: (context) {
                          return SizedBox(
                              height:
                                  SizeUtils.getProportionateScreenHeight(640),
                              child: CustomFilter());
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 05),
                // Food items
                FoodItems(),
                // Popular food items Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomTextOne(
                        text: 'Popular Foods',
                      ),
                      CustomTextOne(
                        text: 'See All',
                        textColor: Colors.deepOrangeAccent,
                      ),
                    ],
                  ),
                ),
                // Popular food items
                PopularFoods(),
                // Nearby Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomTextOne(
                        text: 'Nearby Restaurant',
                      ),
                      CustomTextOne(
                        text: 'See All',
                        textColor: Colors.deepOrangeAccent,
                      ),
                    ],
                  ),
                ),
                //Nearby Restaurants
                NearByRestaurants(),
                NearByRestaurants(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
