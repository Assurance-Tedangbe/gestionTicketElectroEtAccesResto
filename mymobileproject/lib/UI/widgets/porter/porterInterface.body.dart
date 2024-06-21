import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/porter/porter.services.dart';

class PorterBody extends StatefulWidget {
//  const Body({super.key});

  @override
  State<PorterBody> createState() => _PorterBodyState();
}

class _PorterBodyState extends State<PorterBody> {
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
            child: const Column(children: [
              PorterServices(),
            ]),
          ),
        ),
      ),
    );
  }
}
