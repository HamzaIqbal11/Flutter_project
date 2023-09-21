import 'package:flutter/material.dart';
import 'package:mini_project/Screens/customwidgets/colors.dart';

class Meat$FishView extends StatelessWidget {
  const Meat$FishView(
      {super.key,
      required this.Text1,
      required this.Text2,
      required this.Text3});

  final String Text1;
  final String Text2;
  final String Text3;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
          height: 170,
          width: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: color.reccolor),
        ),
        Column(
          children: [
            Text(
              Text1,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              Text2,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Spacer(),
            Text(
              "Starting From",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Text(
              Text3,
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ],
        )
      ]),
    );
  }
}
