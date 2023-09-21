import 'package:flutter/material.dart';

class BoxView extends StatelessWidget {
  const BoxView(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.color});

  final String text1;
  final String text2;
  final String text3;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 30),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      height: 120,
      width: 140,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              text1,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            )),
            SizedBox(
              width: 10,
            ),
            Center(
                child: Text(
              text2,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
            )),
          ],
        ),
        Center(
            child: Text(
          text3,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        )),
      ]),
    );
  }
}
