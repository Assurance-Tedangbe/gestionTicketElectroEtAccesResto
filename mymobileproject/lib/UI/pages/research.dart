import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/research.dart/research.body.dart';

class ServiceResearch extends StatelessWidget {
  static const String _title = 'Rechercher';
  const ServiceResearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: const ServiceResearchBody());
  }
}
