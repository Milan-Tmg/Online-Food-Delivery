import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";


final onCart_instance = ChangeNotifierProvider<onCart>((ref) => onCart());

class onCart extends ChangeNotifier{
  // fun fact :- resturants map was created to display order placed initially, in order to make code more effective order_placed map is created;;
  Map<String, dynamic> resturants = {};
  Map<String,Map<int,String>> order_placed = {}; // this map is used on "my cart" page;;
  double total_price = 0; // used to store total price

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
    get_totalPrice();
    notifyListeners();
  }

  void removeFromCart({String? resturant_name, int? code}){ // used to decrease product number


    if(resturants[resturant_name][code!]['order'] > 0){
      resturants[resturant_name][code]["order"] --;
    }
    get_totalPrice();
    notifyListeners();
  }

  void place_order({String? resturant_name, int? code}){ // function is triggered from "add to cart" button placed at detail page,
    if(! order_placed.containsKey(resturant_name!)){
      order_placed[resturant_name] = {code!: "yes"};
    }
    else{
      order_placed[resturant_name]![code!] = "yes";
    }
    // need to figure out how can I solve this issue
    print("order : ${order_placed}");
    get_totalPrice();
    notifyListeners();
  }

  void remove_order_placed({String? resturant_name, int? code}){
    order_placed[resturant_name]!.remove(code);

    if(order_placed[resturant_name]!.length == 0){
      order_placed.remove(resturant_name);
    }
    print("REmoved : $order_placed");
    get_totalPrice();
    notifyListeners();
  }

  void get_totalPrice(){
    total_price = 0;
    List<String> keys = order_placed.keys.toList();
    for(int i = 0; i < keys.length; i++){
      Map<int, String> values = order_placed[keys[i]]!;
      List<int> final_values = values.keys.toList();
      for(int j = 0; j < final_values.length; j++){
        total_price += (resturants[keys[i]][final_values[j]]["price"]* resturants[keys[i]][final_values[j]]["order"]);
      }
    }
    notifyListeners();
  }
}


