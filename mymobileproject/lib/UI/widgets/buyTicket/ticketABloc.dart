import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class TicketABloc extends StatefulWidget {
  final String ticketLibelle;
  const TicketABloc({super.key, required this.ticketLibelle});

  @override
  State<TicketABloc> createState() => _TicketABlocState();
}

class _TicketABlocState extends State<TicketABloc> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: size.width * 0.08,
        //  width: 40,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
            ),
            onPressed: () => print('book ticket'),
            child: Text(
              // "${ticket['place']['numero']}"
              widget.ticketLibelle,
              style: const TextStyle(color: kThirdColor, fontSize: 12),
            )),
      ),
    );
  }
}
