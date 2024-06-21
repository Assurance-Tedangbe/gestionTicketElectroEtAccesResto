import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/agent/agent.services.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class AgentBody extends StatefulWidget {
  // const Body({super.key});

  @override
  State<AgentBody> createState() => _AgentBodyState();
}

class _AgentBodyState extends State<AgentBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: const Column(children: [
              AgentServices(),
            ]),
          ),
        ),
      ),
    );
  }
}
