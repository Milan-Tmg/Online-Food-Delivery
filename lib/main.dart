import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_food_order/app_height_width.dart';
import 'package:online_food_order/pages/splash_screen/splashScreen.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.red,
        ),
      ),
      home: Builder(builder: (BuildContext context) {
        App_size(context: context);
        return Splashscreen();
      }),
    ),
  ));
}
