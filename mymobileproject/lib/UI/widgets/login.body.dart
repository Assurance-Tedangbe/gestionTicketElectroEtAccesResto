import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/home.body.roundedButton.dart';
import 'package:mymobileproject/UI/widgets/login.body.background.dart';
import 'package:mymobileproject/UI/widgets/login.body.checkaccount.dart';
import 'package:mymobileproject/UI/widgets/login.body.roundedinputfield.dart';
import 'package:mymobileproject/UI/widgets/login.body.roundedpasswordfield.dart';
import 'package:mymobileproject/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: <Widget>[
          const Image(
            image: AssetImage("images/login.jpg"),
            fit: BoxFit.cover,
            width: 300,
          ),
          SizedBox(height: size.height * 0.05),
          RoundedInputField(
            hintText: 'Email',
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(text: "Se connecter", press: () {}),
          SizedBox(height: size.height * 0.02),
          CheckAccount(
            press: () {},
          )
        ],
      ),
    );
  }
}
