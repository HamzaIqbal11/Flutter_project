import 'package:flutter/material.dart';
import 'package:mini_project/Screens/categories/category2/customwidget/data.dart';
import 'package:mini_project/Screens/categories/category2/customwidget/meat&fish.dart';
import 'package:mini_project/Screens/categories/category2/customwidget/scrolabelcontainer.dart';
import 'package:mini_project/Screens/categories/category2/shopproduct.dart';

import 'package:mini_project/Screens/categories/customwidget/topview.dart';
import 'package:mini_project/Screens/customwidgets/colors.dart';

class Category2 extends StatefulWidget {
  const Category2({Key? key}) : super(key: key);

  @override
  State<Category2> createState() => _Category2State();
}

class _Category2State extends State<Category2> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Topview(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 20, right: 12, bottom: 20),
                child: Row(
                  children: data
                      .map((categoryData) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                              side: BorderSide(color: color.colors),
                              showCheckmark: false,
                              selectedColor: color.colors,
                              selected:
                                  selectedCategory == categoryData['category'],
                              backgroundColor: Colors.white,
                              label: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  categoryData['category'],
                                ),
                              ),
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    selectedCategory = categoryData['category'];
                                  } else {
                                    selectedCategory = null;
                                  }
                                });
                              },
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            if (selectedCategory != null)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    // Display shops in the selected category
                    _buildShopList(selectedCategory!),
                  ],
                ),
              )
          ],
        ),
      ),
    ));
  }

  Widget _buildShopList(String category) {
    final categoryData = data.firstWhere(
      (categoryData) => categoryData['category'] == category,
    );

    final List<Map<String, dynamic>> shops = categoryData['shops'];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: shops.length,
      itemBuilder: (context, index) {
        final shopData = shops[index];
        return InkWell(
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Shopsproductpage(shopData: shopData),
              ),
            );
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  height: 165,
                  width: 135,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      shopData['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    height: 145,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shopData['shopname'],
                          softWrap: true,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          shopData['subtitle'],
                        ),
                        const Spacer(),
                        Text(
                            //   AppText.byShopCtgPageText,
                            ""),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          shopData['price'],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
