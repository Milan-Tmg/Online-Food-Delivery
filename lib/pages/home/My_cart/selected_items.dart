import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:online_food_order/Statemangement/state_mangement.dart";
import "package:online_food_order/app_height_width.dart";

class SelectedItems extends ConsumerWidget {
  SelectedItems({super.key, required this.resturant_name, required this.all_items});

  String resturant_name;
  Map<int,String> all_items; // contains all the food item of a resturant
  List<int> food_codes = [];

  // resturants_name : {code: { resturant_name, price, ....}}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    food_codes = all_items.keys.toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children :[
        Text(
          resturant_name,
          style: TextStyle(fontSize: App_size.app_height * 0.03),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: App_size.app_width* 0.01, vertical: App_size.app_width* 0.02),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: food_codes.map((code){
              Map<String, dynamic> food_spec = ref.watch(onCart_instance).resturants[resturant_name][code];
              return food_item(food_spec,ref, resturant_name, code);
            }).toList(),
          ),
        ),

        Divider(),
      ]
    );
  }
}


Dismissible food_item(food_spec,WidgetRef ref,String resturant_name, int code){
  return Dismissible(
    key: Key("$code"),
    background: Container(
      color: Colors.red,
      child: Icon(Icons.delete, color: Colors.white, size: App_size.app_width* 0.1),
    ),

    onDismissed: (direction){
      ref.read(onCart_instance).remove_order_placed(resturant_name: resturant_name, code: code);
    },
    child: Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image of food
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 90,
                  child: Image.asset(food_spec["image"]),
                ),
              ),

              SizedBox(width: App_size.app_width* 0.03),
              //name and price of food,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(food_spec["food_name"], style: TextStyle(fontSize: App_size.app_height * 0.025)),
                  Text("Rs ${food_spec["order"] * food_spec["price"]}", style: TextStyle(color: Colors.red[800], fontSize: App_size.app_height * 0.023)),
                ],
              ),
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color : Colors.black,
                height: App_size.app_width*0.06,
                width: App_size.app_width * 0.06,
                child: IconButton(
                    icon: Icon(Icons.remove, color: Colors.white, size: App_size.app_width* 0.03),
                    onPressed: (){
                      ref.read(onCart_instance).removeFromCart(resturant_name: resturant_name, code: code);
                    }
                ),
              ),

              Text(" ${food_spec["order"]} ", style: TextStyle(fontSize: App_size.app_width* 0.06)),

              Container(
                color : Colors.black,
                height: App_size.app_width*0.06,
                width: App_size.app_width * 0.06,
                child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white, size: App_size.app_width* 0.03),
                    onPressed: (){
                      ref.read(onCart_instance).addOnCart(resturant_name: resturant_name, code: code);
                    }
                ),
              ),
            ],
          ),

          // IconButton(
          //   icon: Icon(Icons.delete, color: Colors.red, size: App_size.app_width* 0.06),
          //   onPressed: (){
          //   }
          // ),
        ],
      ),
    ),
  );
}


