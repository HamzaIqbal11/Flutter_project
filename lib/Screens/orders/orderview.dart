import 'package:flutter/material.dart';
import 'package:mini_project/Screens/customwidgets/colors.dart';
import 'package:mini_project/Screens/customwidgets/customappbar.dart';
import 'package:mini_project/Screens/orders/order.dart';
import 'package:mini_project/Screens/orders/past/pastview.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  int selectedTapIndex = 1;

  void tappedButton(int index) {
    setState(() {
      selectedTapIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomWhiteAppBar(
              title: 'Orders',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 40),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => tappedButton(1),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: selectedTapIndex == 1
                                ? color.colors
                                : color.black,
                            borderRadius: BorderRadius.circular(60),
                            border: selectedTapIndex == 1
                                ? null
                                : Border.all(color: color.black, width: 0.5)),
                        child: Center(
                            child: Text(
                          'Orders',
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => tappedButton(2),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: selectedTapIndex == 2
                                ? color.colors
                                : color.black,
                            borderRadius: BorderRadius.circular(60),
                            border: selectedTapIndex == 2
                                ? null
                                : Border.all(color: color.black, width: 0.5)),
                        child: Center(
                            child: Text(
                          'Past',
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: selectedTapIndex == 1
                  ? const OrderContent()
                  : const PastContent(),
            )
          ],
        ),
      ),
    );
  }
}
