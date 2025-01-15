import "package:flutter/material.dart";
import "package:online_food_order/app_height_width.dart";

Column Food_category(){
  List<String> category = ["Nepali","Fast Food","Chinese", "Japanese","Italian"];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [

      for(int i = 0; i < category.length/2; i++)...{
        Row(
          children: [
            contain_category(category[2*i]),
            if((2*i) + 1 < category.length)
              contain_category(category[(2*i)+1]),
          ],
        ),
      }
    ],
  );
}

Widget contain_category(String name){
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(App_size.app_width * 0.03),
      padding: EdgeInsets.all(App_size.app_width * 0.01),
      child: Center(child: Text(name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17))),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
    ),
  );
}