import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/buyTicket/buyTicketBtn.dart';
import 'package:mymobileproject/UI/widgets/buyTicket/clientNameSection.dart';
import 'package:mymobileproject/constants.dart';

class RequestSection extends StatefulWidget {
  const RequestSection({super.key});

  @override
  State<RequestSection> createState() => _RequestSectionState();
}

class _RequestSectionState extends State<RequestSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity,
        height: size.height / 4,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(234, 234, 244, 1),
            borderRadius: const BorderRadius.all(Radius.circular(17.0)),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
            border: Border.all(color: kPrimaryColor, width: 1)),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClientNameSection(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BuyTicketBtn(),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
