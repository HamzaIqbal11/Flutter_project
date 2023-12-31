import 'package:flutter/material.dart';

import 'package:mini_project/Screens/cart.dart/cartlist.dart';
import 'package:mini_project/Screens/checkout/custom/customtextfield.dart';
import 'package:mini_project/Screens/customwidgets/colors.dart';
import 'package:mini_project/Screens/customwidgets/customappbar.dart';
import 'package:mini_project/Screens/customwidgets/custombutton.dart';
import 'package:mini_project/Screens/orders/orderview.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  // parse price to covert String to double
  double parsePrice(String price) {
    return double.parse(price.replaceAll('\$', ''));
  }

  // Calculate subtotal
  double calculateSubtotal() {
    double subtotal = 0.00;
    for (final cartItem in myCart) {
      double itemPrice = parsePrice(cartItem['price']);
      int quantity = cartItem['quantity'];
      subtotal += itemPrice * quantity;
    }
    return subtotal;
  }

  double calculateTotal() {
    double deliveryCost = 2.00;
    return calculateSubtotal() + deliveryCost;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomWhiteAppBar(
              title: 'Add Card',
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 40),
              child: CustomTextField(
                textName: 'Card holder name',
                hintText: 'Card holder name',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: CustomTextField(
                textName: 'Card Number',
                hintText: 'Card Number',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      textName: 'Exp Date',
                      hintText: 'Exp Date',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                      textName: 'CVc',
                      hintText: 'CVc Number',
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                height: 225,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: color.black,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SizedBox(
                  width: width * 0.90,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 15, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                            ),
                            Text(
                              '\$${calculateSubtotal().toStringAsFixed(2)}',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                            ),
                            Text(
                              '\$2.00',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                            ),
                            Text(
                              '\$${calculateTotal().toStringAsFixed(2)}',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.90,
                        child: CustomButton(
                          buttonText: 'Proceed To checkout',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const OrderView(),
                            ));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
