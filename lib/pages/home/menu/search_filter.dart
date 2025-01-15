import 'package:flutter/material.dart';
import 'package:online_food_order/app_height_width.dart';
import 'package:online_food_order/pages/home/menu/filter/filter_main.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              suffixIcon: InkWell(
                onTap: (){
                  // text field ma vako content search garxa,
                  print("Hello I am under the water please help me ");
                },
                child: Icon(Icons.search_outlined),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            onTap: (){
              // range specify garna milxa
              FilterMain(context);
            },
            child: Icon(Icons.tune, size: App_size.app_height*0.045),
          ),
        ),
      ],
    );
  }
}
