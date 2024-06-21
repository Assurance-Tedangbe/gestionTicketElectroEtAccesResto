import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class Label extends StatelessWidget {
  final String label;
  const Label({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
          color: kPrimaryColor, fontSize: 15.0, fontWeight: FontWeight.w700),
    );
  }
}
