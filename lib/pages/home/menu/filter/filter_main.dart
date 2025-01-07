import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:online_food_order/app_height_width.dart";
import "package:online_food_order/pages/home/menu/filter/category.dart";
import "package:online_food_order/pages/home/menu/filter/distance.dart";
import "package:online_food_order/pages/home/menu/filter/rating.dart";

void FilterMain(context){
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (BuildContext context){
      return Container(
        padding: EdgeInsets.all(App_size.app_width * 0.05),
        height: App_size.app_height * 0.75 ,
        width: App_size.app_width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // different types of cusion display garxa
            Food_category(),
            Divider(),
            SizedBox(height: App_size.app_height * 0.01),

            // Rating
            Text("Ratings", style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
            SizedBox(height: App_size.app_height * 0.01),
            Rating(),
            Divider(),

            // distance
            Distance(),

            //price

            //apply button
          ],
        ),
      );
    }
  );
}


