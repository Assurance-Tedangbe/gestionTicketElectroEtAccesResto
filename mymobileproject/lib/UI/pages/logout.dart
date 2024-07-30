import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/logout.body.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  static const String _title = 'Se Déconnecter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: LogOutBody());
  }
}
