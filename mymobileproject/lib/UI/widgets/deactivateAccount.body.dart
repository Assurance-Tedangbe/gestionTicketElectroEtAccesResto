import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/activateAccount.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';
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
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const PageIconTemplate(iconData: Icons.no_accounts),
            const SizeboxHeight(),
            manageNumberAccount(),
            const SizeboxTemplate(),
            manageDeactivateBtn(),
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
              hintStyle: TextStyle(color: Colors.blue, fontSize: 12)),
        ),
      )
    ],
  );
}

Widget manageDeactivateBtn() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      //  width: double.infinity,
      width: 320,
      height: 95,
      child: ElevatedButton(
        onPressed: () => print('Deactivate pressed'),
        // ignore: sort_child_properties_last
        child: const Text('Désactiver compte'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ));
}
