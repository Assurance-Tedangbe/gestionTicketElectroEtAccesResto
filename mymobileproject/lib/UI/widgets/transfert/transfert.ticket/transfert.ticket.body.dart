import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/cancelTransfertTicket.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/passwordTrsfSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/recipientNumberSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.ticket/numberTicketsSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.ticket/ticketTypeSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.ticket/trsfTicketBtn.dart';
import 'package:mymobileproject/constants.dart';

class TrsfTicketBody extends StatefulWidget {
  const TrsfTicketBody({super.key});

  @override
  State<TrsfTicketBody> createState() => _TrsfTicketBodyState();
}

class _TrsfTicketBodyState extends State<TrsfTicketBody> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.send_rounded,
              color: kPrimaryColor,
              size: 70,
            ),
            const SizeboxHeight(),
            RecipientNumberSection(),
            const SizeboxTemplate(),
            NumberTicketsSection(),
            const SizeboxTemplate(),
            Padding(
              padding: const EdgeInsets.fromLTRB(70.0, 0.0, 8.0, 0.0),
              child: TicketTypeSection(),
            ),
            const SizeboxTemplate(),
            PasswordTrsfSection(),
            const SizeboxTemplate(),
            TransfertTicketBtn(),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              IconButton(
                iconSize: 60,
                icon: const Icon(
                  Icons.cancel,
                  color: kPrimaryColor,
                ),
                tooltip: 'Annuler transfert ticket',
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CancelTrsfTicket())),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
