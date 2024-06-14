import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/header.dart';
import 'package:mymobileproject/UI/widgets/home/operations.dart';
import 'package:mymobileproject/UI/widgets/home/soldeSection.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        // physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 25.0,
              ),
              const Header(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 24.0,
              ),
              const SoldeSection(),
              const SizedBox(
                height: 20.0,
              ),
              const Operations(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40.0,
              ),
              //    const Evolution(),
            ]),
          ),
        ),
      ),
    );
  }
}
