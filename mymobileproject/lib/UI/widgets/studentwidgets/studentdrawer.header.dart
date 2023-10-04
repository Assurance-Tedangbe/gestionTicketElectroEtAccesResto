import 'package:flutter/material.dart';

class StudentDrawerHeader extends StatefulWidget {
  const StudentDrawerHeader({super.key});

  @override
  State<StudentDrawerHeader> createState() => _StudentDrawerHeaderState();
}

class _StudentDrawerHeaderState extends State<StudentDrawerHeader> {
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
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Déconnexion"),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
                ])
          ],
        ));
  }
}
