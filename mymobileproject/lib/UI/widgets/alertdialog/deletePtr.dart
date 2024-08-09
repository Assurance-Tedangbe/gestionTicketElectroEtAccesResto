import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/adminInterface.dart';
import 'package:mymobileproject/UI/widgets/admin/porter.mgmt.dart/manage.porter.dart';

class DeletePtr extends StatefulWidget {
  const DeletePtr({super.key});

  @override
  State<DeletePtr> createState() => _DeletePtrState();
}

class _DeletePtrState extends State<DeletePtr> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Suppression compte Portier'),
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
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ManagePorter())),
        ),
        TextButton(
          child: const Text('OUI'),
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ManagePorter())),
        ),
      ],
    );
  }
}
