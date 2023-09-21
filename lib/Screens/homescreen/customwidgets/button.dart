import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  Custombutton({Key? key, this.onpressed}) : super(key: key);

  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 370, left: 80),
      padding: EdgeInsets.only(left: 30),
      height: MediaQuery.of(context).size.height * 0.080,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          MaterialButton(
            child: Text(
              "Get Started ",
              style: TextStyle(fontSize: 14),
            ),
            onPressed: onpressed,
          ),
          Image(
            image: AssetImage("assets/images/Arrow 4.png"),
            width: 15,
          )
        ],
      ),
    );
  }
}
