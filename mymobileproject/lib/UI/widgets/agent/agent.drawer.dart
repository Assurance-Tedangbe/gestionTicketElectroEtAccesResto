import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/agent/agentdrawer.item.dart';

class AgentDrawer extends StatefulWidget {
  const AgentDrawer({super.key});

  @override
  State<AgentDrawer> createState() => _AgentDrawerState();
}

class _AgentDrawerState extends State<AgentDrawer> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> menus = [
      {
        "title": "Activer compte",
        "route": "/activate-account",
        "leadingIcon": Icons.accessible,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Créditer compte",
        "route": "/crediter-compte",
        "leadingIcon": Icons.attach_money,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Consulter compte",
        "route": "/consulter-compte",
        "leadingIcon": Icons.account_balance,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Annuler recharge",
        "route": "/annuler-recharge",
        "leadingIcon": Icons.cancel,
        "trailingIcon": Icons.arrow_forward
      }
    ];

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return AgentDrawerItem(
                      title: menus[index]['title'],
                      leadingIcon: menus[index]['leadingIcon'],
                      trailingIcon: menus[index]['trailingIcon'],
                      onAction: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, menus[index]['route']);
                      });
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 5,
                  );
                },
                itemCount: menus.length),
          ),
        ],
      ),
    );
  }
}
