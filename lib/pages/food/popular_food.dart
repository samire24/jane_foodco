import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_foodco/utils/dimension.dart';
import 'package:jane_foodco/widgets/app_column.dart';
import 'package:jane_foodco/widgets/app_icon.dart';
import 'package:jane_foodco/widgets/big_text.dart';
import 'package:jane_foodco/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //backgroud image
          Positioned(
            left: 0.0,
            right: 0.0,
            child: Container(
              height: Dimensions.popularFoodImgSize,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("asset/image/food8.png"),
              )),
            ),
          ),
          //icon widegts
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.add_shopping_cart_outlined),
                ],
              )),
          //introduction of fodds
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.popularFoodImgSize - 20,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppColumn(
                      text: 'Ghana Cuisine',
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text:
                                  " in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,"
                          ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            right: Dimensions.width20,
            left: Dimensions.width20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
          color: AppColors.buttonBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  right: Dimensions.width20,
                  left: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(
                    text: "0",
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  right: Dimensions.width20,
                  left: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: BigText(
                text: "\$10 | Add to Cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
