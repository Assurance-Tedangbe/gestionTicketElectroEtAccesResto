import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymobileproject/UI/widgets/home.body.background.dart';
import 'package:mymobileproject/UI/widgets/home.body.roundedButton.dart';
import 'package:mymobileproject/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /* const Text(
              "BIENVENUE AU RESTAURANT mon plat preferé",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),*/
            SizedBox(height: size.height * 0.03),
            const Image(
              image: AssetImage("images/restaurantlogo.png"),
              fit: BoxFit.cover,
              width: 250,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "Se connecter",
              press: () {},
              textColor: Colors.black,
              color: Colors.white,
            ),
            RoundedButton(
              text: "S'inscrire",
              press: () {},
              textColor: Colors.cyanAccent,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
