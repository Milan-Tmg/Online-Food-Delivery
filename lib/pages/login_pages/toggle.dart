import "package:flutter/material.dart";
import "package:online_food_order/pages/login_pages/login_page.dart";
import "package:online_food_order/pages/login_pages/register_page.dart";

class Toggle extends StatefulWidget {
  const Toggle({super.key});

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool registered = false;

  void change_page(){
    setState(() {
      registered = !registered;
    });
  }
  @override
  Widget build(BuildContext context) {
    return registered? LoginPage(ontoggle: change_page): RegisterPage(ontoggle: change_page);
  }
}
