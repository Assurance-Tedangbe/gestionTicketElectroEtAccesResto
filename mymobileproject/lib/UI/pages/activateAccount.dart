import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/activateAccount.body.dart';

class ActivateAccount extends StatefulWidget {
  @override
  State<ActivateAccount> createState() => _ActivateAccountState();
}

class _ActivateAccountState extends State<ActivateAccount> {
  static const String _title = 'Activer son compte';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: const Body());
  }
}
