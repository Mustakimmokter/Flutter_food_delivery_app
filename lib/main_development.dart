import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_food_app1/app/app.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await dotenv.load(fileName: '.env.development');
  runApp(const App());
}
