import 'package:flutter/material.dart';
import 'package:mini_project/Screens/cart.dart/cartlist.dart';
import 'package:mini_project/Screens/customwidgets/colors.dart';
import 'package:mini_project/Screens/customwidgets/customappbar.dart';
import 'package:mini_project/Screens/customwidgets/customicon.dart';
import 'package:mini_project/Screens/details/detailview.dart';

class Shopsproductpage extends StatefulWidget {
  Shopsproductpage({super.key, required this.shopData});
  final Map<String, dynamic> shopData;

  @override
  State<Shopsproductpage> createState() => _ShopsproductpageState();
}

class _ShopsproductpageState extends State<Shopsproductpage> {
  addToCart(Map<String, dynamic> product) {
    setState(() {
      myCart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(children: [
          CustomWhiteAppBar(
            title: widget.shopData['shopname'],
            icon: Icons.search,
            iconCart: Icons.shopping_bag_outlined,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 210,
              ),
              itemCount: widget.shopData['product'].length,
              itemBuilder: (context, index) {
                final product = widget.shopData['product'][index];
                return InkWell(
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailView(shopProducts: product),
                    ));
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          child: Center(
                            child: Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  product['image'],
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 6,
                                right: 6,
                                child: InkWell(
                                    onTap: () {
                                      addToCart(product);
                                    },
                                    child: const CustomIconButton()),
                              )
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 6, right: 6, bottom: 6),
                          child: Text(
                            product['price'],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6, right: 6),
                          child: Text(
                            product['productname'],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
