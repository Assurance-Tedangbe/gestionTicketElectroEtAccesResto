import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/studentwidgets/student.drawer.dart';
import 'package:mymobileproject/UI/widgets/studentwidgets/studentInterface.body.dart';

class StudentInterface extends StatefulWidget {
  const StudentInterface({super.key});

  @override
  State<StudentInterface> createState() => _StudentInterfaceState();
}

class _StudentInterfaceState extends State<StudentInterface> {
  static const String _title = 'Interface Etudiant';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: const StudentDrawer(),
        appBar: AppBar(
          title: const Text(_title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Se déconnecter',
              onPressed: () {},
            ),
          ],
        ),
        body: Body());
  }
}
