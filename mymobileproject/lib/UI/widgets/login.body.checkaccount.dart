import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class CheckAccount extends StatelessWidget {
  final bool login;
  final Function press;
  const CheckAccount({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "N'avez vous pas de compte?" : "J'en ai déjà?",
          style: const TextStyle(color: kPrimaryColor, fontSize: 15),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            login ? " S'inscrire" : "Se connecter",
            style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        )
      ],
    );
  }
}
