import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/home/home.drawer.header.dart';
import 'package:mymobileproject/UI/widgets/home/home.drawer.item.widget.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> menus = [
      {
        "title": "Créer compte",
        "route": "/sign-up",
        "leadingIcon": Icons.person_add,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Activer compte",
        "route": "/activate-account",
        "leadingIcon": Icons.account_box,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Interface étudiant",
        "route": "/student",
        "leadingIcon": Icons.person,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Mise à jour profil",
        "route": "/update-profile",
        "leadingIcon": Icons.update,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Interface portier",
        "route": "/porter",
        "leadingIcon": Icons.person,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Interface vendeur",
        "route": "/agent",
        "leadingIcon": Icons.person,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Désactiver compte",
        "route": "/deactivate-account",
        "leadingIcon": Icons.disabled_by_default,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Deconnexion",
        "route": "/log-out",
        "leadingIcon": Icons.logout,
        "trailingIcon": Icons.arrow_forward
      }
    ];
    return Drawer(
      child: Column(
        children: [
          const HomeDrawerHeader(),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return HomeDrawerItemWidget(
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
