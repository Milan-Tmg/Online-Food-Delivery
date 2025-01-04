import "package:flutter/material.dart";
import "package:online_food_order/app_height_width.dart";

class Button extends StatelessWidget {
  Button({super.key, required this.button_name, required this.submit});

  String button_name;
  final VoidCallback submit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: App_size.app_height * 0.01, horizontal: App_size.app_width*0.1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red,
        ),
      child: Text(button_name,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: App_size.app_height*0.03),
          ),
      ),
      onTap: (){},
    );
  }
}
