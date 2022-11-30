import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String _title = 'Accueil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(title: const Text(_title)),
      body: Center(
        child: Column(
          children: [
            const Image(
              image: AssetImage("images/restaurantlogo.png"),
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Connexion"),
            ),
          ],
        ),
      ),
    );
  }
}
