import 'package:flutter/material.dart';

import '../grocery/grocery1/customwidget/bottomnavigationbar.dart';
import '../customwidgets/colors.dart';

import '../grocery/grocery2/customwidget/bottomnavigationbar.dart';

import 'customwidgets/text.dart';

class Homeview extends StatefulWidget {
  Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.themecolor,
        body: Container(
          child: PageView(
            children: [
              Customtext(
                str1: "one",
                str2: "1",
                image: "assets/images/Emoji.png",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CustomBottom()));
                },
              ),
              Customtext(
                  str1: "two",
                  str2: "2",
                  image: "assets/images/Emoji.png",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomBottom2()));
                  }),
            ],
            controller: controller,
            allowImplicitScrolling: true,
            scrollDirection: Axis.horizontal,
          ),
        ));
  }
}
