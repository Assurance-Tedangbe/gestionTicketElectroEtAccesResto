import 'package:flutter/material.dart';

class CancelTrsfCreditBody extends StatefulWidget {
  const CancelTrsfCreditBody({super.key});

  @override
  State<CancelTrsfCreditBody> createState() => _CancelTrsfCreditBodyState();
}

class _CancelTrsfCreditBodyState extends State<CancelTrsfCreditBody> {
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
