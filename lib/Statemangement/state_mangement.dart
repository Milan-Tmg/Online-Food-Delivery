import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

// voli yei bata milauxu

final onCart_instance = ChangeNotifierProvider<onCart>((ref) => onCart());

class onCart extends ChangeNotifier{

  Map<String, double> item_on_cart = {};//Structure = momo : 1 ie 1 plate momo has been ordered
  Map<String, double> item_rate = {}; // structure = momo = 200 ie 200 per plate

  void inital_value({String? item_name, double? rate}){
    if(! item_on_cart.containsKey(item_name)){
      item_on_cart[item_name!] = 0;
      item_rate[item_name] = rate!;
    }
  }

  void addOnCart({String? item_name}){

    if(! item_on_cart.containsKey(item_name)){
      item_on_cart[item_name!] = 1;
    }
    else{
      item_on_cart[item_name!] = item_on_cart[item_name]! + 1;
    }

    // if(! item_rate.containsKey(item_name)){
    //   item_rate[item_name] = rate!;
    // }
    print(item_on_cart);
    notifyListeners();
  }

  void removeFromCart({String? item_name}){

    if(item_on_cart.containsKey(item_name)){
      if(item_on_cart[item_name]! >= 1)
        item_on_cart[item_name!] = item_on_cart[item_name]! - 1;
    }
    notifyListeners();
  }
}

//Resturant ko name and items info collect garxa
class data_model{
  String? resturant_name;
  dynamic food_item_details = {}; // momo : {price: xxx, order_count : xxx}
}
