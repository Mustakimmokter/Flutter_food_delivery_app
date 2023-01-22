import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/favorite/provider/favortie_provider.dart';
import 'package:flutter_food_app1/featured/favorite/ui/component/favorite_items.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
              const SizedBox(height: 20),
              // Favorite items
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Consumer<FavoriteProvider>(
                      builder: (context, favoriteProvider, child) {
                        return favoriteProvider.foodList.isEmpty || favoriteProvider.foodList == null?
                        const Padding(
                          padding: EdgeInsets.only(top: 190),
                          child: Center(child: CustomTextOne(text: 'No Favorite items'),),
                        ) :
                        Column(
                          children: List.generate(
                              favoriteProvider.foodList.length, (index) {
                            final favorite = favoriteProvider.foodList[index];
                            return FavoriteItems(
                              index: index,
                              foodItem: favorite.foodItem,
                              foodName: favorite.foodName,
                              foodQuantity: favorite.quantity,
                              foodPrice: (favorite.price! * favorite.quantity).toStringAsFixed(2),
                             deleteFavorite: (){
                                favoriteProvider.removeFavoriteItem('dismiss', index);
                             },
                              dismissKey: index,
                              onDismissible: (DismissDirection dismiss){
                                favoriteProvider.removeFavoriteItem('dismiss', index);
                              },
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

