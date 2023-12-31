import 'package:flutter/material.dart';
import 'package:mini_project/Screens/customwidgets/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final Color? buttonColor;
  final IconData? buttonIcon;
  final Color? borderColor;
  final Function()? onPressed;
  final Padding? height;
  const CustomButton(
      {super.key,
      required this.buttonText,
      this.buttonColor,
      this.buttonIcon,
      this.buttonTextStyle,
      this.onPressed,
      this.height,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: buttonColor ?? Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: borderColor ?? Colors.transparent)),
      ),
      child: buttonIcon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Icon(
                    buttonIcon,
                    color: color.colors,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  buttonText,
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                buttonText,
              ),
            ),
    );
  }
}
