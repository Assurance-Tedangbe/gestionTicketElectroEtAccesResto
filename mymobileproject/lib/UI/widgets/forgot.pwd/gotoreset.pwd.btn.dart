import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/forgot.pwd/reset.pwd.dart';
import 'package:mymobileproject/constants.dart';

class GoToResetPwdBtn extends StatelessWidget {
  const GoToResetPwdBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25),
          width: double.infinity,
          height: 100,
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ResetPwd())),
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              textStyle: const TextStyle(
                  color: kSecondColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            child: const Text('Suivant'),
          )),
    );
  }
}
