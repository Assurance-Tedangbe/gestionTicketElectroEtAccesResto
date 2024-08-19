import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/activateAccount.dart';
import 'package:mymobileproject/UI/pages/home.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/updateUser/pageIconTemplate.dart';
import 'package:mymobileproject/constants.dart';

class DeactivateAccountBody extends StatefulWidget {
  const DeactivateAccountBody({super.key});

  @override
  State<DeactivateAccountBody> createState() => _DeactivateAccountBodyState();
}

class _DeactivateAccountBodyState extends State<DeactivateAccountBody> {
  @override
  Widget build(BuildContext context) {
    Widget desactivationBtnAnimated() {
      return AnimatedButton(
        text: "Désactiver compte",
        color: kPrimaryColor,
        width: 290,
        height: 90,
        pressEvent: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.bottomSlide,
            showCloseIcon: true,
            title: "Succès",
            desc: "compte desactivé",
            btnOkOnPress: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Home())),
          ).show();
        },
      );
    }

    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const PageIconTemplate(iconData: Icons.no_accounts),
            const SizeboxHeight(),
            manageNumberAccount(),
            const SizeboxHeight(),
            desactivationBtnAnimated(),
            // manageDeactivateBtn(),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              IconButton(
                iconSize: 40,
                icon: const Icon(
                  Icons.account_circle,
                  color: kPrimaryColor,
                ),
                tooltip: 'Réactiver compte',
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ActivateAccount())),
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
                  color: boxshadowColor, blurRadius: 6, offset: Offset(0, 2))
            ],
            border: Border.all(color: kPrimaryColor, width: 3)),
        child: const TextField(
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: enterTextFieldColor,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.person, color: kPrimaryColor),
              hintText: 'N° compte etudiant',
              hintStyle: TextStyle(color: kPrimaryColor, fontSize: 12)),
        ),
      )
    ],
  );
}

Widget manageDeactivateBtn() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      width: 320,
      height: 95,
      child: ElevatedButton(
        onPressed: () => print('Deactivate pressed'),
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          textStyle: const TextStyle(
              color: kSecondColor, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        child: const Text('Désactiver compte'),
      ));
}
