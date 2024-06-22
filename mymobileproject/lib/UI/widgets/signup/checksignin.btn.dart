import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class CheckSigninBtn extends StatefulWidget {
  const CheckSigninBtn({super.key});

  @override
  State<CheckSigninBtn> createState() => _CheckSigninBtnState();
}

class _CheckSigninBtnState extends State<CheckSigninBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("Sign in pressed"),
      child: RichText(
        text: const TextSpan(children: [
          TextSpan(
              text: "Avez vous déjà un compte?",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              text: "  Se connecter",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }
}
