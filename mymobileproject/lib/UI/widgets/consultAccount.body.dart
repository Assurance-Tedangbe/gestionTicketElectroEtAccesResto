import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class ConsultBody extends StatefulWidget {
  const ConsultBody({super.key});

  @override
  State<ConsultBody> createState() => _ConsultBodyState();
}

class _ConsultBodyState extends State<ConsultBody> {
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
                "Pour voir l'état du compte, veuillez renseigner son n° et cliquez sur le bouton pour afficher les informations",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Icon(
              Icons.account_balance,
              color: Colors.blue,
              size: 70,
            ),
            const SizedBox(height: 20),
            studentAccountNumber(),
            const SizedBox(height: 12),
            validateBtn(),
          ],
        ),
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
              prefixIcon: Icon(Icons.person, color: Colors.blue),
              hintText: 'N° compte etudiant',
              hintStyle: TextStyle(
                color: Colors.blue,
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
    //  width: double.infinity,
    width: 320,
    height: 95,
    child: ElevatedButton(
      onPressed: () => print('validate pressed'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      child: const Text('Consulter'),
    ),
  );
}
