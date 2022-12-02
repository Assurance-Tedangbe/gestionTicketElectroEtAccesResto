import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/login.body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String _title = 'Se connecter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(_title)), body: const Body());
  }
}
