import 'package:flutter/material.dart';
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
        const Text(
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
      //  child: SingleChildScrollView(
      // physics: const AlwaysScrollableScrollPhysics(),
      //  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 130),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.lock_open,
              color: Colors.blue,
              size: 70,
            ),
            /*   const Text(
              "Se Connecter",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Color.fromRGBO(30, 144, 255, 0.9)),
            ),*/
            //    SizedBox(height: size.height * 0.07),
            const SizedBox(height: 15),
            manageEmail(),
            const SizedBox(height: 15),
            managePassword(),
            manageForgotPasswordBtn(),
            rememberMe(),
            const SizedBox(height: 15),
            manageLoginBtn(),
            CheckAccount(
              press: () {},
            )
          ],
        ),
      ),
    );
    // );
  }
}

Widget manageEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Email',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              const BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: const TextField(
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
      const Text(
        'Mot de passe',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              const BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: const TextField(
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
      child: const Text(
        'Mot de passe oublié?',
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
  );
}

Widget manageLoginBtn() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      height: 100,
      child: ElevatedButton(
        onPressed: () => print('Login pressed'),
        child: const Text('Se connecter'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          //side: const BorderSide(color: Colors.cyanAccent, width: 1),
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ));
}
