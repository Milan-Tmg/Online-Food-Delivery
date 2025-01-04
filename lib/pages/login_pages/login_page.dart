import 'package:flutter/material.dart';
import 'package:online_food_order/pages/login_pages/common_components/button.dart';
import 'package:online_food_order/pages/login_pages/common_components/gradient_container.dart';
import "package:online_food_order/app_height_width.dart";

import 'common_components/text_field.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback ontoggle;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  LoginPage({super.key, required this.ontoggle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GradientContainer(
          childs: Padding(
            padding: EdgeInsets.symmetric(horizontal: App_size.app_width*0.01),
            child: ListView(
              children: [

                SizedBox(height: App_size.app_height*0.1),

                // ------------ page name ie sign up/ register
                Center(
                  child: Text("Welcome Back!",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: App_size.app_height* 0.04,
                    ),
                  ),
                ),

                SizedBox(height: App_size.app_height* 0.06),

                // -------------- textfield to fill up credential
                TextField_(label: "Email", visible: false, text_controller: email,),
                TextField_(label: "Password", visible: true, text_controller: password,),
                SizedBox(height: App_size.app_height* 0.06),

                //sign up button
                Center(child: Button(button_name: "Log in", submit: (){})),
                SizedBox(height: App_size.app_height*0.05),

                // -------------- Register garis vanera sodhni section
                Center(child: Text("Don't have an account ? ", style: TextStyle(fontSize: App_size.app_height*0.03))),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      ontoggle();
                    },
                    child: Text(
                      "Create an account", style: TextStyle(color: Colors.red, fontSize: App_size.app_height*0.03),
                    ),
                  ),
                ),

                SizedBox(height: App_size.app_height*0.06),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
