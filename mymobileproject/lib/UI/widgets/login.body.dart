import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/home.body.roundedButton.dart';
import 'package:mymobileproject/UI/widgets/login.body.background.dart';
import 'package:mymobileproject/UI/widgets/login.body.checkaccount.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isRememberMe = false;

  Widget rememberMe() {
    return Container(
      height: 20,
      child: Row(children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.blue),
          child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.white,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              }),
        ),
        Text(
          'Se souvenir',
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 130),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Se Connecter",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Color.fromRGBO(30, 144, 255, 0.9)),
            ),
            SizedBox(height: size.height * 0.07),
            manageEmail(),
            SizedBox(height: 20),
            managePassword(),
            manageForgotPasswordBtn(),
            rememberMe(),
            SizedBox(height: 20),
            // RoundedButton(text: "Se connecter", press: () {}),
          ],
        ),
      ),

      /* CheckAccount(
            press: () {},
          )*/
    ));
  }
}

Widget manageEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.email, color: Colors.white),
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.white,
              )),
        ),
      )
    ],
  );
}

Widget managePassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Mot de passe',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextField(
          //  keyboardType: TextInputType.emailAddress,
          obscureText: true,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.lock, color: Colors.white),
              hintText: 'Mot de passe',
              hintStyle: TextStyle(
                color: Colors.white,
              )),
        ),
      )
    ],
  );
}

Widget manageForgotPasswordBtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () => print("Forgot password pressed"),
      child: Text(
        'Mot de passe oublié?',
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
  );
}
