import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/signup/signup.body.dart';

class SignUpPage extends StatelessWidget {
  static const String _title = 'Créer un compte';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: const SignupBody());
  }
}
