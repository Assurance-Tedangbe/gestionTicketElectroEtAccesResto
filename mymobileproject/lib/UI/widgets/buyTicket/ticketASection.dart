import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/buyTicket/ticketABloc.dart';
import 'package:mymobileproject/UI/widgets/home/bloctitle.dart';
import 'package:mymobileproject/constants.dart';

class TicketASection extends StatefulWidget {
  const TicketASection({super.key});

  @override
  State<TicketASection> createState() => _TicketASectionState();
}

class _TicketASectionState extends State<TicketASection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [BlocTitle(text: "Tickets A")],
      ),
      Container(
        width: double.infinity,
        height: size.height / 5.0,
        decoration: BoxDecoration(
            color: ticketSectionColor,
            borderRadius: const BorderRadius.all(Radius.circular(17.0)),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
            border: Border.all(color: kPrimaryColor, width: 1)),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Wrap(children: [
            //   ...this.listSallles[index]['currentProjection']['listTickets'].map((ticket){
            //    return
            /*  Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: size.width * 0.08,
                //  width: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () => print('book ticket'),
                    child: const Text(
                      // "${ticket['place']['numero']}"
                      "1",
                      style: TextStyle(color: kThirdColor, fontSize: 12),
                    )),
              ),
            ), */
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),
            TicketABloc(ticketLibelle: "1"),

            // })
          ]),
        ),
      ),
    ]);
  }
}
