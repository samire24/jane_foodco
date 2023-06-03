import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:jane_foodco/pages/cart/cart_page.dart';
import 'package:jane_foodco/pages/food/popular_food.dart';
import 'package:jane_foodco/pages/food/recommended_food.dart';
import 'package:jane_foodco/pages/splash/splash_page.dart';

import '../pages/home/home_page.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splashPage = "/splash-page";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommneded-food";
  static const String cartPage = "/cart-page";

  static String getInitial()=>'$initial';
  static String getSplashPage()=>'$splashPage';
  static String getPopularFood(int pageId, String page)=>'$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId)=>'$recommendedFood?pageId = $pageId';
  static String getCartPage()=>'$cartPage';

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=>HomePage()),
    GetPage(name: splashPage, page: ()=>SplashScreen()),

    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return PopularFoodDetail(pageId: int.parse(pageId!), page:page!);
    },
    transition: Transition.fadeIn
    ),

    // GetPage(name: recommendedFood, page: (){
    //   var pageId = Get.parameters['pageId'];
    //   return RecommendedFoodDetails(pageId: int.parse(pageId!));
    // },
    // transition: Transition.fadeIn
    // ),

    GetPage(name: cartPage, page: (){
      return CartPage();
    },
    transition: Transition.fadeIn
    ),
  ];

}