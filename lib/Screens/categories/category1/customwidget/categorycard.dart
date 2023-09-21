import 'package:flutter/material.dart';
import '../../../customwidgets/colors.dart';

class CategoryCardView extends StatefulWidget {
  const CategoryCardView(
      {super.key,
      required this.text1,
      required this.text2,
      required this.image});
  final String text1;
  final String text2;
  final String image;
  @override
  State<CategoryCardView> createState() => _CategoryCardViewState();
}

class _CategoryCardViewState extends State<CategoryCardView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: color.greycolor, borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.only(top: 18),
        height: 160,
        width: 140,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.image),
                )),
            height: 60,
            width: 100,
          ),
          Container(
            width: 100,
            child: Divider(color: Color.fromARGB(255, 175, 175, 175)),
          ),
          Text(
            widget.text1,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            widget.text2,
            style: TextStyle(color: const Color.fromARGB(255, 133, 132, 132)),
          ),
        ]),
      ),
    );
  }
}
