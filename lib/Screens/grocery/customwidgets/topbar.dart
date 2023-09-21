import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopBarView extends StatefulWidget {
  const TopBarView({super.key});

  @override
  State<TopBarView> createState() => _TopBarViewState();
}

class _TopBarViewState extends State<TopBarView> {
  String value = "Green Way 3000, Sylhet";
  var items = [
    "Green Way 3000, Sylhet",
    "tne",
    "4ne",
    "5ne",
    "5ne",
  ];
  String timing = "1 Hour";
  var times = [
    "1 Hour",
    "2 Hour",
    "3 Hour",
  ];
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
              margin: EdgeInsets.only(top: 30, left: 30),
              child: Text(
                "Hey, Hamza",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 15, right: 15),
              child: SvgPicture.asset("assets/images/Cart Icon.svg"),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: 18, left: 30, top: 20),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search Products or store",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color.fromARGB(255, 35, 55, 90),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 35, 55, 90)),
                    borderRadius: BorderRadius.circular(25)),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 35, 55, 90)),
                  borderRadius: BorderRadius.circular(25),
                )),
          ),
        ),
        Spacer(),
        Row(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 87),
                  child: Text(
                    "Delivery to",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: DropdownButton(
                      value: value,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          child: Text(
                            items,
                            style: TextStyle(color: Colors.grey),
                          ),
                          value: items,
                        );
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(() {
                          value = newvalue!;
                        });
                      }),
                )
              ],
            ),
            Spacer(),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "WithIn",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: DropdownButton(
                      value: timing,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: times.map((String items) {
                        return DropdownMenuItem(
                          child: Text(
                            items,
                            style: TextStyle(color: Colors.grey),
                          ),
                          value: items,
                        );
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(() {
                          value = newvalue!;
                        });
                      }),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
