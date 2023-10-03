import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/drawer.dart';
import 'package:mymobileproject/UI/widgets/student.drawer.dart';
import 'package:mymobileproject/UI/widgets/studentInterface.body.dart';

class StudentInterface extends StatefulWidget {
  // const studentInterface({super.key});

  @override
  State<StudentInterface> createState() => _StudentInterfaceState();
}

class _StudentInterfaceState extends State<StudentInterface> {
  static const String _title = 'Interface Etudiant';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: MyDrawer(),
        appBar: AppBar(title: const Text(_title)),
        body: Body());
  }
}
