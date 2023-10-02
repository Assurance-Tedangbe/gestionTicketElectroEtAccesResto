import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class Body extends StatefulWidget {
  // const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const Background(child: SingleChildScrollView());
  }
}
