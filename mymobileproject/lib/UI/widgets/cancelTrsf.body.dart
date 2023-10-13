import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class CancelTrsfBody extends StatefulWidget {
  const CancelTrsfBody({super.key});

  @override
  State<CancelTrsfBody> createState() => _CancelTrsfBodyState();
}

class _CancelTrsfBodyState extends State<CancelTrsfBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: size.height * 0.1,
              width: size.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
                //border: Border.all(color: Colors.blue, width: 3)
              ),
              child: const Text(
                "Pour annuler le transfert de credit que vous venez d'effectuer, veuillez renseigner le n° de référence, le montant transfer& et le n° du destinataire",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Icon(
              Icons.cancel,
              color: Colors.blue,
              size: 70,
            ),
            const SizedBox(height: 20),
            referenceNumber(),
            const SizedBox(height: 12),
            recipientNumber(),
            const SizedBox(height: 12),
            amount(),
            const SizedBox(height: 12),
            cancelBtn(),
          ],
        ),
      ),
    );
  }
}

Widget referenceNumber() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'N° de référence',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        width: 300,
        height: 50,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
            border: Border.all(color: Colors.blue, width: 3)),
        child: const TextField(
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
          ),
        ),
      )
    ],
  );
}

Widget recipientNumber() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'N° compte destinataire',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        width: 300,
        height: 50,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
            border: Border.all(color: Colors.blue, width: 3)),
        child: const TextField(
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
          ),
        ),
      )
    ],
  );
}

Widget amount() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Montant transferé',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        width: 300,
        height: 50,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
            border: Border.all(color: Colors.blue, width: 3)),
        child: const TextField(
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
          ),
        ),
      )
    ],
  );
}

Widget cancelBtn() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
    width: 320,
    height: 95,
    child: ElevatedButton(
      onPressed: () => print('cancel pressed'),
      child: const Text('Annuler transfert'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
