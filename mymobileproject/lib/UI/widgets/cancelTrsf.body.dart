import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class CancelTrsfBody extends StatefulWidget {
  const CancelTrsfBody({super.key});

  @override
  State<CancelTrsfBody> createState() => _CancelTrsfBodyState();
}

class _CancelTrsfBodyState extends State<CancelTrsfBody> {
  @override
  Widget build(BuildContext context) {
    return const Background(child: SingleChildScrollView());
  }
}
