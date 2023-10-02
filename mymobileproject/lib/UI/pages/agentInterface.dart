import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/agentInterface.body.dart';

class AgentInterface extends StatefulWidget {
//  const AgentInterface({super.key});

  @override
  State<AgentInterface> createState() => _AgentInterfaceState();
}

class _AgentInterfaceState extends State<AgentInterface> {
  static const String _title = 'Interface Vendeur';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: Body());
  }
}
