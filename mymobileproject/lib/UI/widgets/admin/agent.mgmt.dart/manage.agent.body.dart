import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/admin/agent.mgmt.dart/account.agent.management.dart';

class ManageAgentBody extends StatelessWidget {
  const ManageAgentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Column(children: [AgentMgmt()]),
        ),
      ),
    );
  }
}
