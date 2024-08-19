import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/login.dart';
import 'package:mymobileproject/UI/pages/signup.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/cover/cover.body.roundedButton.dart';
import 'package:mymobileproject/constants.dart';

class CoverBody extends StatelessWidget {
  const CoverBody({super.key});

  @override
  Widget build(BuildContext context) {
    //This size provides us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: size.height * 0.1,
              width: size.width * 0.5,
              color: kPrimaryColor,
              child: const Text(
                "SenTicket",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            const Image(
              image: AssetImage("images/restaurantlogo.png"),
              fit: BoxFit.cover,
              width: 250,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "Se connecter",
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              //    Navigator.pushNamed(context, "/login");
              color: kSecondColor,
            ),
            RoundedButton(
              text: "S'inscrire",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpPage()));
              },
              color: kSecondColor,
            ),
          ],
        ),
      ),
    );
  }
}
