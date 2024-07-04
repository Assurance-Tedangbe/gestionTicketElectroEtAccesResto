import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/cancelTrsf/cancelTrsfCreditBody/referenceNumber.dart';
import 'package:mymobileproject/UI/widgets/cancelTrsf/cancelTrsfTicketBody/cancelTrsfTicketBtn.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*  Icon(
              Icons.cancel,
              color: kPrimaryColor,
              size: 70,
            ), */
            //  SizeboxHeight(),
            ReferenceNumberSection(),
            SizeboxTemplate(),
            RecipientNumberSection(),
            SizeboxTemplate(),
            NumberTicketsSection(),
            SizeboxTemplate(),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 8.0, 0.0),
              child: TicketTypeSection(),
            ),
            SizeboxTemplate(),
            PasswordTrsfSection(),
            SizeboxTemplate(),
            CancelTrsfTicketBtn()
          ],
        ),
      ),
    );
  }
}
