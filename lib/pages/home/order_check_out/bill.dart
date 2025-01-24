import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_food_order/Statemangement/state_mangement.dart';
import 'package:online_food_order/app_height_width.dart';
import 'package:online_food_order/pages/home/My_cart/selected_items.dart';
import 'package:online_food_order/pages/login_pages/common_components/gradient_container.dart';

class Bill extends ConsumerWidget {
  Bill({super.key});

  TextEditingController direction = TextEditingController();
  double delivery_charge = 50;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: GradientContainer(
          childs: ListView(
            children: [
              // contains billing address, current locatoin and add description.
              Padding(
                padding: EdgeInsets.all(App_size.app_height * 0.03),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // enables user to change delivery location
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Billing address", style: TextStyle(fontSize: App_size.app_height* 0.03, fontWeight: FontWeight.w500)),

                        TextButton(
                          child: Text("Change", style: TextStyle(color: Colors.red)),
                          onPressed: (){
                            // changes users current location
                          }
                        ),
                      ],
                    ),

                    // display current location of user
                    Container(
                      padding: EdgeInsets.all(App_size.app_height* 0.01),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Current location", style: TextStyle(fontSize: App_size.app_height* 0.025, fontWeight: FontWeight.w500)),
                          Text("Madan Bhandari Memorial College, New Baneshow, Kathmandu"),
                        ],
                      ),
                    ),

                    SizedBox(height: App_size.app_height* 0.02),

                    TextField(
                      controller: direction,
                      minLines: 1,
                      maxLines : 3,
                      decoration: InputDecoration(
                        hintText: "Add direction",
                        fillColor: Colors.transparent,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //SizedBox(height: App_size.app_height* 0.02),

              Divider(color: Colors.black),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: App_size.app_height* 0.03),
                child: Text("Your cart", style: TextStyle(fontSize: App_size.app_height* 0.03, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.all(App_size.app_height* 0.034),
                child: Container(
                  padding: EdgeInsets.all(App_size.app_width* 0.02),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: ref.watch(onCart_instance).order_placed.entries.map((data){
                      return SelectedItems(resturant_name: data.key, all_items: data.value );
                    }).toList(),
                  ),
                ),
              ),

              Divider(color: Colors.black, height: App_size.app_height* 0.03,),

              // contains receipt
              Container(
                padding: EdgeInsets.all(App_size.app_height* 0.03),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Receipt", style: TextStyle(fontSize: App_size.app_height* 0.03, fontWeight: FontWeight.w500)),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text("Subtotal: "),
                    //     Text("Rs ${ref.watch(onCart_instance).total_price}", style: TextStyle(color : Colors.red)),
                    //   ],
                    // ),
                    //
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text("Delivery Charge: "),
                    //     Text("Rs 50", style: TextStyle(color : Colors.red)),
                    //   ],
                    // ),

                    receipt_attribute("Sub total: ", ref.watch(onCart_instance).total_price),
                    receipt_attribute("Delivery Charge: ", delivery_charge),
                    receipt_attribute("Total: ", ref.watch(onCart_instance).total_price + delivery_charge),
                  ],
                ),
              ),

              Divider(color: Colors.black),

              Spacer(),

              GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(App_size.app_height* 0.03),
                  padding: EdgeInsets.all(App_size.app_height* 0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text('Place order', style: TextStyle(fontWeight: FontWeight.w500, fontSize: App_size.app_height * 0.025)),
                  ),
                ),
                onTap: (){
                  // don't know what to do from this point and lets wait until ui gets designed
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Row receipt_attribute(String? attribute_name, double? price){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("$attribute_name"),
      Text("Rs $price", style: TextStyle(color : Colors.red)),
    ],
  );
}