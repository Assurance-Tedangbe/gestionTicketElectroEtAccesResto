import 'package:flutter/material.dart';

class SizeboxTemplate extends StatelessWidget {
  const SizeboxTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 35,
    );
  }
}
