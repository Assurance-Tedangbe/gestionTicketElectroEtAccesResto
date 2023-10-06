import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/porter/porterdrawer.item.dart';

class PortierDrawer extends StatefulWidget {
  const PortierDrawer({super.key});

  @override
  State<PortierDrawer> createState() => _PortierDrawerState();
}

class _PortierDrawerState extends State<PortierDrawer> {
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
    ];

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return PortierDrawerItem(
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
