import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/consult.account/consult.data.dart';
import 'package:mymobileproject/constants.dart';

class GoToConsultPage extends StatefulWidget {
  const GoToConsultPage({super.key});

  @override
  State<GoToConsultPage> createState() => _GoToConsultPageState();
}

class _GoToConsultPageState extends State<GoToConsultPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      //  width: double.infinity,
      width: 320,
      height: 95,
      child: ElevatedButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ConsultData())),
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          textStyle: const TextStyle(
              color: kSecondColor, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        child: const Text('Consulter'),
      ),
    );
  }
}
