import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/admin/agent.mgmt.dart/manage.agent.body.dart';

class ManageAgent extends StatelessWidget {
  static const String _title = 'Gestionnaire des comptes Agents';
  const ManageAgent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar:
            AppBar(title: const Text(_title, style: TextStyle(fontSize: 19.5))),
        body: const ManageAgentBody());
  }
}
