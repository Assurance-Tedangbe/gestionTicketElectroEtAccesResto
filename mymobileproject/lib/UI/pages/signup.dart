import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/signup/signup.body.dart';

class SignUpPage extends StatefulWidget {
//  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  static const String _title = 'Créer un compte';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: Body());
  }
}
