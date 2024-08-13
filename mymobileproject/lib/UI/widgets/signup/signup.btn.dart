import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class SignupBtn extends StatefulWidget {
  const SignupBtn({super.key});

  @override
  State<SignupBtn> createState() => _SignupBtnState();
}

class _SignupBtnState extends State<SignupBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        height: 90,
        child: ElevatedButton(
          onPressed: () => print('Signup pressed'),
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            textStyle: const TextStyle(
                color: kSecondColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: const Text('Créer un compte'),
        ));
  }
}
