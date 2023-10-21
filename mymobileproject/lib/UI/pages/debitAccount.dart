import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/debitAccount.body.dart';

class DebitAccount extends StatefulWidget {
  const DebitAccount({super.key});

  @override
  State<DebitAccount> createState() => _DebitAccountState();
}

class _DebitAccountState extends State<DebitAccount> {
  static const String _title = 'Débiter un compte';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: DebitBody());
  }
}
