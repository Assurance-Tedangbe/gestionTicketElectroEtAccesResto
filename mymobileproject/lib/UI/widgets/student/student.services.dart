import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/buyTicket.dart';
import 'package:mymobileproject/UI/pages/cancelTransfertTicket.dart';
import 'package:mymobileproject/UI/pages/consultAccount.dart';
import 'package:mymobileproject/UI/pages/creditAccount.dart';
import 'package:mymobileproject/UI/pages/historic.dart';
import 'package:mymobileproject/UI/pages/scanqr.dart';
import 'package:mymobileproject/UI/pages/transfert.ticket.dart';
import 'package:mymobileproject/UI/pages/transfertCredit.dart';
import 'package:mymobileproject/UI/pages/updateProfile.dart';
import 'package:mymobileproject/UI/widgets/home/bloctitle.dart';
import 'package:mymobileproject/UI/widgets/home/container.template.dart';
import 'package:mymobileproject/UI/widgets/home/sizeboxHeightSession.dart';

class StudentServices extends StatelessWidget {
  const StudentServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [BlocTitle(text: "Mes services")],
      ),
      const SizeboxHeightSession(),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const BuyTicket()));
            },
            servicename: "Acheter ticket",
            imagepath: "images/ticket.JPG"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TransfertTicket()));
            },
            servicename: "Transfert ticket",
            imagepath: "images/transfert.JPG"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ConsultAccount()));
            },
            servicename: "Consulter compte",
            imagepath: "images/consult_icon.JPG"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ScanQR()));
            },
            servicename: "Scan QR",
            imagepath: "images/scan.JPG")
      ]),
      const SizeboxHeightSession(),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CancelTrsfTicket()));
            },
            servicename: "Annuler transfert",
            imagepath: "images/annuler_transaction.JPG"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CreditAccount()));
            },
            servicename: "Créditer compte",
            imagepath: "images/crediter.JPG"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Historic()));
            },
            servicename: "Historique",
            imagepath: "images/historic.JPG"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TransfertCredit()));
            },
            servicename: "Transfert crédit",
            imagepath: "images/transfert.JPG")
      ])
    ]);
  }
}
