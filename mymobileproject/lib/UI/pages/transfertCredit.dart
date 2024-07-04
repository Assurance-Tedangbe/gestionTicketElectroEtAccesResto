import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/studentInterface.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/transfert.credit.body.dart';

class TransfertCredit extends StatefulWidget {
  const TransfertCredit({super.key});

  @override
  State<TransfertCredit> createState() => _TransfertCreditState();
}

class _TransfertCreditState extends State<TransfertCredit> {
  static const String _title = 'Transfert crédit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: TransfertBody());
  }
}
