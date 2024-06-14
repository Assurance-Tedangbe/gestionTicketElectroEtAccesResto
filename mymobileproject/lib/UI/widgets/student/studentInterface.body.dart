import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class StudentBody extends StatefulWidget {
//  const Body({super.key});

  @override
  State<StudentBody> createState() => _StudentBodyState();
}

class _StudentBodyState extends State<StudentBody> {
  @override
  Widget build(BuildContext context) {
    return const Background(child: SingleChildScrollView());
  }
}
