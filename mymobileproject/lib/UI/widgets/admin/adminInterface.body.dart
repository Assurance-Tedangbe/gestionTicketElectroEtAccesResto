import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/admin/admin.services.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class AdminBody extends StatelessWidget {
  const AdminBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: const Column(children: [
              AdminServices(),
            ]),
          ),
        ),
      ),
    );
  }
}
