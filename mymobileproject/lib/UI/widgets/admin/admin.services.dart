import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/admin/agent.mgmt.dart/manage.agent.dart';
import 'package:mymobileproject/UI/widgets/admin/porter.mgmt.dart/manage.porter.dart';
import 'package:mymobileproject/UI/widgets/admin/student.mgmt.dart/manage.student.dart';
import 'package:mymobileproject/UI/widgets/home/bloctitle.dart';
import 'package:mymobileproject/UI/widgets/home/container.template.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';

class AdminServices extends StatelessWidget {
  const AdminServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [BlocTitle(text: "Mes services")],
      ),
      const SizeboxTemplate(),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ManageStudent()));
            },
            servicename: "Gérer Etudiants",
            imagepath: "images/account_mgt_icon.jpeg"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ManageAgent()));
            },
            servicename: "Gérer Agents",
            imagepath: "images/account_mgt_icon.jpeg"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ManagePorter()));
            },
            servicename: "Gérer Portiers",
            imagepath: "images/account_mgt_icon.jpeg"),
      ]),
      /*  const SizeboxTemplate(),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ManagePorter()));
            },
            servicename: "Gérer Portiers",
            imagepath: "images/graphic.png"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeBody()));
            },
            servicename: "Historique",
            imagepath: "images/historic.JPG"),
      ]) */
    ]);
  }
}
