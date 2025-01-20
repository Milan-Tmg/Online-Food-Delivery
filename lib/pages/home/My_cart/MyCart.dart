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
          childs: ListView(
            children: [
              Text(
                "My Cart",
                style: TextStyle(fontSize: App_size.app_height * 0.04),
              ),

              Divider(),
              SizedBox(height: App_size.app_height* 0.02),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ref.watch(onCart_instance).order_placed.entries.map((data){
                  return SelectedItems(resturant_name: data.key, all_items: data.value);
                }).toList()
              ),

            ]
          ),
        ),
      ),
    );
  }
}

