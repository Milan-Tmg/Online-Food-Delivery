import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";


final onCart_instance = ChangeNotifierProvider<onCart>((ref) => onCart());

class onCart extends ChangeNotifier{
  
  Map<String, dynamic> resturants = {};

  void inital_value({String? item_name, double? rate, String? resturant_name, String? image, int? code}){

    if(! resturants.containsKey(resturant_name)){
      resturants[resturant_name!] = {};
      resturants[resturant_name][code!] = {
        "food_name" : item_name,
        "price": rate,
        "order": 0,
        "image": image,
      };
    }
    else{
      if(! resturants[resturant_name].containsKey(code)){
        resturants[resturant_name][code] = {
          "food_name" : item_name,
          "price": rate,
          "order": 0,
          "image": image,
        };
      }
    }
   }

  void addOnCart({String? resturant_name, int? code}){
    resturants[resturant_name][code!]['order'] += 1;

    notifyListeners();
  }

  void removeFromCart({String? resturant_name, int? code}){


    if(resturants[resturant_name][code!]['order'] > 0){
      resturants[resturant_name][code]["order"] --;
    }
    notifyListeners();
  }
}


