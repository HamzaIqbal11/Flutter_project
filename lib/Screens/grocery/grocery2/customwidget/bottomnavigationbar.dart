import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../categories/category2/category2.dart';
import '../../../favourites/favouritesview.dart';

import '../grocery2.dart';

class CustomBottom2 extends StatefulWidget {
  const CustomBottom2({Key? key}) : super(key: key);

  @override
  State<CustomBottom2> createState() => _CustomBottomState();
}

class _CustomBottomState extends State<CustomBottom2> {
  int selectedindex = 0;
  List screens = [
    Grocery2(),
    Category2(),
    favourites(),
    Category2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedindex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                selectedindex = 0;
              });
            },
            icon: selectedindex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.black,
                    size: 25,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                selectedindex = 1;
              });
            },
            icon: selectedindex == 1
                ? const Icon(
                    Icons.work_off,
                    color: Colors.black,
                    size: 25,
                  )
                : const Icon(
                    Icons.work_outline_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                selectedindex = 2;
              });
            },
            icon: selectedindex == 2
                ? const FaIcon(
                    FontAwesomeIcons.heartCircleCheck,
                    color: Colors.black,
                    size: 20,
                  )
                : const FaIcon(
                    FontAwesomeIcons.heart,
                    color: Colors.black,
                    size: 20,
                  ),
          ),
          IconButton(
            //enableFeedback: false,

            onPressed: () {
              setState(() {
                selectedindex = 3;
              });
            },

            icon: selectedindex == 3
                ? const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 25,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.black,
                    size: 25,
                  ),
          ),
        ],
      ),
    );
  }
}
