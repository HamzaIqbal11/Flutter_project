import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Topview extends StatelessWidget {
  const Topview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 44, 77, 160),
      ),
      width: double.infinity,
      height: 230,
      child: Column(children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 28, left: 25),
              child: Text(
                "Hey, Hamza",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Spacer(),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                child: SvgPicture.asset(
                  "assets/images/Search.svg",
                  height: 20,
                ),
                //  height: 40,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, right: 10),
              child: SvgPicture.asset("assets/images/Cart Icon.svg"),
            ),
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 28, left: 25),
          child: Text(
            "Shop",
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontWeight: FontWeight.w300),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 15, left: 25),
          child: Text(
            "By Category",
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ]),
    );
  }
}
