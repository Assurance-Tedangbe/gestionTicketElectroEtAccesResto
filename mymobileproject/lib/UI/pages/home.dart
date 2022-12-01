import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/home.body.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String _title = 'Accueil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(title: const Text(_title)),
        body: const Body());
  }
}
