import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Déconnexion'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Etes-vous sûr de vouloir vous déconnecteer'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Oui'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget logoutBtn() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        height: 100,
        width: 170,
        child: ElevatedButton(
          onPressed: _showAlertDialog,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: const Text('Se déconnecter'),
        ));
  }

  Widget animated() {
    return AnimatedButton(
      text: "success",
      color: Colors.green,
      pressEvent: () {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.bottomSlide,
                showCloseIcon: true,
                title: "Succès",
                desc: "active",
                btnOkOnPress: () {})
            .show();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.logout,
              color: Colors.blue,
              size: 70,
            ),
            const SizedBox(height: 12),
            logoutBtn(),
            const SizedBox(height: 12),
            animated(),
          ],
        ),
      ),
    );
  }
}
