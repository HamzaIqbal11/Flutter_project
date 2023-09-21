import 'package:flutter/material.dart';

import '../../../customwidgets/colors.dart';

class CardView2 extends StatelessWidget {
  CardView2(
      {super.key,
      required this.tex1,
      required this.text2,
      required this.text3,
      required this.image});

  final String tex1;
  final String text2;
  final String text3;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 25,
        top: 20,
      ),
      padding: EdgeInsets.only(top: 0),
      // padding: EdgeInsets.all(10),
      // margin: EdgeInsets.only(left: 30, top: 20),
      width: 150,
      height: 220,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 214, 212, 212),
          borderRadius: BorderRadius.circular(15)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 140,
          child: Stack(children: [
            Center(
                child: Container(
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image))),
            )),
            Positioned(
                right: 18,
                bottom: 0,
                child: CircleAvatar(
                  backgroundColor: color.themecolor,
                  radius: 12,
                  child: Text(
                    "+",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ]),
        ),
        Container(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              tex1,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )),
        Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              text2,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            )),
        Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              text3,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            )),
      ]),
    );
  }
}
