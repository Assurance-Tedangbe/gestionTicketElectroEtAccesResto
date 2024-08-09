import 'package:flutter/material.dart';

class SizeboxHeightSession extends StatelessWidget {
  const SizeboxHeightSession({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 50,
    );
  }
}
