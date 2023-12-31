import 'package:flutter/material.dart';

import 'package:mini_project/Screens/customwidgets/colors.dart';

class PastContent extends StatelessWidget {
  const PastContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://w7.pngwing.com/pngs/1018/975/png-transparent-juice-banana-food-auglis-flavor-banana-natural-foods-leaf-orange-thumbnail.png'),
                  ),
                  title: Text(
                    'Bananas',
                  ),
                  subtitle: Text(
                    '\$55.50',
                  ),
                  trailing: Text(
                    'ID: #765433',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        '20/082023',
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(color.black),
                      ),
                      child: Text(
                        'Success',
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                child: Divider(),
              )
            ],
          );
        },
      ),
    );
  }
}
