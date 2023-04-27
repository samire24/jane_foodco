import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_foodco/pages/home/food_page_body.dart';
import 'package:jane_foodco/utils/dimension.dart';
import 'package:jane_foodco/widgets/big_text.dart';
import 'package:jane_foodco/widgets/small_text.dart';

import '../../utils/colors.dart';


class MainFoodPage extends StatefulWidget {
  MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is"+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            // padding: const EdgeInsets.only(top: 15.0, right: 5.0),
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Ghana", color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "Accra", color: Colors.black45,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: Dimensions.height45,
                    width: Dimensions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,
                    ),
                    child: Icon(Icons.search, color: Colors.white,size: Dimensions.iconSize24,),
                  )
                ],
              ),
            ),
          ),
          //showing the body
          Expanded(

              child: SingleChildScrollView(

                  child: FoodBodyPage())),
        ],
      ),
    );
  }
}
