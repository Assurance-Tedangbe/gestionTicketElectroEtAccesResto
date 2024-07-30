import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/admin/porter.mgmt.dart/manage.porter.dart';

class DeletePorter extends StatefulWidget {
  const DeletePorter({super.key});

  @override
  State<DeletePorter> createState() => _DeletePorterState();
}

class _DeletePorterState extends State<DeletePorter> {
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
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ManagePorter())),
        ),
        TextButton(
          child: const Text('OUI'),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ManagePorter())),
        ),
      ],
    );
  }
}
