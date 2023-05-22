import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jane_foodco/controllers/popular_product_controller.dart';
import 'package:jane_foodco/controllers/recommended_product_controller.dart';
import 'package:jane_foodco/pages/cart/cart_page.dart';
import 'package:jane_foodco/utils/app_constants.dart';
import 'package:jane_foodco/utils/colors.dart';
import 'package:jane_foodco/utils/dimension.dart';
import 'package:jane_foodco/widgets/app_icon.dart';
import 'package:jane_foodco/widgets/big_text.dart';
import 'package:jane_foodco/widgets/expandable_text_widget.dart';

import '../../controllers/cart_controller.dart';
import '../../routes/route_helper.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:(){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.clear,
                  ),
                ),
                GetBuilder<PopularProductController>(builder: (controller){
                  return Stack(
                    children: [
                      AppIcon(icon: Icons.add_shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems>=1? Positioned(
                        right: 0,
                        top: 0,
                        child: GestureDetector(
                          onTap:(){
                            // Get.to(()=>CartPage());
                          },
                          child: AppIcon(icon: Icons.circle, size: 20,iconColor: Colors.transparent,
                            backGroundColor: AppColors.mainColor,),
                        ),
                      ): Container(),
                      Get.find<PopularProductController>().totalItems>=1? Positioned(
                        right: 3,
                        top: 3,
                        child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                          size: 12,
                          color: Colors.white,),
                      ): Container(),

                    ],
                  );
                }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(15),
              child: Container(
                child: Center(
                  child: BigText(
                    text: product.name!,
                    size: Dimensions.font26,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    )),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.blue,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
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
                  margin: EdgeInsets.only(
                      right: Dimensions.width20, left: Dimensions.width20),
                  child: ExpandableTextWidget(
                      text:product.description!
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
          //using mainaxisSize here will  help use the minimum space
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20*2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      //controller.setQuantity(false);
                    },
                    child: AppIcon(
                      icon: Icons.remove,
                      backGroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  BigText(text: "\$ ${product.price!}  X ${controller.inCartItems} ",
                    color: AppColors.mainBlackColor,size: Dimensions.font26,),
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                      icon: Icons.add,
                      backGroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.addItem(product);
                    },
                    child: Container(
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
                        text: "\$ ${product.price!} | Add to Cart",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        );
      }),
    );
  }
}
