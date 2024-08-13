import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/activateAccount.dart';
import 'package:mymobileproject/UI/pages/cancelRecharge.dart';
import 'package:mymobileproject/UI/pages/creditAccount.dart';
import 'package:mymobileproject/UI/pages/scanqr.dart';
import 'package:mymobileproject/UI/widgets/home/bloctitle.dart';
import 'package:mymobileproject/UI/widgets/home/container.template.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';

class AgentServices extends StatelessWidget {
  const AgentServices({super.key});

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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ScanQR()));
            },
            servicename: "Scan QR",
            imagepath: "images/scan.JPG"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CreditAccount()));
            },
            servicename: "Créditer compte",
            imagepath: "images/crediter.JPG"),
        /*   ContainerTemplate(
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ConsultAccount()));
            },
            servicename: "Consulter compte",
            imagepath: "images/graphic.png"),*/
      ]),
      const SizeboxTemplate(),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CancelRecharge()));
            },
            servicename: "Annuler recharge",
            imagepath: "images/annuler_transaction.JPG"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ActivateAccount()));
            },
            servicename: "Activer compte",
            imagepath: "images/graphic.png"),
        /*  ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Historic()));
            },
            servicename: "Historique",
            imagepath: "images/historic.JPG"), */
      ])
    ]);
  }
}
