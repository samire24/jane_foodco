import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_foodco/utils/dimension.dart';
import 'package:jane_foodco/widgets/app_icon.dart';
import 'package:jane_foodco/widgets/big_text.dart';
import 'package:jane_foodco/widgets/expandable_text_widget.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(15),
              child: Container(
                child: Center(
                  child: BigText(text: "Ghana Cuisine", size: Dimensions.font26,),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.blue,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("asset/image/food5.png",
              width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: Dimensions.width20,left: Dimensions.width20),
                  child: ExpandableTextWidget(
                     text:"in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onionsin a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onionsin a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions,Chicken marinated in a spiced yoghurt is placed in large pot ,then layered with fried onions",
                    ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
