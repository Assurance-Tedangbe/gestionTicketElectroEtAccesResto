import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  final IconData bottomicon;

  const BottomIcon({super.key, required this.bottomicon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      bottomicon,
      color: Colors.white,
      size: 35.0,
    );
  }
}
