import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/cancelTransfertTicket.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/home/sizeboxHeightSession.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.ticket/numberTicketsSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.ticket/passwordTrsfTicketSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.ticket/recipientNumberTrsfTicketSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.ticket/ticketTypeSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.ticket/trsfTicketBtn.dart';
import 'package:mymobileproject/constants.dart';

class TrsfTicketBody extends StatelessWidget {
  const TrsfTicketBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.send_rounded,
              color: kPrimaryColor,
              size: 70,
            ),
            const SizeboxHeight(),
            RecipientNumberTrsfTicketSection(),
            const SizeboxHeightSession(),
            NumberTicketsSection(),
            const SizeboxHeightSession(),
            const Padding(
              // padding: EdgeInsets.fromLTRB(70.0, 0.0, 8.0, 0.0),
              padding: EdgeInsets.fromLTRB(25.0, 0.0, 8.0, 0.0),
              child: TicketTypeSection(),
            ),
            const SizeboxHeightSession(),
            PasswordTrsfTicketSection(),
            const SizeboxHeightSession(),
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
