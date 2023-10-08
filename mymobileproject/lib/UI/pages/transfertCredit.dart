import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/transfert.body.dart';

class Transfert extends StatefulWidget {
  const Transfert({super.key});

  @override
  State<Transfert> createState() => _TransfertState();
}

class _TransfertState extends State<Transfert> {
  static const String _title = 'Transfert crédit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: TransfertBody());
  }
}
