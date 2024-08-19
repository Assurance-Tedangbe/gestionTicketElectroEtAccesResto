import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/creditAccount.body.dart';

class CreditAccount extends StatelessWidget {
  static const String _title = 'Créditer un compte';
  const CreditAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text(_title)),
      body: const CreditBody(),
    );
  }
}
