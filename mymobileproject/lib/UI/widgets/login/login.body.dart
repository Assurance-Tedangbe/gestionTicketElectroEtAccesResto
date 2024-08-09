import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/login/checksignup.btn.dart';
import 'package:mymobileproject/UI/widgets/login/forgotPwdBtn.dart';
import 'package:mymobileproject/UI/widgets/login/login.btn.dart';
import 'package:mymobileproject/UI/widgets/login/login.emailsection.dart';
import 'package:mymobileproject/UI/widgets/login/login.passwordsection.dart';
import 'package:mymobileproject/constants.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
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
              activeColor: kPrimaryColor,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              }),
        ),
        const Text(
          'Se souvenir',
          style: TextStyle(color: Colors.black, fontSize: 20),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.lock_open,
              color: kPrimaryColor,
              size: 70,
            ),
            const SizedBox(height: 15),
            LoginEmailSection(),
            const SizedBox(height: 15),
            LoginPasswordSection(),
            ForgotPwdBtn(),
            rememberMe(),
            const SizedBox(height: 15),
            LoginBtn(),
            CheckSignupBtn()
          ],
        ),
      ),
    );
    // );
  }
}
