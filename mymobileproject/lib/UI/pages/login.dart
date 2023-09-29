import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymobileproject/UI/widgets/login.body.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Se connecter')), body: Body());
  }
}
