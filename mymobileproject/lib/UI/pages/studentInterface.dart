import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/studentInterface.body.dart';

class StudentInterface extends StatefulWidget {
  // const studentInterface({super.key});

  @override
  State<StudentInterface> createState() => _StudentInterfaceState();
}

class _StudentInterfaceState extends State<StudentInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text('Interface Etudiant')),
        body: Body());
  }
}
