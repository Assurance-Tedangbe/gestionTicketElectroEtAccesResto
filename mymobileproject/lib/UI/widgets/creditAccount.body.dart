import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/cancelRecharge.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/constants.dart';

class CreditBody extends StatefulWidget {
  const CreditBody({super.key});

  @override
  State<CreditBody> createState() => _CreditBodyState();
}

class _CreditBodyState extends State<CreditBody> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.attach_money,
              color: kPrimaryColor,
              size: 70,
            ),
            const SizedBox(height: 20),
            manageNumberAccount(),
            const SizedBox(height: 12),
            manageAmount(),
            const SizedBox(height: 12),
            manageRechargeBtn(),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              IconButton(
                iconSize: 60,
                icon: const Icon(
                  Icons.cancel,
                  color: kPrimaryColor,
                ),
                tooltip: 'Annuler recharge',
                // the method which is called when button is pressed
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CancelRecharge())),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

Widget manageNumberAccount() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Numéro compte etudiant',
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

Widget manageAmount() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Montant',
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
              prefixIcon: Icon(Icons.attach_money, color: Colors.blue),
              hintText: 'Montant',
              hintStyle: TextStyle(
                color: Colors.blue,
                fontSize: 12,
              )),
        ),
      )
    ],
  );
}

Widget manageRechargeBtn() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
    //  width: double.infinity,
    width: 320,
    height: 95,
    child: ElevatedButton(
      onPressed: () => print('Credit pressed'),
      child: const Text('Créditer compte'),
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
