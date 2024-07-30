import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/admin/student.mgmt.dart/manage.student.dart';

class DeleteStudent extends StatefulWidget {
  const DeleteStudent({super.key});

  @override
  State<DeleteStudent> createState() => _DeleteStudentState();
}

class _DeleteStudentState extends State<DeleteStudent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Suppression compte Etudiant'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Etes-vous sûr de vouloir supprimer ce compte'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('ANNULER'),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ManageStudent())),
        ),
        TextButton(
          child: const Text('OUI'),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ManageStudent())),
        ),
      ],
    );
  }
}
