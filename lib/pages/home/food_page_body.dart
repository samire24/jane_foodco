import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jane_foodco/controllers/popular_product_controller.dart';
import 'package:jane_foodco/controllers/recommended_product_controller.dart';
import 'package:jane_foodco/routes/route_helper.dart';
import 'package:jane_foodco/models/products_models.dart';
import 'package:jane_foodco/utils/app_constants.dart';
import 'package:jane_foodco/utils/colors.dart';
import 'package:jane_foodco/utils/dimension.dart';
import 'package:jane_foodco/widgets/app_column.dart';
import 'package:jane_foodco/widgets/big_text.dart';
import 'package:jane_foodco/widgets/icon_and_text_widget.dart';
import 'package:jane_foodco/widgets/small_text.dart';

class FoodBodyPage extends StatefulWidget {
  const FoodBodyPage({Key? key}) : super(key: key);

  @override
  _FoodBodyPageState createState() => _FoodBodyPageState();
}

class _FoodBodyPageState extends State<FoodBodyPage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue= 0.0;
  var _scaleFactor = 0.8;
  double _height= Dimensions.pageViewContainer;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded?Container(
            height: Dimensions.pageView,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProducts.popularProductList.length,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position, popularProducts.popularProductList[position]);
                  }),
          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
    //dots
    GetBuilder<PopularProductController>(builder: (popularProducts){
      return DotsIndicator(
        dotsCount: popularProducts.popularProductList.isEmpty ? 1:popularProducts.popularProductList.length,
        position: _currPageValue,
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      );
    }),
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              BigText(text: "Recommended",),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: BigText(text: ".",color: Colors.black26,),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food Pairing",),
              )
            ],
          ),
        ),
        //recommended food
        //List of food and images
          GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
            return recommendedProduct.isLoaded? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: recommendedProduct.recommendedProductList.length ,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getRecommendedFood(index));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          //image section
                          Container(
                            height:Dimensions.listViewImgSize,
                            width: Dimensions.listViewImgSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: AppColors.mainColor,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(AppConstants.BASE_URL+ AppConstants.UPLOAD_URL+ recommendedProduct.recommendedProductList[index].img!),
                                )
                            ),
                          ),
                          //text container
                          Expanded(
                            child: Container(
                              height: Dimensions.listViewTextConSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20),
                                    bottomRight: Radius.circular(Dimensions.radius20)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                    SizedBox(height: Dimensions.height10,),
                                    SmallText(text: "With Ghana Characteristics"),
                                    SizedBox(height: Dimensions.height10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            iconColor: AppColors.iconColor1),
                                        IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: "1.7km",
                                            iconColor: AppColors.mainColor),
                                        IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: "32min",
                                            iconColor: AppColors.iconColor2),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }): CircularProgressIndicator(color: AppColors.mainColor,);
          }),
      ],
    );
  }

  Widget _buildPageItem(int index,ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if(index ==_currPageValue.floor()){
      var currScale = 1-(_currPageValue - index)*(1-_scaleFactor);
      var currTrans = _height * (1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index==_currPageValue.floor()+1){
      var currScale= _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index==_currPageValue.floor()-1){
      var currScale = 1-(_currPageValue - index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else{
      var currScale  = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){

              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(right: Dimensions.width10, left: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.BASE_URL+ AppConstants.UPLOAD_URL +popularProduct.img!
                    ),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(right: Dimensions.width30, left: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    offset: Offset(0,5),
                    blurRadius: 5.0,
                  ),
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    offset: Offset(-5,0),
                    blurRadius: 5.0,
                  ),
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    offset: Offset(5,0),
                    blurRadius: 5.0,
                  ),

                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
                child: AppColumn(text: popularProduct.name!,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
