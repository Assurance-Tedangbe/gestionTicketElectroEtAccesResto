import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/activateAccount.dart';
import 'package:mymobileproject/UI/pages/deactivateAccount.dart';
import 'package:mymobileproject/UI/widgets/home/container.template.dart';
import 'package:mymobileproject/UI/widgets/home/myhome.body.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';

class ManageAgent extends StatelessWidget {
  const ManageAgent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizeboxTemplate(),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ContainerTemplate(
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeBody()));
            },
            servicename: "Lister agents",
            imagepath: "images/graphic.png"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ActivateAccount()));
            },
            servicename: "Activer compte",
            imagepath: "images/graphic.png"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DeactivateAccount()));
            },
            servicename: "Désactiver compte",
            imagepath: "images/graphic.png"),
      ]),
      const SizeboxTemplate(),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeBody()));
            },
            servicename: "Modifier compte",
            imagepath: "images/graphic.png"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeBody()));
            },
            servicename: "Supprimer compte",
            imagepath: "images/graphic.png"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeBody()));
            },
            servicename: "Historique",
            imagepath: "images/graphic.png"),
      ])
    ]);
  }
}
