import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/cart/provider/cart_provider.dart';
import 'package:flutter_food_app1/featured/cart/ui/component/index.dart';
import 'package:flutter_food_app1/featured/home/index.dart';
import 'package:flutter_food_app1/shared/utils/index.dart';
import 'package:flutter_food_app1/shared/widgets_one/index.dart';
import 'package:provider/provider.dart';

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
                    NavBerProvider().getSelectedScreen(context,0);
                    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
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
                    child: Consumer<CartProvider>(
                      builder: (context, cartProvider, child) {
                        return cartProvider.foodList.isEmpty || cartProvider.foodList == null?
                        const Padding(
                          padding: EdgeInsets.only(top: 190),
                          child: Center(child: CustomTextOne(text: 'No cart items')),
                        ) :
                          Column(
                          children: List.generate(
                              cartProvider.foodList.length, (index) {
                                final getCart = cartProvider.foodList[index];
                            return CartItems(
                              index: index,
                              foodItem: getCart.foodItem,
                              foodName: getCart.foodName,
                              foodQuantity: getCart.quantity,
                              foodPrice: (cartProvider.totalPrice(index)).toStringAsFixed(2),
                              increaseItem: () {
                                cartProvider.getQuantity('+', index);
                              },
                              decreaseItem: () {
                                cartProvider..getQuantity('-', index)
                               ..removeCartItem('', index);
                              },
                              dismissKey: index,
                              onDismissible: (DismissDirection dismiss){
                                cartProvider.removeCartItem('dismiss', index);
                              },
                            );
                          }),
                        );
                      },
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
                  child: Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                      return TotalPrice(
                        subtotal: '30',
                        deliveryFee: r'$2.10',
                        total: r'$16.30',
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 45),
              // Footer button
              Consumer<CartProvider>(builder: (context, cartProvider, child) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CustomBtn(
                    height: 50,
                    borderRadius: 50,
                    backgroundColor: cartProvider.foodList.isEmpty || cartProvider.foodList == null?
                    Colors.grey.shade400 : brandColor,
                    text: 'Place Order',
                    onPressed: cartProvider.foodList.isEmpty || cartProvider.foodList == null?
                    null: () {
                  Navigator.pushNamed(context, '/checkout');
                  },
                  ),
                );
              },)
            ],
          ),
        ),
      ),
    );
  }
}
