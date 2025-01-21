import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_food_order/Statemangement/state_mangement.dart';
import 'package:online_food_order/app_height_width.dart';
import 'package:online_food_order/pages/home/My_cart/selected_items.dart';
import 'package:online_food_order/pages/login_pages/common_components/gradient_container.dart';

class Mycart extends ConsumerWidget {
  Mycart({super.key});

  List<String> all_resturants = []; // contains all the name of resturants ie only name of resturants which going to have order placed
  dynamic all_data; // it is literally resturants variable from the class onCart present in state_management file

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // all_resturants = ref.watch(onCart_instance).resturants.keys.toList();
    // all_data = ref.watch(onCart_instance).resturants;

    print(all_resturants);
    print(all_data);

    return SafeArea(
      child: Scaffold(
        body: GradientContainer(
          childs: Column(
            children: [
              Text(
                "My Cart",
                style: TextStyle(fontSize: App_size.app_height * 0.04),
              ),

              Divider(),
              SizedBox(height: App_size.app_height* 0.02),
              Container(
                height: App_size.app_height * 0.53,
                child: ListView(
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: ref.watch(onCart_instance).order_placed.entries.map((data){
                    return SelectedItems(resturant_name: data.key, all_items: data.value);
                  }).toList()
                ),
              ),

              //Spacer(),
              Divider(),

              // navigate to promo code
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Promo code: ", style: TextStyle(fontWeight : FontWeight.w500, fontSize: App_size.app_height * 0.025)),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.red, size: App_size.app_height* 0.025),
                    onPressed: (){
                      // I don't know where does this button navigate to
                    }
                  ),
                ],
              ),

              // contains sub total, discount, delivery charge and net total with check out button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Sub total: "),
                          Text("Rs ${ref.watch(onCart_instance).total_price}", style: TextStyle(color: Colors.red)),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Delivery charge: "),
                          Text("Rs 50", style: TextStyle(color: Colors.red)), // don't know on what basis delivery charge is calculated that's why we have constant value over here
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Discount: "),
                          Text("Rs 0 ", style : TextStyle(color: Colors.red)),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(App_size.app_height* 0.015),
                        child: Text("Check out"),
                      ),

                      onTap: (){
                        // navigate to check out page
                      }
                    ),
                  ),
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}

