import 'package:flutter/material.dart';
import 'package:online_food_order/pages/login_pages/common_components/button.dart';
import 'package:online_food_order/pages/login_pages/common_components/gradient_container.dart';
import "package:online_food_order/app_height_width.dart";
import 'package:online_food_order/pages/login_pages/register_resturant.dart';
import 'package:online_food_order/pages/login_pages/toggle.dart';

import 'common_components/text_field.dart';

class RegisterPage extends StatelessWidget {
  final VoidCallback ontoggle;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirm_password = TextEditingController();
  RegisterPage({super.key, required this.ontoggle});

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
                  child: Text("Sign Up / Register",
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
                TextField_(label: "Confirm password", visible: true, text_controller: confirm_password,),

                SizedBox(height: App_size.app_height* 0.06),

                //sign up button
                Center(child: Button(button_name: "Sign Up", submit: (){})),
                SizedBox(height: App_size.app_height* 0.04),

                // divider section ie divides screen into 2 halves
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        height: App_size.app_height*0.1,
                        thickness: App_size.app_width*0.0050,
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: App_size.app_height* 0.02),
                      child: Text(
                        "OR",
                        style: TextStyle(fontSize: App_size.app_height*0.03, fontWeight: FontWeight.w600),
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        height: App_size.app_height*0.1,
                        thickness: App_size.app_width*0.0050,
                      ),
                    ),
                  ],
                ),


                //icons of authentication provider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        height: App_size.app_height* 0.08,
                        child: Image.asset("images/google.png"),
                      ),
                      onTap: (){
                        //authenticate using google
                      }
                    ),

                    GestureDetector(
                      child: Container(
                        height: App_size.app_height* 0.08,
                        child: Image.asset("images/facebook.png"),
                      ),
                      onTap: (){
                        //authenticate using facebook
                      }
                    ),

                    GestureDetector(
                      child: Container(
                        height: App_size.app_height* 0.08,
                        child: Image.asset("images/twitter.png"),
                      ),
                      onTap: (){
                        //authenticate using twitter
                      }
                    ),
                  ],
                ),
                SizedBox(height: App_size.app_height*0.05),

                // Register garis vanera sodhni section
                Center(child: Text("Already have an account ? ", style: TextStyle(fontSize: App_size.app_height*0.03))),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      ontoggle();
                    },
                    child: Text(
                      "Click here", style: TextStyle(color: Colors.red, fontSize: App_size.app_height*0.03),
                    ),
                  ),
                ),

                SizedBox(height: App_size.app_height*0.06),

                // registration for resturant
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterResturant()
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Register as Resturant",
                      style: TextStyle(fontSize: App_size.app_height*0.03),
                      ),

                      Icon(Icons.arrow_forward, color: Colors.red),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
