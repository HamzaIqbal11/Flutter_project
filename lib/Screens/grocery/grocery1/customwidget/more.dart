import 'package:flutter/material.dart';

class MorePopup extends StatelessWidget {
  const MorePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) => [
              PopupMenuItem(child: Text("Hello")),
              PopupMenuItem(child: Text("Hello")),
              PopupMenuItem(child: Text("Hello"))
            ]);
  }
}
