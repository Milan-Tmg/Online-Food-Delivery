import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:online_food_order/Statemangement/state_mangement.dart";
import "package:online_food_order/pages/home/menu/food_details.dart";
import "../../../app_height_width.dart";

class FoodItems extends ConsumerWidget {
  FoodItems({super.key});

  // dumbe api data
  List<dynamic>api_data = [
    {
      "food_name" : "Momo",
      "price": 200,
      "resturant name ": "Xyz",
      "picture" : "images/place_holder.jpg",
      "discription": "Momo is a type of dumpling that originates from the Himalayan regions and is cherished for its simplicity, versatility, and delightful flavors",
    }
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: App_size.app_height * 0.03,
          crossAxisSpacing: App_size.app_height * 0.03,
          childAspectRatio: 1/1.3,
        ),
        children: List.generate(10,(index){
          return GestureDetector(

            onTap: (){
              ref.read(onCart_instance).inital_value(item_name: api_data[0]["food_name"],rate: api_data[0]["price"]);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodDetails(api_data: api_data[0],)),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: App_size.app_height*0.13,
                      child: Image.asset("images/place_holder.jpg"),
                    ),
                  ),
                  Text("Momo"),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.red),
                      Text(" 9.9"),
                    ],
                  ),
                  Divider(),
                  Text("Rs 200"),
                ],
              ),
            ),
          );
        })
    );
  }
}
