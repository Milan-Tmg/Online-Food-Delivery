import 'package:flutter/material.dart';
import 'package:online_food_order/pages/login_pages/toggle.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
        (){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Toggle()),
        );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Image.asset("images/bgLogo.jpg", fit: BoxFit.cover),
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
