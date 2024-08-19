import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/debitAccount/debitAccount.body.dart';

class DebitAccount extends StatelessWidget {
  static const String _title = 'Débiter un compte';
  const DebitAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: const DebitBody());
  }
}
