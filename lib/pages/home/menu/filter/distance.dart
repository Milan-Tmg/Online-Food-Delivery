import 'package:flutter/material.dart';

import '../../../../app_height_width.dart';

class Distance extends StatefulWidget {
  const Distance({super.key});

  @override
  State<Distance> createState() => _DistanceState();
}

class _DistanceState extends State<Distance> {

  int distance = 1;

  void increase_distance(){
    setState(() {
      distance ++;
    });
  }

  void decrease_distance(){
    setState(() {
      distance --;
      if(distance < 1){
        distance = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Momo",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: App_size.app_height * 0.036),
        ),

        Row(
          children: [
            Change_distance(decrease_distance, Icons.remove),
            Text("  $distance km  ", style: TextStyle(fontSize: App_size.app_height*0.035)),
            Change_distance(increase_distance, Icons.add),
          ],
        ),
      ],
    );
  }
}

Widget Change_distance(VoidCallback func, IconData icon){
  return Container(
    height: App_size.app_height*0.035,
    width: App_size.app_height*0.035,
    color: Colors.black,
    child: IconButton(
        icon: Icon(icon, color: Colors.white, size: App_size.app_height*0.02),
        onPressed: (){func();}
    ),
  );
}
