import 'package:flutter/material.dart';

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
        height: 100,
        child: ElevatedButton(
          onPressed: () => print('Signup pressed'),
          child: const Text('Créer un compte'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
