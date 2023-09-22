import 'package:flutter/material.dart';
import 'package:mini_project/Screens/cart.dart/cartlist.dart';
import 'package:mini_project/Screens/checkout/checkoutview.dart';
import 'package:mini_project/Screens/customwidgets/colors.dart';
import 'package:mini_project/Screens/customwidgets/customappbar.dart';
import 'package:mini_project/Screens/customwidgets/custombutton.dart';
import 'package:mini_project/Screens/customwidgets/customicon.dart';
import 'package:mini_project/Screens/details/detailview.dart';
import 'package:mini_project/Screens/homescreen/homesview.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  decreasedCartQuantity(index) {
    setState(() {
      if (myCart[index]['quantity'] > 1) {
        myCart[index]['quantity']--;
      } else {
        myCart.removeAt(index);
      }
    });
  }

  increaseCartQuantity(index) {
    setState(() {
      myCart[index]['quantity']++;
    });
  }

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
            CustomWhiteAppBar(
              title: myCart.isNotEmpty
                  ? 'Shopping Cart (${myCart.length})'
                  : 'No Item in Cart',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
                child: myCart.isEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                              'https://cdn.dribbble.com/users/5107895/screenshots/14532312/media/a7e6c2e9333d0989e3a54c95dd8321d7.gif'),
                          Text(
                            'Empty Cart !',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'You haven\'t added anything to your cart',
                          ),
                        ],
                      )
                    : ListView.builder(
                        itemCount: myCart.length,
                        itemBuilder: (context, index) {
                          final cartItem = myCart[index];

                          int quantity = cartItem['quantity'];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: ListTile(
                              leading: CircleAvatar(
                                // radius: 24,
                                backgroundImage: NetworkImage(
                                  cartItem['image'],
                                ),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  cartItem['productname'],
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  cartItem['price'],
                                ),
                              ),
                              trailing: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      decreasedCartQuantity(index);
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: color.greycolor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '-',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14),
                                    child: Text(quantity.toString()),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      increaseCartQuantity(index);
                                    },
                                    child: CustomIconButton(
                                        color: color.greycolor,
                                        iconColor: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            myCart.isEmpty
                ? const Text('')
                : Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      height: 225,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      builder: (context) => CheckoutView()));
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
