import "package:flutter/material.dart";

class Price extends StatefulWidget {
  const Price({super.key});

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {

  RangeValues price_range = RangeValues(100, 500);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: price_range,
      min: 0,
      max: 1000,
      divisions: 20,
      activeColor: Colors.red,
      labels: RangeLabels(
        price_range.start.toString(),
        price_range.end.toString(),
      ),
      onChanged:(RangeValues value){
        print(value);
        setState(() {
          price_range = value;
        });
      }
    );
  }
}
