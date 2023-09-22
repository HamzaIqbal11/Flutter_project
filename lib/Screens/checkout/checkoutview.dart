import 'package:flutter/material.dart';
import 'package:mini_project/Screens/addcard/addcard.dart';

import 'package:mini_project/Screens/cart.dart/cartlist.dart';
import 'package:mini_project/Screens/checkout/addressview.dart';
import 'package:mini_project/Screens/checkout/custom/csutomtitle.dart';
import 'package:mini_project/Screens/customwidgets/colors.dart';
import 'package:mini_project/Screens/customwidgets/customappbar.dart';
import 'package:mini_project/Screens/customwidgets/custombutton.dart';

List address = [];

class CheckoutView extends StatefulWidget {
  const CheckoutView({
    super.key,
  });

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomWhiteAppBar(title: 'Shopping Cart (${myCart.length})'),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 25, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Delivery Address',
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: address.length,
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomListTile(
                    index: index,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: width * 0.85,
              child: CustomButton(
                  buttonIcon: Icons.add_circle_outline,
                  buttonText: 'Add New Address',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddressView(),
                    ));
                  },
                  buttonColor: color.black),
            ),
            SizedBox(
              width: width * 0.90,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: CustomButton(
                  buttonText: 'Add Card',
                  onPressed: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddCard(),
                    ));
                    setState(() {});
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
