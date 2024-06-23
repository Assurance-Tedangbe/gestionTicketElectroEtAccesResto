import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class TransfertTicketBtn extends StatefulWidget {
  const TransfertTicketBtn({super.key});

  @override
  State<TransfertTicketBtn> createState() => _TransfertTicketBtnState();
}

class _TransfertTicketBtnState extends State<TransfertTicketBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      width: 320,
      height: 95,
      child: ElevatedButton(
        onPressed: () => print('validate pressed'),
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          textStyle: const TextStyle(
              color: kSecondColor, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        child: const Text('Valider'),
      ),
    );
  }
}
