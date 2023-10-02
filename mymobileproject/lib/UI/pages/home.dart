import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/home.body.dart';

import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String _title = 'Accueil';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: const MyDrawer(),
        appBar: AppBar(title: const Text(_title)),
        body: Body());
  }
}
