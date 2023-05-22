import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jane_foodco/controllers/cart_controller.dart';
import 'package:jane_foodco/controllers/popular_product_controller.dart';
import 'package:jane_foodco/data/repository/cart_repo.dart';
import 'package:jane_foodco/data/repository/popular_food_repo.dart';
import 'package:jane_foodco/utils/app_constants.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/recommneded_product_repo.dart';

Future<void> init()async{
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());
  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

}