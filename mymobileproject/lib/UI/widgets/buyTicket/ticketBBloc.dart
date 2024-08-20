import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class TicketBBloc extends StatefulWidget {
  final String ticketBLibelle;
  const TicketBBloc({super.key, required this.ticketBLibelle});

  @override
  State<TicketBBloc> createState() => _TicketBBlocState();
}

class _TicketBBlocState extends State<TicketBBloc> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: size.width * 0.12,
        height: size.height * 0.03,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
            ),
            onPressed: () => print('book ticket'),
            child: Text(
              // "${ticket['place']['numero']}"
              widget.ticketBLibelle,
              style: const TextStyle(color: kThirdColor, fontSize: 12),
            )),
      ),
    );
  }
}
