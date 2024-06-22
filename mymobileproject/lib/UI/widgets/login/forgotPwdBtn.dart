import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/forgot.pwd.dart';
import 'package:mymobileproject/constants.dart';

class ForgotPwdBtn extends StatefulWidget {
  const ForgotPwdBtn({super.key});

  @override
  State<ForgotPwdBtn> createState() => _ForgotPwdBtnState();
}

class _ForgotPwdBtnState extends State<ForgotPwdBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ForgotPwd())),
        child: const Text(
          'Mot de passe oublié?',
          style: TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.w800, fontSize: 17),
        ),
      ),
    );
  }
}
