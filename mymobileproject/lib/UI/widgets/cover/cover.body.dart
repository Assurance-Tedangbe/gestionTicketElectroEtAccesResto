import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/login.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/cover/cover.body.roundedButton.dart';

class CoverBody extends StatefulWidget {
  // const Body({super.key});

  @override
  State<CoverBody> createState() => _CoverBodyState();
}

class _CoverBodyState extends State<CoverBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of our screen
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
              color: Colors.blue,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              // Navigator.pushNamed(context, "/login");
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
