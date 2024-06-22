import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/forgot.pwd/forgot.pwd.body.dart';

class ForgotPwd extends StatelessWidget {
  static const String _title = 'Mot de passe oublié';
  const ForgotPwd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: const ForgotPwdBody());
  }
}
