import 'package:flutter/material.dart';

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({super.key});

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Theme.of(context).primaryColor,
          ]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("images/restaurantlogo.png"),
              radius: 30,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ));
  }
}
