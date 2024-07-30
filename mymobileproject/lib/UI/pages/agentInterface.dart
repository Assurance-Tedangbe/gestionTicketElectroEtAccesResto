import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/logout.dart';
import 'package:mymobileproject/UI/pages/research.dart';
import 'package:mymobileproject/UI/widgets/agent/agent.drawer.dart';
import 'package:mymobileproject/UI/widgets/agent/agentInterface.body.dart';

class AgentInterface extends StatefulWidget {
  const AgentInterface({super.key});

  @override
  State<AgentInterface> createState() => _AgentInterfaceState();
}

class _AgentInterfaceState extends State<AgentInterface> {
  static const String _title = 'Interface Agent';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const AgentDrawer(),
      appBar: AppBar(
        title: const Text(_title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Rechercher des services',
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ServiceResearch())),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Se déconnecter',
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const LogOut())),
          ),
        ],
      ),
      body: const AgentBody(),
      //  bottomNavigationBar: NavigationBarAgent(),
    );
  }
}
