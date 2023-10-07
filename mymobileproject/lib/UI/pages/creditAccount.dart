import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/creditAccount.body.dart';

class CreditAccount extends StatefulWidget {
  const CreditAccount({super.key});

  @override
  State<CreditAccount> createState() => _CreditAccountState();
}

class _CreditAccountState extends State<CreditAccount> {
  static const String _title = 'Créditer(Recharger) un compte';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text(_title)),
      body: const CreditBody(),
    );
  }
}
