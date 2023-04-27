import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jane_foodco/pages/food/popular_food.dart';
import 'package:jane_foodco/pages/food/recommended_food.dart';
import 'package:jane_foodco/pages/home/food_page_body.dart';
import 'package:jane_foodco/pages/home/main_food_page.dart';
import 'package:jane_foodco/pages/home/main_food_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const RecommendedFoodDetails( ),
    );
  }
}