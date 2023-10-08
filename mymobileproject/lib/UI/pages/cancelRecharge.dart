import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/cancelRecharge.body.dart';

class CancelRecharge extends StatefulWidget {
  const CancelRecharge({super.key});

  @override
  State<CancelRecharge> createState() => _CancelRechargeState();
}

class _CancelRechargeState extends State<CancelRecharge> {
  static const String _title = 'Annuler la recharge';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text(_title)),
      body: CancelBody(),
    );
  }
}
