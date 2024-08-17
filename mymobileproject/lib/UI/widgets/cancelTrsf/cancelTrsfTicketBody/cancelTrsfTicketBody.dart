import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/cancelTrsf/cancelTrsfCreditBody/referenceNumber.dart';
import 'package:mymobileproject/UI/widgets/cancelTrsf/cancelTrsfTicketBody/cancelTrsfTicketBtn.dart';
import 'package:mymobileproject/UI/widgets/home/sizeboxHeightSession.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/passwordTrsfSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/recipientNumberSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.ticket/numberTicketsSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.ticket/ticketTypeSection.dart';

class CancelTrsfTicketBody extends StatefulWidget {
  const CancelTrsfTicketBody({super.key});

  @override
  State<CancelTrsfTicketBody> createState() => _CancelTrsfTicketBodyState();
}

class _CancelTrsfTicketBodyState extends State<CancelTrsfTicketBody> {
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ReferenceNumberSection(),
            SizeboxHeightSession(),
            RecipientNumberSection(),
            SizeboxHeightSession(),
            NumberTicketsSection(),
            SizeboxHeightSession(),
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0.0, 8.0, 0.0),
              child: TicketTypeSection(),
            ),
            SizeboxHeightSession(),
            PasswordTrsfSection(),
            SizeboxHeightSession(),
            CancelTrsfTicketBtn()
          ],
        ),
      ),
    );
  }
}
