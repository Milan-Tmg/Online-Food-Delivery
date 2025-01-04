import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  Widget childs; // child ko pural children hunxa tha xa malai hehe
  GradientContainer({super.key, required this.childs});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ Color(0xFFECD645),Color(0xFF7DD35B)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops:[0.15,0.8],
        ),
      ),
      child: childs,
    );
  }
}
