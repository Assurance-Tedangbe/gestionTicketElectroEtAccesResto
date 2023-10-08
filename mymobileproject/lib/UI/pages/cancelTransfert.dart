import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/cancelTrsf.body.dart';

class CancelTrsf extends StatefulWidget {
  const CancelTrsf({super.key});

  @override
  State<CancelTrsf> createState() => _CancelTrsfState();
}

class _CancelTrsfState extends State<CancelTrsf> {
  static const String _title = 'Annuler transfert';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text(_title)),
      body: CancelTrsfBody(),
    );
  }
}
