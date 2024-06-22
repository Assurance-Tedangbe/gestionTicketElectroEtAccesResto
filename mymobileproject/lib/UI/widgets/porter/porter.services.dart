import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/debitAccount.dart';
import 'package:mymobileproject/UI/pages/scanqr.dart';
import 'package:mymobileproject/UI/widgets/home/bloctitle.dart';
import 'package:mymobileproject/UI/widgets/home/container.template.dart';
import 'package:mymobileproject/UI/widgets/home/myhome.body.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';

class PorterServices extends StatelessWidget {
  const PorterServices({super.key});

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
                  builder: (context) => const DebitAccount()));
            },
            servicename: "Debiter compte",
            imagepath: "images/debiter.JPG"),
        ContainerTemplate(
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeBody()));
            },
            servicename: "Historique",
            imagepath: "images/graphic.png"),
      ]),
    ]);
  }
}
