import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/transfert.credit.body.dart';

class TransfertCredit extends StatelessWidget {
  static const String _title = 'Transfert crédit';
  const TransfertCredit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: const TransfertBody());
  }
}
