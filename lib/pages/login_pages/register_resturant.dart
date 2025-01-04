import 'package:flutter/material.dart';
import 'package:online_food_order/pages/login_pages/common_components/button.dart';
import 'package:online_food_order/pages/login_pages/common_components/gradient_container.dart';
import "package:online_food_order/app_height_width.dart";

import 'common_components/text_field.dart';

class RegisterResturant extends StatelessWidget {
  final TextEditingController resturant_name = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController type = TextEditingController();
  RegisterResturant({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GradientContainer(
          childs: Padding(
            padding: EdgeInsets.symmetric(horizontal: App_size.app_width*0.01),
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new,color: Colors.black),
                    onPressed: (){
                      Navigator.pop(context);
                    }
                  ),
                ),
                SizedBox(height: App_size.app_height*0.1),

                // ------------ page name ie register resturant
                Center(
                  child: Text("Register Resturnat ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: App_size.app_height* 0.04,
                    ),
                  ),
                ),

                SizedBox(height: App_size.app_height* 0.06),

                // -------------- textfield to fill up credential
                TextField_(label: "Resturant Name", visible: false, text_controller: resturant_name,),
                TextField_(label: "Loaction", visible: true, text_controller: location),
                TextField_(label: "Type", visible: true, text_controller: type),

                SizedBox(height: App_size.app_height* 0.06),

                //sign up button
                Center(child: Button(button_name: "Register", submit: (){})),
                SizedBox(height: App_size.app_height*0.05),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
