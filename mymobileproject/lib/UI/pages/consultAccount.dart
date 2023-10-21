import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/consultAccount.body.dart';

class ConsultAccount extends StatefulWidget {
  const ConsultAccount({super.key});

  @override
  State<ConsultAccount> createState() => _ConsultAccountState();
}

class _ConsultAccountState extends State<ConsultAccount> {
  static const String _title = 'Consulter son compte';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: ConsultBody());
  }
}
