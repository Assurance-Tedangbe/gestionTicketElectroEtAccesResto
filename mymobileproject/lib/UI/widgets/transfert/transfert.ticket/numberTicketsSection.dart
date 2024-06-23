import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/home/stat.label.dart';
import 'package:mymobileproject/constants.dart';

class NumberTicketsSection extends StatefulWidget {
  const NumberTicketsSection({super.key});

  @override
  State<NumberTicketsSection> createState() => _NumberTicketsSectionState();
}

class _NumberTicketsSectionState extends State<NumberTicketsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Label(label: 'Nombre de ticket(s)'),
        const SizedBox(height: 10),
        Container(
          width: 300,
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ],
              border: Border.all(color: kPrimaryColor, width: 3)),
          child: const TextField(
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.attach_money, color: kPrimaryColor),
                hintText: 'Nombre de ticket',
                hintStyle: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 12,
                )),
          ),
        )
      ],
    );
  }
}
