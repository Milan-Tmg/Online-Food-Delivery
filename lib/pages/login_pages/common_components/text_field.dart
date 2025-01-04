// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import 'package:online_food_order/app_height_width.dart';

class TextField_ extends StatelessWidget {
  TextField_(
      {super.key,
      required this.label,
      required this.visible,
      required this.text_controller});

  String label;
  bool visible;
  TextEditingController text_controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: App_size.app_width * 0.02,
          vertical: App_size.app_height * 0.02),
      child: TextField(
        obscureText: visible,
        controller: text_controller,
        decoration: InputDecoration(
          hintText: label,
          hintStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
