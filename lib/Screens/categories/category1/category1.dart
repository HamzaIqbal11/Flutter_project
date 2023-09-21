import 'package:flutter/material.dart';

import 'package:mini_project/Screens/categories/customwidget/topview.dart';

import 'customwidget/categorycard.dart';

class Category1 extends StatefulWidget {
  const Category1({Key? key}) : super(key: key);

  @override
  State<Category1> createState() => _Category1State();
}

class _Category1State extends State<Category1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Topview(),
            Row(
              children: [
                CategoryCardView(
                  text1: "Fishes",
                  text2: "From Sea",
                  image: "assets/images/fish.jpeg",
                ),
                CategoryCardView(
                  text1: "Meats",
                  text2: "Organic",
                  image: "assets/images/meats.jpeg",
                ),
              ],
            ),
            Row(
              children: [
                CategoryCardView(
                  text1: "Vegetables",
                  text2: "Organic",
                  image: "assets/images/vegetables.jpeg",
                ),
                CategoryCardView(
                  text1: "Fruits",
                  text2: "Fresh & Organic",
                  image: "assets/images/fruits.jpeg",
                ),
              ],
            ),
            Row(
              children: [
                CategoryCardView(
                  text1: "Fishes",
                  text2: "From Sea",
                  image: "assets/images/fish.jpeg",
                ),
                CategoryCardView(
                  text1: "Fishes",
                  text2: "From Sea",
                  image: "assets/images/meats.jpeg",
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
