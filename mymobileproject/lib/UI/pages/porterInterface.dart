import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/porterInterface.body.dart';

class PorterInterface extends StatefulWidget {
  // const PorterInterface({super.key});

  @override
  State<PorterInterface> createState() => _PorterInterfaceState();
}

class _PorterInterfaceState extends State<PorterInterface> {
  static const String _title = 'Interface portier';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: Body());
  }
}
