import 'package:flutter/material.dart';

import 'button.dart';

class Customtext extends StatelessWidget {
  Customtext(
      {Key? key,
      required this.image,
      required this.str1,
      required this.str2,
      this.ontap})
      : super(key: key);

  final String image;
  final String? str1;
  final String? str2;

  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 80, left: 40),
          child: Stack(
            children: [
              //  "Your holiday\nshopping \ndelivered to Screen\none",
              Text(
                "Your holiday\nshopping \ndelivered to Screen\n${str1}",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                margin: EdgeInsets.only(left: 70, top: 90),
                child: Image(
                  image: AssetImage(image),
                  //"assets/images/Emoji.png"
                  height: 35,
                  width: 30,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 40, top: 20),
          child: Text(
            "There's something for everyone \nto enjoy with Sweet Shop \nFavourites Screen $str2",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w200),
          ),
        ),
        Custombutton(
          onpressed: ontap,
        ),
      ],
    );
  }
}
