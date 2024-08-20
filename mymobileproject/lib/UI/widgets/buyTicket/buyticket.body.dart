import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/buyTicket/requestSection.dart';
import 'package:mymobileproject/UI/widgets/buyTicket/ticketASection.dart';
import 'package:mymobileproject/UI/widgets/buyTicket/ticketBSection.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';

class BuyTicketBody extends StatelessWidget {
  const BuyTicketBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
          child: SizedBox(
            height: size.height,
            width: size.width,
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
