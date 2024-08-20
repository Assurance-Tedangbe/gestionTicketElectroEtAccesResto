import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/buyTicket/ticketBBloc.dart';
import 'package:mymobileproject/UI/widgets/home/bloctitle.dart';
import 'package:mymobileproject/constants.dart';

class TicketBSection extends StatefulWidget {
  const TicketBSection({super.key});

  @override
  State<TicketBSection> createState() => _TicketBSectionState();
}

class _TicketBSectionState extends State<TicketBSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [BlocTitle(text: "Tickets B")],
      ),
      Container(
        width: double.infinity,
        height: size.height / 6.0,
        decoration: BoxDecoration(
            color: ticketSectionColor,
            borderRadius: const BorderRadius.all(Radius.circular(17.0)),
            boxShadow: const [
              BoxShadow(
                  color: boxshadowColor, blurRadius: 6, offset: Offset(0, 2))
            ],
            border: Border.all(color: kPrimaryColor, width: 1)),
        child: const Padding(
          padding: EdgeInsets.all(2.0),
          child: Wrap(children: [
            //   ...this.listSallles[index]['currentProjection']['listTickets'].map((ticket){
            //    return
            /*  Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                 width: size.width * 0.12,
                 height: size.height * 0.03,
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
            TicketBBloc(ticketBLibelle: "1"),
            TicketBBloc(ticketBLibelle: "2"),
            TicketBBloc(ticketBLibelle: "3"),
            TicketBBloc(ticketBLibelle: "4"),
            TicketBBloc(ticketBLibelle: "5"),
            TicketBBloc(ticketBLibelle: "6"),
            TicketBBloc(ticketBLibelle: "7"),
            TicketBBloc(ticketBLibelle: "8"),
            TicketBBloc(ticketBLibelle: "9"),
            TicketBBloc(ticketBLibelle: "10"),
            TicketBBloc(ticketBLibelle: "11"),
            TicketBBloc(ticketBLibelle: "12"),
            TicketBBloc(ticketBLibelle: "13"),
            TicketBBloc(ticketBLibelle: "14"),
            TicketBBloc(ticketBLibelle: "15"),
            TicketBBloc(ticketBLibelle: "16"),
            TicketBBloc(ticketBLibelle: "17"),
            TicketBBloc(ticketBLibelle: "18"),
            TicketBBloc(ticketBLibelle: "19"),
            TicketBBloc(ticketBLibelle: "20"),
            TicketBBloc(ticketBLibelle: "21"),
            TicketBBloc(ticketBLibelle: "22"),
            TicketBBloc(ticketBLibelle: "23"),
            TicketBBloc(ticketBLibelle: "24"),
            // })
          ]),
        ),
      ),
    ]);
  }
}
