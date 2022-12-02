import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
