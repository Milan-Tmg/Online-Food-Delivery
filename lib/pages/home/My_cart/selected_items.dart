import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:online_food_order/Statemangement/state_mangement.dart";
import "package:online_food_order/app_height_width.dart";

class SelectedItems extends ConsumerWidget {
  SelectedItems({super.key, required this.resturant_name, required this.all_items});

  String resturant_name;
  dynamic all_items; // contains all the food item of a resturant
  List<int> food_codes = [];

  // resturants_name : {code: { resturant_name, price, ....}}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    food_codes = all_items.keys.toList().cast<int>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children :[
        Text(
          resturant_name,
          style: TextStyle(fontSize: App_size.app_height * 0.04),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: App_size.app_width* 0.01, vertical: App_size.app_width* 0.02),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: food_codes.map(( code){
              return food_item(all_items[code],ref, resturant_name, code);
            }).toList(),
          ),
        ),

        Divider(),
      ]
    );
  }
}


Container food_item(food_spec,WidgetRef ref,String resturant_name, int code){
  return Container(
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
      ],
    ),
  );
}


