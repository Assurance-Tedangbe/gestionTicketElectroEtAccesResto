import 'package:flutter/material.dart';

class HistoricBody extends StatefulWidget {
  const HistoricBody({super.key});

  @override
  State<HistoricBody> createState() => _HistoricBodyState();
}

class _HistoricBodyState extends State<HistoricBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Row(
            children: [],
          ),
        ),
      ),
    );
  }
}
