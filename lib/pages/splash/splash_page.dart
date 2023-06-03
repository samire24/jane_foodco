import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jane_foodco/routes/route_helper.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utils/dimension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
     await Get.find<PopularProductController>().getPopularProductList();
     await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResources;
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2))..forward();

    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.linear
    );

    Timer(Duration(seconds: 3),
        ()=>Get.offNamed(RouteHelper.getInitial())
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("asset/image/foodlogo.png",width: Dimensions.splashImg,)),
          //Center(child: Image.asset("asset/image/logo2.jpg",width: Dimensions.splashImg,)),
        ],
      ),
    );
  }
}
