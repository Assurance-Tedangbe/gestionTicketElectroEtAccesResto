import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class TicketBody extends StatefulWidget {
  const TicketBody({super.key});

  @override
  State<TicketBody> createState() => _TicketBodyState();
}

class _TicketBodyState extends State<TicketBody> {
  @override
  Widget build(BuildContext context) {
    return const Background(
        child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.money,
                    color: Colors.blue,
                    size: 70,
                  ),
                  SizedBox(height: 20),
                ])));
  }
}
