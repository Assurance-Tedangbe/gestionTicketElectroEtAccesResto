import 'package:flutter/material.dart';

class SizeboxHeightSession2 extends StatelessWidget {
  const SizeboxHeightSession2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.001,
    );
  }
}
