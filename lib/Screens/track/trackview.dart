import 'package:flutter/material.dart';

import 'package:mini_project/Screens/customwidgets/colors.dart';
import 'package:mini_project/Screens/customwidgets/customappbar.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomWhiteAppBar(
              title: 'Track Order',
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Stack(children: [
                      Container(
                        height: 350,
                        color: color.black,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            'assets/images/map.jpg',
                            width: double.infinity,
                            height: 350,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: color.colors),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.blue,
                              backgroundImage: NetworkImage(
                                'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
                              ),
                              radius: 24,
                            ),
                            title: Text(
                              'Delivery Man',
                            ),
                            subtitle: Text(
                              'Rakibul Hassan',
                            ),
                            trailing: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                  color: color.themecolor,
                                  borderRadius: BorderRadius.circular(100)),
                              child:
                                  Icon(Icons.chat_outlined, color: color.black),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: color.black,
                child: const Icon(Icons.timer_outlined),
              ),
              title: Text(
                'Delivery In',
              ),
              subtitle: Text(
                '25 Min',
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: color.black,
                child: const Icon(Icons.location_on_outlined),
              ),
              title: Text(
                'Delivery Address',
              ),
              subtitle: Text(
                '37 New line, Sunamganj',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(height: 10, width: 100, color: color.colors),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 25, right: 25),
              child: Row(
                children: [
                  Text(
                    'Order Details ',
                  ),
                  Text(
                    '(ID: #765433)',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
