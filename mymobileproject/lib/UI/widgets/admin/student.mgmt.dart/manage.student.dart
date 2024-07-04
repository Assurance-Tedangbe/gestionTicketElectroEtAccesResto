import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/admin/student.mgmt.dart/manage.student.body.dart';

class ManageStudent extends StatelessWidget {
  static const String _title = 'Gestionnaire des comptes Etudiants';
  const ManageStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: const ManageStudentsBody());
  }
}
