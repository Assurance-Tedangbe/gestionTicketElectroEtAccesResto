import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class ServiceResearchBody extends StatelessWidget {
  const ServiceResearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
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
      ),
    );
  }
}
