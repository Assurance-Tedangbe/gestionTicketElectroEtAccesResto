import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/buyTicket/requestSection.dart';
import 'package:mymobileproject/UI/widgets/buyTicket/ticketASection.dart';
import 'package:mymobileproject/UI/widgets/buyTicket/ticketBSection.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';

class BuyTicketBody extends StatefulWidget {
  const BuyTicketBody({super.key});

  @override
  State<BuyTicketBody> createState() => _BuyTicketBodyState();
}

class _BuyTicketBodyState extends State<BuyTicketBody> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Column(children: [
              TicketASection(),
              SizeboxTemplate(),
              TicketBSection(),
              SizeboxHeight(),
              RequestSection()
            ]),
          ),
        ),
      ),
    );
  }
}
