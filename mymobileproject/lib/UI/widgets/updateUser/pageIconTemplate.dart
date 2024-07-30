import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class PageIconTemplate extends StatelessWidget {
  final IconData iconData;
  const PageIconTemplate({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: kPrimaryColor,
      size: 70,
    );
  }
}
