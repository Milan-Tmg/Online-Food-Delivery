import "package:flutter/material.dart";
import "package:online_food_order/pages/home/menu/food_details.dart";
import "../../../app_height_width.dart";

class FoodItems extends StatelessWidget {
  const FoodItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: App_size.app_height * 0.03,
          crossAxisSpacing: App_size.app_height * 0.03,
          childAspectRatio: 1/1.18,
        ),
        children: List.generate(10,(index){
          return GestureDetector(

            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodDetails()),
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
