import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/cancelTransfertCredit.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/amountSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/passwordTrsfSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/recipientNumberSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/trsfCreditBtn.dart';
import 'package:mymobileproject/constants.dart';

class TransfertBody extends StatefulWidget {
  const TransfertBody({super.key});

  @override
  State<TransfertBody> createState() => _TransfertBodyState();
}

class _TransfertBodyState extends State<TransfertBody> {
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
            const SizeboxHeight(),
            RecipientNumberSection(),
            const SizeboxTemplate(),
            AmountSection(),
            const SizeboxTemplate(),
            PasswordTrsfSection(),
            const SizeboxTemplate(),
            TrnasfertCreditBtn(),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              IconButton(
                iconSize: 60,
                icon: const Icon(
                  Icons.cancel,
                  color: kPrimaryColor,
                ),
                tooltip: 'Annuler transfert crédit',
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CancelTrsfCredit())),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

/* Widget recipientNumber() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Numéro compte destinataire',
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
}*/

/* Widget amount() {
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
}*/

/* Widget password() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Votre mot de passe',
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
          //  keyboardType: TextInputType.emailAddress,
          obscureText: true,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(Icons.password, color: Colors.blue),
            hintText: 'Mot de passe',
            hintStyle: TextStyle(
              color: Colors.blue,
              fontSize: 12,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: Colors.blue,
            ),
            border: InputBorder.none,
          ),
        ),
      )
    ],
  );
}*/

/* Widget validateBtn() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
    //  width: double.infinity,
    width: 320,
    height: 95,
    child: ElevatedButton(
      onPressed: () => print('validate pressed'),
      child: const Text('Valider'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
} */
