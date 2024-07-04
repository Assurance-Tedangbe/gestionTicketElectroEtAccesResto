import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/cancelTransfertCredit.dart';

class CancelTrsfTicket extends StatelessWidget {
  static const String _title = 'Annuler transfert ticket';
  const CancelTrsfTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text(_title)),
      body: CancelTrsfCredit(),
    );
  }
}
