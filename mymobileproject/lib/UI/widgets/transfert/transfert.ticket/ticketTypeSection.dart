import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/home/stat.label.dart';
import 'package:mymobileproject/constants.dart';

class TicketTypeSection extends StatefulWidget {
  const TicketTypeSection({super.key});

  @override
  State<TicketTypeSection> createState() => _TicketTypeSectionState();
}

class _TicketTypeSectionState extends State<TicketTypeSection> {
  bool istypeA = false;
  bool istypeB = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Theme(
          data: ThemeData(unselectedWidgetColor: kPrimaryColor),
          child: Checkbox(
              value: istypeA,
              checkColor: kSecondColor,
              activeColor: kPrimaryColor,
              onChanged: (value) {
                setState(() {
                  istypeA = value!;
                });
              }),
        ),
        const Label(label: 'Type A'),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
          child: Checkbox(
              value: istypeA,
              checkColor: kSecondColor,
              activeColor: kPrimaryColor,
              onChanged: (value) {
                setState(() {
                  istypeA = value!;
                });
              }),
        ),
        const Label(label: 'Type B'),
      ]),
    );
  }
}
