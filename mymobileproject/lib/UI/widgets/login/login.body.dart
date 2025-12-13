import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/home.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/login/checksignup.btn.dart';
import 'package:mymobileproject/UI/widgets/login/forgotPwdBtn.dart';
import 'package:mymobileproject/UI/widgets/login/login.btn.dart';
import 'package:mymobileproject/UI/widgets/login/login.username.dart';
import 'package:mymobileproject/UI/widgets/login/login.passwordsection.dart';
import 'package:mymobileproject/UI/widgets/login/rememberme.dart';
import 'package:mymobileproject/UI/widgets/updateUser/pageIconTemplate.dart';
import 'package:mymobileproject/constants.dart';
import 'package:mymobileproject/provider/user_provider.dart';
import 'package:provider/provider.dart';

/*
  Widget principal qui organise tous les champs du formulaire de connexion.
  StatefulWidget pour gérer les TextEditingController.
*/
class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isRememberMe = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginSuccess() {
    // Navigation vers la page d'accueil
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  void _toggleRememberMe(bool? value) {
    if (value != null) {
      setState(() {
        _isRememberMe = value;
      });
      // Vous pouvez sauvegarder ce choix dans les préférences
      print('Remember me: $_isRememberMe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const PageIconTemplate(iconData: Icons.lock_open),
            Icon(
              Icons.lock_open,
              color: kPrimaryColor,
              size: 70,
            ),
            const SizedBox(height: 15),
            Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                return Column(
                  children: [
                    LoginUsernameSection(
                      controller: _usernameController,
                      onChanged: (value) =>
                          userProvider.setLoginUsername(value),
                    ),
                    const SizedBox(height: 15),
                    LoginPasswordSection(
                      controller: _passwordController,
                      onChanged: (value) =>
                          userProvider.setLoginPassword(value),
                    ),
                    ForgotPwdBtn(),
                    RememberMe(
                      value: _isRememberMe,
                      onChanged: _toggleRememberMe,
                    ),
                    const SizedBox(height: 15),
                    LoginBtn(onLoginSuccess: _onLoginSuccess),
                    const CheckSignupBtn(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/* class LoginBody extends StatefulWidget {
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
            LoginUsernameSection(),
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
} */
