import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/drawer.header.dart';
import 'package:mymobileproject/UI/widgets/drawer.item.widget.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> menus = [
      {
        "title": "Accueil",
        "route": "/home",
        "leadingIcon": Icons.home,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Connexion",
        "route": "/login",
        "leadingIcon": Icons.login,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Interface étudiant",
        "route": "/etudiant",
        "leadingIcon": Icons.person,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Mise à jour profil",
        "route": "/updateProfile",
        "leadingIcon": Icons.update,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Interface portier",
        "route": "/portier",
        "leadingIcon": Icons.person,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Interface vendeur",
        "route": "/vendeur",
        "leadingIcon": Icons.person,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Créer compte",
        "route": "/addAccount",
        "leadingIcon": Icons.person_add,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Désactiver compte",
        "route": "/deactivateAccount",
        "leadingIcon": Icons.disabled_by_default,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Paramètres",
        "route": "/settings",
        "leadingIcon": Icons.person,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Deconnexion",
        "route": "/logout",
        "leadingIcon": Icons.logout,
        "trailingIcon": Icons.arrow_forward
      }
    ];
    return Drawer(
      child: Column(
        children: [
          const MyDrawerHeader(),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return DrawerItemWidget(
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
