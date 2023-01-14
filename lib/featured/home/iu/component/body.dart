import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/home/iu/component/index.dart';
import 'package:flutter_food_app1/featured/home/provider/nearby_rstnt.dart';
import 'package:flutter_food_app1/featured/home/provider/popular_provider.dart';
import 'package:flutter_food_app1/featured/profile/provider/profile_provider.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:provider/provider.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final nearRstProvider = Provider.of<NearState>(context);
    final popularFoodsProvider = Provider.of<PopularFoodProvider>(context);
    return Column(
      children: [
        // Header
        Header(
          userInfo: 'Mustakim, Narsingdi',
          drawer: () {
                Scaffold.of(context).openDrawer();
              },
          profile: (){

                Navigator.pushNamed(context, '/profile');
                profileProvider.getUserProfile();
                // print('Length: ${profileProvider.albums.length}');
              },
            ),
        // body
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search And Filter
                SearchAndFilter(
                  onSearch: (){
                    print('search');
                  },
                  onChange: (value){},
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
                PopularFoodsList(
                  currentIndex: popularFoodsProvider.currentIndex,
                  foodList: popularFoodsProvider.foodList,
                  addCart: (index){},
                  addToFav: (index){},
                  onChange: (index){
                    popularFoodsProvider.getOnChange(index);
                  },
                ),
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
                NearByRestaurants(
                 ratting: '4.5(180)',
                  restaurantList: nearRstProvider.restaurantList,
                  onChange: (index){
                   nearRstProvider.onChange(index);
                  },
                  addToFav: (index){},
                  selectedIndex: nearRstProvider.nearRstIndex,
                  title: 'Fast Food',
                  distance: '2.0 km',
                  time: '30 mins',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
