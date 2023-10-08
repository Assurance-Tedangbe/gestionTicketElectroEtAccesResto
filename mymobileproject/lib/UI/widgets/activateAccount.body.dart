import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/deactivateAccount.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
              Icons.accessible,
              color: Colors.blue,
              size: 70,
            ),
            const SizedBox(height: 20),
            manageNumberAccount(),
            const SizedBox(height: 12),
            manageActivateBtn(),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              // Creating a icon button
              IconButton(
                iconSize: 60,
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.blue,
                ),
                tooltip: 'désactiver compte',
                // the method which is called when button is pressed
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DeactivateAccount())),
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

Widget manageActivateBtn() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      //  width: double.infinity,
      width: 320,
      height: 95,
      child: ElevatedButton(
        onPressed: () => print('Activate pressed'),
        // ignore: sort_child_properties_last
        child: const Text('Activer compte'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ));
}
