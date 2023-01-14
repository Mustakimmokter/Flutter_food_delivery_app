import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/cart/provider/cart_provider.dart';
import 'package:flutter_food_app1/featured/checkout/provider/payment_provider.dart';
import 'package:flutter_food_app1/featured/home/index.dart';
import 'package:flutter_food_app1/featured/home/provider/nearby_rstnt.dart';
import 'package:flutter_food_app1/featured/home/provider/popular_provider.dart';
import 'package:flutter_food_app1/featured/profile/provider/profile_provider.dart';
import 'package:flutter_food_app1/l10n/l10n.dart';
import 'package:flutter_food_app1/provider/true_false/provider_state_one.dart';
import 'package:flutter_food_app1/shared/infrastructure/app_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderStateOne>(
          create: (context) => ProviderStateOne(),
        ),
        ChangeNotifierProvider<DrawerProvider>(
          create: (context) => DrawerProvider(),
        ),
        ChangeNotifierProvider<NavBerProvider>(
          create: (context) {
            return NavBerProvider();
          },
        ),
        ChangeNotifierProvider<FilterProvider>(
          create: (context) {
            return FilterProvider();
          },
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) {
            return CartProvider();
          },
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) {
            return ProfileProvider();
          },
        ),
        ChangeNotifierProvider<NearState>(
            create: (context) {
          return NearState
        ();}),
        ChangeNotifierProvider<PopularFoodProvider>(
          create: (context) {
          return PopularFoodProvider();
        },),
        ChangeNotifierProvider<PaymentProvider>(
          create: (context) {
          return PaymentProvider();
        },),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          //home: ProfileScreen()
          initialRoute: '/',
          onGenerateRoute: AppRoute.onGenerateRoute,
        );
      },
    );
  }
}
