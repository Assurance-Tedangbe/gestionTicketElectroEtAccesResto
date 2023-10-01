import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/home.body.background.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Background(child: SingleChildScrollView());
  }
}
