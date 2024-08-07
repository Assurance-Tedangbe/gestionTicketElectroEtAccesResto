import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class StatisticsLabel extends StatelessWidget {
  final String label;
  const StatisticsLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
          color: kThirdColor, fontSize: 16.0, fontWeight: FontWeight.bold),
    );
  }
}
