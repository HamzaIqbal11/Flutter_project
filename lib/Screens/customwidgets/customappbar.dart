import 'package:flutter/material.dart';
import 'package:mini_project/Screens/cart.dart/cartlist.dart';
import 'package:mini_project/Screens/cart.dart/cartview.dart';
import 'package:mini_project/Screens/customwidgets/colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';

class CustomWhiteAppBar extends StatefulWidget {
  final String? title;
  final IconData? icon;
  final IconData? iconCart;
  final Padding? padding;
  const CustomWhiteAppBar(
      {super.key, this.title, this.icon, this.iconCart, this.padding});

  @override
  State<CustomWhiteAppBar> createState() => _CustomWhiteAppBarState();
}

class _CustomWhiteAppBarState extends State<CustomWhiteAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 50,
        bottom: 30,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 10,
                  color: color.black,
                )),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            widget.title ?? '',
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                widget.icon,
                size: 22,
                color: color.black,
              )),
          badges.Badge(
            showBadge: myCart.isEmpty ? false : true,
            badgeContent: Text(
              myCart.length.toString(),
            ),
            badgeStyle: BadgeStyle(badgeColor: color.colors),
            position: BadgePosition.topEnd(top: 0, end: 0),
            child: IconButton(
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartView(),
                  ));
                  setState(() {});
                },
                icon: Icon(
                  widget.iconCart,
                  size: 22,
                  color: color.black,
                )),
          ),
        ],
      ),
    );
  }
}
