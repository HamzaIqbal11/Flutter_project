import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mini_project/Screens/cart.dart/cartlist.dart';
import 'package:mini_project/Screens/cart.dart/cartview.dart';
import 'package:mini_project/Screens/customwidgets/colors.dart';
import 'package:mini_project/Screens/customwidgets/customappbar.dart';
import 'package:mini_project/Screens/customwidgets/custombutton.dart';
import 'package:mini_project/Screens/favourites/favorites.dart';

class DetailView extends StatefulWidget {
  final Map<String, dynamic> shopProducts;
  const DetailView({super.key, required this.shopProducts});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  double afterDiscountPrice(detailPage) {
    final double sellingPrice = detailPage['price'] - detailPage['discount'];
    return sellingPrice;
  }

  int activePage = 0;

  final PageController pageController = PageController(
    initialPage: 0,
  );

  addToCart(addCartProduct) {
    myCart.add(addCartProduct);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          // itemCount: widget.shopProducts['detail'].length,
          itemCount: 1,
          itemBuilder: (context, index) {
            final detailPage = widget.shopProducts['detail'][index];
            final addCartProduct = widget.shopProducts;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      const CustomWhiteAppBar(
                        iconCart: Icons.shopping_bag_outlined,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 245,
                                  width: 245,
                                  child: PageView.builder(
                                    onPageChanged: (index) {
                                      setState(() {
                                        activePage = index;
                                      });
                                    },
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      final String image = detailPage['image'];
                                      final String image2 =
                                          detailPage['image2'];
                                      final String image3 =
                                          detailPage['image3'];
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(180),
                                        child: Container(
                                          height: 245,
                                          width: 245,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Image.network(
                                            activePage == 0
                                                ? image
                                                : activePage == 1
                                                    ? image2
                                                    : image3,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: activePage == index ? 6 : 4,
                                  width: activePage == index ? 30 : 20,
                                  decoration: BoxDecoration(
                                      color: activePage == index
                                          ? color.colors
                                          : color.black,
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                              )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detailPage['category'],
                            ),
                            Text(
                              detailPage['productname'],
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (detailPage['isFav'] == false) {
                                  favItem.add(detailPage);
                                  detailPage['isFav'] = true;
                                } else {
                                  favItem.remove(detailPage);
                                  detailPage['isFav'] = false;
                                }
                              });
                              print(favItem.length);
                            },
                            icon: const Icon(Icons.favorite),
                            color: detailPage['isFav'] == false
                                ? color.black
                                : color.red)
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${afterDiscountPrice(detailPage)}',
                        ),
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                              color: color.themecolor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Center(
                              child: Text(
                                '\$${detailPage['discount']} OFF',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Reg: \$${detailPage['price'].toStringAsFixed(2)}',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    child: Row(
                      children: [
                        RatingBar.builder(
                          itemSize: 20,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '110 Reviews',
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            buttonText: 'Add to Cart',
                            onPressed: () {
                              addToCart(addCartProduct);
                            },
                            buttonColor: color.black,
                            borderColor: color.themecolor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomButton(
                            buttonText: 'Buy Now',
                            onPressed: () async {
                              await Navigator.of(context)
                                  .push(MaterialPageRoute(
                                builder: (context) => const CartView(),
                              ));
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    child: Text(
                      'Details',
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                    child: Text(
                      detailPage['description'],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nutritional facts',
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 35,
                          color: color.black,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reviews',
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 35,
                          color: color.black,
                        ),
                      ],
                    ),
                  ),
                ]);
          },
        ),
      ),
    );
  }
}
