import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/login/checksignup.btn.dart';
import 'package:mymobileproject/UI/widgets/login/forgotPwdBtn.dart';
import 'package:mymobileproject/UI/widgets/login/login.btn.dart';
import 'package:mymobileproject/UI/widgets/login/login.emailsection.dart';
import 'package:mymobileproject/UI/widgets/login/login.passwordsection.dart';
import 'package:mymobileproject/UI/widgets/login/rememberme.dart';
import 'package:mymobileproject/constants.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.lock_open,
              color: kPrimaryColor,
              size: 70,
            ),
            SizedBox(height: 15),
            LoginEmailSection(),
            SizedBox(height: 15),
            LoginPasswordSection(),
            ForgotPwdBtn(),
            RememberMe(),
            SizedBox(height: 15),
            LoginBtn(),
            CheckSignupBtn()
          ],
        ),
      ),
    );
  }
}
