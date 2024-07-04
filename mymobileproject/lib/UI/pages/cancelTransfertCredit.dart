import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/cancelTrsf/cancelTrsfCreditBody/cancelTrsfCredit.body.dart';

class CancelTrsfCredit extends StatefulWidget {
  const CancelTrsfCredit({super.key});

  @override
  State<CancelTrsfCredit> createState() => _CancelTrsfCreditState();
}

class _CancelTrsfCreditState extends State<CancelTrsfCredit> {
  static const String _title = 'Annuler transfert crédit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text(_title)),
      body: CancelTrsfCreditBody(),
    );
  }
}
