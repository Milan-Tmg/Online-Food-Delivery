import "package:flutter/material.dart";
import "package:online_food_order/app_height_width.dart";

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {

  List<bool> selected = [false,false,false,false,false];

  bool on_selected(bool selected){
    print("yohoho");
    setState(() {
      selected != selected;
    });
    return selected;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for(int index = 0; index < 5; index ++)...{
          GestureDetector(
            child: rating_structure("${index + 1}",selected[index]),
            onTap: (){
              setState(() {
                selected[index] = !selected[index];
              });
            }
          ),
        }
      ],
    );
  }
}

Widget rating_structure(String rating_number, bool select_value){
  return Container(
    height: App_size.app_height * 0.04,
    width: App_size.app_height * 0.076,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1),
      color: select_value? Colors.red: Colors.white,
    ),
    child: Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(" $rating_number", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          select_value ? Icon(Icons.star_border, color: Colors.white): Icon(Icons.star, color: Colors.red),
        ],
      ),
    ),
  );
}
