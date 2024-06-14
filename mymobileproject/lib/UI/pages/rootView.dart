import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/home/home.drawer.dart';
import 'package:mymobileproject/UI/widgets/navigation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // static const String _title = 'Accueil';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: HomeDrawer(),
        //     appBar: AppBar(title: const Text(_title)),
        body: Navigation());
  }
}
