import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/cancelTrsf/cancelTrsfCreditBody/cancelTrsfCreditAmount.dart';
import 'package:mymobileproject/UI/widgets/cancelTrsf/cancelTrsfCreditBody/cancelTrsfCreditBtn.dart';
import 'package:mymobileproject/UI/widgets/cancelTrsf/cancelTrsfCreditBody/referenceNumber.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/passwordTrsfSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/recipientNumberSection.dart';

class CancelTrsfCreditBody extends StatefulWidget {
  const CancelTrsfCreditBody({super.key});

  @override
  State<CancelTrsfCreditBody> createState() => _CancelTrsfCreditBodyState();
}

class _CancelTrsfCreditBodyState extends State<CancelTrsfCreditBody> {
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ReferenceNumberSection(),
            SizeboxTemplate(),
            RecipientNumberSection(),
            SizeboxTemplate(),
            AmountCreditToCancel(),
            SizeboxTemplate(),
            PasswordTrsfSection(),
            SizeboxTemplate(),
            CancelTrsfCreditBtn()
          ],
        ),
      ),
    );
  }
}
