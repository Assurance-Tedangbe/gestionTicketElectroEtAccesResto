import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/student/studentdrawer.item.dart';

class StudentDrawer extends StatefulWidget {
  const StudentDrawer({super.key});

  @override
  State<StudentDrawer> createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<StudentDrawer> {
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
        "title": "Créditer compte",
        "route": "/credit-account",
        "leadingIcon": Icons.attach_money,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Acheter ticket",
        "route": "/ticket",
        "leadingIcon": Icons.money,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Consulter compte",
        "route": "/consult-account",
        "leadingIcon": Icons.account_balance,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Mise à jour profil",
        "route": "/update-profile",
        "leadingIcon": Icons.update,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Transfert",
        "route": "/transfert-credit",
        "leadingIcon": Icons.transfer_within_a_station,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Annuler recharge",
        "route": "/cancel-recharge",
        "leadingIcon": Icons.cancel,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Annuler transfert",
        "route": "/cancel-transfert",
        "leadingIcon": Icons.cancel,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Se déconnecter",
        "route": "/log-out",
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
                  return StudentDrawerItem(
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
