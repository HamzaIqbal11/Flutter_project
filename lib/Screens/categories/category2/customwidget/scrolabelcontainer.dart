import 'package:flutter/material.dart';

class RowView extends StatelessWidget {
  const RowView(
      {super.key,
      required this.val,
      required this.text,
      required this.onpressed});

  final double val;
  final String text;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(right: 10),
        // padding: EdgeInsets.all(10),
        height: 35,
        width: val,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
