import 'package:flutter/material.dart';
import 'package:mini_project/Screens/checkout/checkoutview.dart';
import 'package:mini_project/Screens/customwidgets/colors.dart';

class CustomListTile extends StatelessWidget {
  final int index;
  const CustomListTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Container(
        // height: 95,
        decoration: BoxDecoration(
            // color: AppDarkColors.black20,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.colors, width: 2)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ListTile(
              // tileColor: AppDarkColors.black20,
              title: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Text(
                      'Home',
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Icon(
                      Icons.check_circle,
                      color: color.colors,
                    ),
                  ),
                ],
              ),
              subtitle: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Text(
                    address[index].toString(),
                  ),
                  const Spacer(),
                  Text(
                    'Edit',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
