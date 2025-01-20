import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";


final onCart_instance = ChangeNotifierProvider<onCart>((ref) => onCart());

class onCart extends ChangeNotifier{
  // fun fact :- resturants map was created to display order placed initially, in order to make code more effective order_placed map is created;;
  Map<String, dynamic> resturants = {};
  Map<String,Map<int,String>> order_placed = {}; // this map is used on "my cart" page;;

  void inital_value({String? item_name, double? rate, String? resturant_name, String? image, int? code}){
    // this function enable user to view number of order they have placed on specific item from detail page
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

  void addOnCart({String? resturant_name, int? code}){ // used to increase product number
    resturants[resturant_name][code!]['order'] += 1;

    notifyListeners();
  }

  void removeFromCart({String? resturant_name, int? code}){ // used to decrease product number


    if(resturants[resturant_name][code!]['order'] > 0){
      resturants[resturant_name][code]["order"] --;
    }
    notifyListeners();
  }

  void place_order({String? resturant_name, int? code}){ // function is triggered from "add to cart" button placed at detail page,
    if(! order_placed.containsKey(resturant_name!)){
      order_placed[resturant_name] = {code!: "yes"};
    }
    else{
      order_placed[resturant_name]![code!] = "yes";
    }
    print("order : ${order_placed}");
    notifyListeners();
  }

  void remove_order_placed({String? resturant_name, int? code}){
    order_placed[resturant_name]!.remove(code);

    if(order_placed[resturant_name]!.length == 0){
      order_placed.remove(resturant_name);
    }
    print("REmoved : $order_placed");
    notifyListeners();
  }
}


