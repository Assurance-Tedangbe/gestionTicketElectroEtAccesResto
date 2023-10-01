import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/signup.body.dart';

class SignUpPage extends StatefulWidget {
//  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text('Créer un compte')),
        body: Body());
  }
}
