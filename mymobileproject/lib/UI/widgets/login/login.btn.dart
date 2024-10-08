import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/home.dart';
import 'package:mymobileproject/constants.dart';

class LoginBtn extends StatefulWidget {
  const LoginBtn({super.key});

  @override
  State<LoginBtn> createState() => _LoginBtnState();
}

class _LoginBtnState extends State<LoginBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        height: 100,
        child: ElevatedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Home())),
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            textStyle: const TextStyle(
                color: kSecondColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: const Text('Se connecter'),
        ));
  }
}
