import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class BuyTicketBtn extends StatefulWidget {
  const BuyTicketBtn({super.key});

  @override
  State<BuyTicketBtn> createState() => _BuyTicketBtnState();
}

class _BuyTicketBtnState extends State<BuyTicketBtn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3,
      height: size.height / 14.0,
      child: ElevatedButton(
        onPressed: () => print('buy pressed'),
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          textStyle: const TextStyle(
              color: kSecondColor, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        child: const Text('Acheter'),
      ),
    );
  }
}
