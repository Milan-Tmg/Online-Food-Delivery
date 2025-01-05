import "package:flutter/material.dart";
import "package:online_food_order/app_height_width.dart";
import "package:online_food_order/pages/home/menu/search_filter.dart";
import "package:online_food_order/pages/home/menu/time.dart";

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  late String greeting;
  String name = "Milan"; // authentication part garye paxi user cridential bata fetch garnu prax nam

  @override
  Widget build(BuildContext context) {

    // good(morning, afternoon ----) find out garya ho
    greeting = get_greeting();

    return Column(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------ greeting to user and profile setting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ------- greeting user
                Text("$greeting \n$name",
                style: TextStyle(
                  fontSize: App_size.app_height * 0.025,
                ),
                ),

                // ------------ profile setting
                GestureDetector(
                  child: CircleAvatar(
                    radius: App_size.app_width* 0.07,
                    backgroundColor: Color(0xFFF67C7C),
                    child: Icon(Icons.person_2_outlined, size: App_size.app_width*0.08, color: Colors.black),
                  ),

                  onTap: (){
                    // k garxa malai aaile tha xaina
                  },
                ),
              ],
            ),

            SizedBox(height: App_size.app_height*0.03),

            // -------- search bar and filter
            SearchFilter(),
            SizedBox(height: App_size.app_height*0.04),

            // --------- displaying food items
            Text("Food Items",
            style: TextStyle(fontSize: App_size.app_height*0.035, fontWeight: FontWeight.w500),
            ),
            Divider(),
          ],
        ),

        //GridView(gridDelegate: gridDelegate)
      ],
    );
  }
}
