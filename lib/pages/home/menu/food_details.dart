import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:online_food_order/Statemangement/state_mangement.dart";
import "package:online_food_order/app_height_width.dart";
import "package:online_food_order/pages/home/My_cart/MyCart.dart";
import "package:online_food_order/pages/login_pages/common_components/gradient_container.dart";

// class FoodDetails extends StatefulWidget {
//   const FoodDetails({super.key});
//
//   @override
//   State<FoodDetails> createState() => _FoodDetailsState();
// }

class FoodDetails extends ConsumerWidget {

  FoodDetails({super.key, required this.api_data, required this.code});
  dynamic api_data;
  int code;
  // int food_count = 0;
  // int total_cost = 0;

  // function to increase food_count
  // void increase_food_count(){
  //   setState(() {
  //     food_count ++;
  //     total_cost = food_count * food_items[0]["food_name"];
  //   });
  // }
  //
  // // function to decrease food_count
  // void decrease_food_count(){
  //   setState(() {
  //     food_count --;
  //     if(food_count < 0){
  //       food_count = 0;
  //     }
  //     total_cost = food_count * food_items[0]["food_name"];
  //   });
  // }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: GradientContainer(
          childs: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // button to navigate back to previous page
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new),
                    onPressed: (){
                      Navigator.pop(context);
                    }
                  ),
                ),

                // displays the image of food
                Container(
                  height: App_size.app_height * 0.3,
                  child: Center(child: Image.asset(api_data["picture"])),
                ),
                SizedBox(height: App_size.app_height* 0.04),

               // display food name and button which are used for incrementation and decremetation
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: App_size.app_height*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(api_data["food_name"],
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: App_size.app_height * 0.036),
                      ),

                      Row(
                        children: [
                          Change_food_count((){ref.read(onCart_instance).removeFromCart(resturant_name: api_data["resturant name"],code: code);}, Icons.remove),
                          Text("  ${ref.watch(onCart_instance).resturants[api_data["resturant name"]][code]["order"]}  ", style: TextStyle(fontSize: App_size.app_height*0.035)),
                          Change_food_count((){ref.read(onCart_instance).addOnCart(resturant_name: api_data["resturant name"], code: code);}, Icons.add),

                        ],
                      ),
                    ],
                  ),
                ),

                Divider(),

                //description of food item
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: App_size.app_height*0.02),
                  child: Container(
                    height: App_size.app_height* 0.2,
                    child: ListView(
                       children: [
                         Text(
                           api_data["discription"],
                           style: TextStyle(
                             fontSize: 17
                           ),
                         )
                       ],
                    ),
                  ),
                ),
                SizedBox(height: App_size.app_height*0.04),

                // display delivery time
                Text(
                  "Delivery time 12 hours",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),

                Spacer(),

                // display cost and button which adds item to cart
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Cost : \n Rs ${ref.watch(onCart_instance).resturants[api_data["resturant name"]][code]["order"]! * api_data["price"]}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mycart(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child : Text("Add to Cart", style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// button used for increment and decrement of food_count
Widget Change_food_count(VoidCallback func, IconData icon){
  return Container(
    height: App_size.app_height*0.035,
    width: App_size.app_height*0.035,
    color: Colors.black,
    child: IconButton(
        icon: Icon(icon, color: Colors.white, size: App_size.app_height*0.017),
        onPressed: (){func();}
    ),
  );
}
