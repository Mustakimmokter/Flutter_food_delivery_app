import 'package:flutter/material.dart';
import 'package:flutter_food_app1/featured/home/index.dart';
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
          // home: const MyHomePage(
          //   title: 'value',
          // ),
          initialRoute: '/',
          onGenerateRoute: AppRoute.ongenerateRoute,
        );
      },
    );
  }
}
