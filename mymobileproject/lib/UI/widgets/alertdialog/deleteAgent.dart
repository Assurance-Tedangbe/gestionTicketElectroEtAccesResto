import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/admin/agent.mgmt.dart/manage.agent.dart';

class DeleteAgent extends StatefulWidget {
  const DeleteAgent({super.key});

  @override
  State<DeleteAgent> createState() => _DeleteAgentState();
}

class _DeleteAgentState extends State<DeleteAgent> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Suppression compte Agent'),
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
              .push(MaterialPageRoute(builder: (context) => ManageAgent())),
        ),
        TextButton(
          child: const Text('OUI'),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ManageAgent())),
        ),
      ],
    );
  }
}
