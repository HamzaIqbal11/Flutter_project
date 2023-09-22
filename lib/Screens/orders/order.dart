import 'package:flutter/material.dart';
import 'package:mini_project/Screens/cart.dart/cartlist.dart';
import 'package:mini_project/Screens/customwidgets/custombutton.dart';
import 'package:mini_project/Screens/track/trackview.dart';

class OrderContent extends StatelessWidget {
  const OrderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: myCart.length,
        itemBuilder: (context, index) {
          final cartItem = myCart[index];
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      // radius: 24,
                      backgroundImage: NetworkImage(
                        cartItem['image'],
                      ),
                    ),
                    title: Text(
                      cartItem['productname'],
                    ),
                    subtitle: Text(
                      cartItem['price'],
                    ),
                    trailing: Text(
                      'ID: #765433',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                    width: 150,
                                    height: 175,
                                    child: Image.asset(
                                        'assets/images/delivery.gif')),
                                const Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      backgroundImage: NetworkImage(
                                          'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg'),
                                      radius: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Meet our rider, ',
                                ),
                                Text(
                                  'Rakib',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Product',
                            ),
                            Text(
                              'are on the way',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomButton(
                              buttonText: 'Track Order',
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const TrackOrder(),
                                ));
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                  child: Divider(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
