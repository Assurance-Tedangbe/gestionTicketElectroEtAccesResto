import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/scanqr.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/constants.dart';

class DebitBody extends StatefulWidget {
  const DebitBody({super.key});

  @override
  State<DebitBody> createState() => _DebitBodyState();
}

class _DebitBodyState extends State<DebitBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: size.height * 0.15,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Pour débiter le compte d'un étudiant, vous avez le choix entre scanner son code QR et entrer son n° de compte",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const ScanQR(),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                height: size.height * 0.05,
                width: double.infinity,
                child: const Text(
                  "-------------------OU---------------------",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                height: size.height * 0.4,
                width: size.width * 7,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      studentAccountNumber(),
                      const SizedBox(height: 12),
                      validateBtn()
                    ]),
              ),
            ]),
      ),
    );
  }
}

Widget studentAccountNumber() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'N° compte étudiant',
        style: TextStyle(
          color: kThirdColor,
          fontSize: 15,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        width: 290,
        height: 50,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: kSecondColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
            border: Border.all(color: kPrimaryColor, width: 3)),
        child: const TextField(
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.person, color: kPrimaryColor),
              hintText: 'N° compte etudiant',
              hintStyle: TextStyle(
                color: kPrimaryColor,
                fontSize: 12,
              )),
        ),
      )
    ],
  );
}

Widget validateBtn() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
    width: 320,
    height: 95,
    child: ElevatedButton(
      onPressed: () => print('validate pressed'),
      child: const Text('Valider'),
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        textStyle: const TextStyle(
            color: kSecondColor, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
