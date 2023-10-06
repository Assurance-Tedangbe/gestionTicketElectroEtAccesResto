import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/agent/agent.drawer.dart';
import 'package:mymobileproject/UI/widgets/agent/agentInterface.body.dart';

class AgentInterface extends StatefulWidget {
  const AgentInterface({super.key});

  @override
  State<AgentInterface> createState() => _AgentInterfaceState();
}

class _AgentInterfaceState extends State<AgentInterface> {
  static const String _title = 'Interface Vendeur';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const AgentDrawer(),
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
      body: Body(),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {});
            },
            tooltip: 'Accueil',
            icon: const Icon(
              Icons.home,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {});
            },
            tooltip: 'Activer compte',
            icon: const Icon(
              Icons.accessible,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {});
            },
            tooltip: 'Crediter un compte',
            icon: const Icon(
              Icons.attach_money,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {});
              },
              tooltip: 'Consulter un compte',
              icon: const Icon(
                Icons.account_balance,
                color: Colors.white,
                size: 35,
              )),
        ],
      ),
    );
  }
}
