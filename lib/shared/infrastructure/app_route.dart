import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/cart/ui/screen/cart_screen.dart';
import 'package:flutter_food_app1/featured/checkout/ui/screen/checkout_screen.dart';
import 'package:flutter_food_app1/featured/favorite/ui/screen/favorite_screen.dart';
import 'package:flutter_food_app1/featured/forget_password/ui/screen/forget_password_screen.dart';
import 'package:flutter_food_app1/featured/home/iu/screen/home_screen.dart';
import 'package:flutter_food_app1/featured/login/ui/screen/login_screen.dart';
import 'package:flutter_food_app1/featured/offer/ui/screen/offer_screen.dart';
import 'package:flutter_food_app1/featured/profile/ui/screen/profile_screen.dart';
import 'package:flutter_food_app1/featured/sign_up/ui/screen/sign_up_screen.dart';
import 'package:flutter_food_app1/featured/splash_screen/ui/index.dart';
import 'package:flutter_food_app1/featured/track_order/ui/screen/track_screen.dart';
import 'package:page_transition/page_transition.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return PageTransition<dynamic>(
          child: SplashScreenOne(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );
      case '/splashTwo':
        return PageTransition<dynamic>(
          child: SplashScreenTwo(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );
      case '/splashThree':
        return PageTransition<dynamic>(
          child: SplashScreenThree(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );
      case '/login':
        return PageTransition<dynamic>(
          child: LoginScreenOne(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );
      case '/signup':
        return PageTransition<dynamic>(
          child: SignUpScreenOne(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );
      case '/forgetPassword':
        return PageTransition<dynamic>(
          child: ForgetPassword(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );
      case '/home':
        return PageTransition<dynamic>(
          child: HomeScreen(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );
      case '/offer':
        return PageTransition<dynamic>(
          child: OfferScreen(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );
      case '/cart':
        return PageTransition<dynamic>(
          child: CartScreen(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );
      case '/checkout':
        return PageTransition(
            child: CheckoutScreen(),
            type: PageTransitionType.rightToLeft,
            settings: routeSettings);
      case '/favorite':
        return PageTransition<dynamic>(
          child: FavoriteScreen(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );
      case '/profile':
        return PageTransition(
          child: const ProfileScreen(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );
      case '/track':
        return PageTransition(
          child: TrackScreen(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );

      default:
        return PageTransition<dynamic>(
          child: LoginScreenOne(),
          type: PageTransitionType.rightToLeft,
          settings: routeSettings,
        );
    }
  }
}
