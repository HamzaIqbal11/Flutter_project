import 'package:flutter/material.dart';
import 'package:mini_project/Screens/categories/category2/customwidget/meat&fish.dart';
import 'package:mini_project/Screens/categories/category2/customwidget/scrolabelcontainer.dart';

import 'package:mini_project/Screens/categories/customwidget/topview.dart';

class Category2 extends StatefulWidget {
  const Category2({Key? key}) : super(key: key);

  @override
  State<Category2> createState() => _Category2State();
}

class _Category2State extends State<Category2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Topview(),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                RowView(val: 130, text: "Meats and Fishes", onpressed: null),
                RowView(
                  val: 90,
                  text: "Vegetables",
                  onpressed: null,
                ),
                RowView(
                  onpressed: null,
                  val: 60,
                  text: "fishes",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 20),
            child: const Row(
              children: [
                Meat$FishView(
                  Text1: "Big \$ Small Fishes",
                  Text2: "Fresh From Sea",
                  Text3: "\$36/kg",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 20),
            child: const Row(
              children: [
                Meat$FishView(
                  Text1: "Big \$ Small Fishes",
                  Text2: "Fresh From Sea",
                  Text3: "\$36/kg",
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
