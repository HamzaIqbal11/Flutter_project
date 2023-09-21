import 'package:flutter/material.dart';

import '../../customwidgets/colors.dart';
import '../customwidgets/topbar.dart';
import 'customwidget/card.dart';
import 'customwidget/container.dart';

class Grocery1 extends StatefulWidget {
  const Grocery1({Key? key}) : super(key: key);

  @override
  State<Grocery1> createState() => _Grocery1State();
}

class _Grocery1State extends State<Grocery1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBarView(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    CustomContainer(color: color.colors),
                    CustomContainer(color: color.colors1),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 25, top: 15),
              child: Text(
                "Recommended",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Cardview(
                      image: ("assets/images/lemon.jpg"),
                      text1: "Fresh Lemon",
                      text2: "Organic",
                      price: 12),
                  Cardview(
                      image: ("assets/images/greentea.jpeg"),
                      text1: "Green Tea",
                      text2: "Organic",
                      price: 12),
                  Cardview(
                      image: ("assets/images/lemon.jpg"),
                      text1: "Fresh Lemon",
                      text2: "Organic",
                      price: 12),
                ]),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
