import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.ticket/transfert.ticket.body.dart';

class TransfertTicket extends StatelessWidget {
  static const String _title = 'Transfert ticket';
  const TransfertTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: TrsfTicketBody());
  }
}
