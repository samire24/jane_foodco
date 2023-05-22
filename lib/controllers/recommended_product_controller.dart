import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jane_foodco/data/repository/popular_food_repo.dart';
import 'package:jane_foodco/models/products_models.dart';

import '../data/repository/recommneded_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({
    required this.recommendedProductRepo,
  });
  List<dynamic> _recommendedProductList= [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList()async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      _recommendedProductList =[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{
      print("Could not get products recomended");
    }
  }
}