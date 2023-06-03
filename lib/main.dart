import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jane_foodco/controllers/popular_product_controller.dart';
import 'package:jane_foodco/pages/cart/cart_page.dart';
import 'package:jane_foodco/pages/food/popular_food.dart';
import 'package:jane_foodco/pages/food/recommended_food.dart';
import 'package:jane_foodco/pages/home/food_page_body.dart';
import 'package:jane_foodco/pages/home/main_food_page.dart';
import 'package:jane_foodco/pages/home/main_food_page.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'routes/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.blue,
          ),
          //home: MainFoodPage(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}