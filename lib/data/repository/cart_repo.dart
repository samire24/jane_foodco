import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jane_foodco/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo{
final SharedPreferences sharedPreferences;
CartRepo({
  required this.sharedPreferences});

List<String> cart=[];
void addToCartList(List<CartModel> cartList){
cart=[];
/*
convert objects to string because sharedprefence only accepts strings
 */

cartList.forEach((element)=>cart.add(jsonEncode(element)));

sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
getCartList();
//print(sharedPreferences.getStringList(AppConstants.CART_LIST));
}

List<CartModel> getCartList(){
  List<String> carts = [];
  if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
    carts= sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    print("inside getCartList"+ carts.toString());
  }
  List<CartModel> cartList= [];
  /*
  List<Object> list = [
  "Object1",
  "Object2",
  "Object3",
  ]
   */


  carts.forEach((element)=>CartModel.fromJson(jsonDecode(element)));
  return cartList;
}

}