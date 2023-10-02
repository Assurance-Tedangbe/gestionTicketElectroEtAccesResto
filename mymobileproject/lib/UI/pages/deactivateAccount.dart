import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/deactivateAccount.body.dart';

class DeactivateAccount extends StatefulWidget {
  // const DeactivateAccount({super.key});

  @override
  State<DeactivateAccount> createState() => _DeactivateAccountState();
}

class _DeactivateAccountState extends State<DeactivateAccount> {
  static const String _title = 'Désactiver son compte';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: Body());
  }
}
