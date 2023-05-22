import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jane_foodco/controllers/cart_controller.dart';
import 'package:jane_foodco/pages/home/main_food_page.dart';
import 'package:jane_foodco/utils/app_constants.dart';
import 'package:jane_foodco/utils/colors.dart';
import 'package:jane_foodco/utils/dimension.dart';
import 'package:jane_foodco/widgets/app_icon.dart';
import 'package:jane_foodco/widgets/big_text.dart';
import 'package:jane_foodco/widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20*3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                AppIcon(icon: Icons.arrow_back_ios,
              backGroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconSize24,
              ),
                SizedBox(width: Dimensions.width20*5,),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>MainFoodPage());
                  },
                  child: AppIcon(icon: Icons.home_outlined,
              backGroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,

              ),
                ),
                AppIcon(icon: Icons.shopping_cart,
              backGroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconSize24,
              ),
            ],
          )),
          Positioned(
            top: Dimensions.height20*5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                color: Colors.white,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController){
                    return ListView.builder(
                        itemCount: cartController.getItems.length,
                        itemBuilder: (_, index){
                          return Container(
                            height: Dimensions.height20*5,
                            width: double.maxFinite,
                            color: Colors.blue,
                            child: Row(
                              children: [
                                Container(
                                  height: Dimensions.height20*5,
                                  width: Dimensions.height20*5,
                                  margin: EdgeInsets.only(bottom: Dimensions.height10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(Dimensions.radius20)
                                  ),
                                ),
                                Expanded(child: Container(
                                  height: Dimensions.height20*5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text: cartController.getItems[index].name!,color: Colors.black54,),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(text: cartController.getItems[index].price.toString(), color: Colors.redAccent,),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: Dimensions.height10,
                                                bottom: Dimensions.height10,
                                                right: Dimensions.width10,
                                                left: Dimensions.width10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap:(){
                                                    //popularProduct.setQuantity(false);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width10 / 2,
                                                ),
                                                BigText(
                                                    text: "0"
                                                ),//popularProduct.inCartItems.toString(),
                                                SizedBox(
                                                  width: Dimensions.width10 / 2,
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    //popularProduct.setQuantity(true);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),


                          );
                        });
                  }),
                ),
              )
          ),
        ],
      ),
    );
  }
}
