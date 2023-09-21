import 'package:flutter/material.dart';

import '../../../customwidgets/colors.dart';

class Cardview extends StatelessWidget {
  Cardview(
      {super.key,
      required this.image,
      required this.text1,
      required this.text2,
      required this.price});

  final String image;
  final String text1;
  final String text2;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 241, 241),
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      height: 190,
      width: 130,
      child: Column(children: [
        Center(
            child: Container(
          height: 60,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image:
                  DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
        )),
        Divider(
          thickness: 0,
          height: 20,
          color: const Color.fromARGB(255, 190, 190, 190),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 3),
          child: Text(
            text1,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          alignment: Alignment.topLeft,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 7),
          child: Text(
            text2,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
          ),
          alignment: Alignment.topLeft,
        ),
        Container(
          width: 120,
          child: Stack(
            children: [
              Center(
                  child: Container(
                padding: EdgeInsets.only(left: 15, top: 3),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 20,
                width: 100,
                child: Text("Unit \$${price}"),
              )),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: color.themecolor,
                  child: Text(
                    "+",
                    style: TextStyle(color: color.colors1),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
