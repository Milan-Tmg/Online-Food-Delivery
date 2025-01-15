import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_food_order/app_height_width.dart';
import 'package:online_food_order/pages/login_pages/common_components/gradient_container.dart';

class Mycart extends ConsumerWidget {
  const Mycart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

              Padding(
                padding: EdgeInsets.all(App_size.app_width* 0.05),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    display_model(content: Text("Shop name"), show_trailing: false),
                    display_model(content: content, show_trailing: show_trailing)

                  ],
                ),
              ),

            ]
          ),
        ),
      ),
    );
  }
}

ListTile display_model(
    {required Widget content, required bool show_trailing, VoidCallback? func1, IconData? icon1, double? order_count, VoidCallback? func2, IconData? icon2}){
  return ListTile(
    leading: Container(
      height: App_size.app_width * 0.07,
      width: App_size.app_width * 0.07,
      decoration : BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.black,width: App_size.app_width* 0.02),
      ),
    ),

    title: content,

    trailing: show_trailing? change_food_count(): SizedBox.shrink(),
  );
}

Container Change_food_count_button(VoidCallback func, IconData icon){
  return Container(
    height: App_size.app_height*0.025,
    width: App_size.app_height*0.025,
    color: Colors.black,
    child: IconButton(
        icon: Icon(icon, color: Colors.white, size: App_size.app_height*0.07),
        onPressed: (){func();}
    ),
  );
}

Row change_food_count({VoidCallback? func1, IconData? icon1, double? order_count, VoidCallback? func2, IconData? icon2}){
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Change_food_count_button(func1!, icon1!),
      Text(" $order_count "),
      Change_food_count_button(func2!,icon2!)
    ],
  );
}

Column content(){
  return Column(
    children: [
      Text("Momo"),
      Text("Type: veg"),
      SizedBox(height: App_size.app_height)
    ],
  );
}
