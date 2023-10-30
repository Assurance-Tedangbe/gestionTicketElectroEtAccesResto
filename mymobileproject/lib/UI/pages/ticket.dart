import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/ticket.body.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  static const String _title = 'Acheter ticket';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: TicketBody());
  }
}
