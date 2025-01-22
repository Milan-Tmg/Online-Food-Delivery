import 'package:flutter/material.dart';
import 'package:online_food_order/app_height_width.dart';
import 'package:online_food_order/pages/login_pages/common_components/gradient_container.dart';

class UserDetails extends StatelessWidget {
  UserDetails({super.key});

  TextEditingController user_name = TextEditingController();
  TextEditingController phone_number = TextEditingController();
  TextEditingController backUp_email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GradientContainer(
          childs: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Details", style: TextStyle(fontWeight: FontWeight.w500, fontSize: App_size.app_height* 0.03)),
              Divider(),

              label_input(user_name, "User name"),
              label_input(phone_number, "Phone number"),
              label_input(backUp_email, "Backup email"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            // will do it later,
          },
          child: Icon(Icons.arrow_forward_ios, color: Colors.red),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}

Container label_input(TextEditingController controller,String label_name){
  return Container(
    //height: App_size.app_height* 0.2,
    padding: EdgeInsets.symmetric(horizontal: App_size.app_width* 0.03, vertical: App_size.app_height* 0.01),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label_name, style: TextStyle(fontSize: App_size.app_height* 0.02, fontWeight: FontWeight.w500)),
        SizedBox(height: App_size.app_height*0.01),
        TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}
