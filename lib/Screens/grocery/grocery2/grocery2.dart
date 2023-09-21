import 'package:flutter/material.dart';

import '../../customwidgets/colors.dart';
import '../customwidgets/topbar.dart';
import 'customwidget/box.dart';
import 'customwidget/card2.dart';

class Grocery2 extends StatelessWidget {
  const Grocery2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TopBarView(),
          Row(
            children: [
              BoxView(
                text1: "316",
                text2: "USD",
                text3: "Your Total Savings",
                color: color.boxcolor,
              ),
              BoxView(
                text1: "246",
                text2: "HRS",
                text3: "Your Time Saved",
                color: const Color.fromARGB(255, 214, 212, 212),
              )
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              "Deals on Fruits & Tea",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,

              children: [
                CardView2(
                  tex1: "\$325",
                  text2: "Orange Package 1",
                  text3: "1 bundle",
                  image: "assets/images/orange.jpeg",
                ),
                CardView2(
                  tex1: "\$89",
                  text2: "Green Tea Package 2",
                  text3: "1 bundle",
                  image: "assets/images/greentea.jpeg",
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,

              children: [
                CardView2(
                  tex1: "\$325",
                  text2: "Orange Package 1",
                  text3: "1 bundle",
                  image: "assets/images/orange.jpeg",
                ),
                CardView2(
                  tex1: "\$89",
                  text2: "Green Tea Package 2",
                  text3: "1 bundle",
                  image: "assets/images/greentea.jpeg",
                ),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
