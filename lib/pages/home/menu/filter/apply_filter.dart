import "package:flutter/material.dart";

class ApplyFilter extends StatelessWidget {
  const ApplyFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(child: Text("Apply Filter", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25))),
    );
  }
}
