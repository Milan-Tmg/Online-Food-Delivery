import "package:flutter/material.dart";

class App_size{
  final context;
  static late double app_height;
  static late double app_width;
  App_size({required this.context}){
    app_height = MediaQuery.of(context).size.height;
    app_width = MediaQuery.of(context).size.width;
  }
}
