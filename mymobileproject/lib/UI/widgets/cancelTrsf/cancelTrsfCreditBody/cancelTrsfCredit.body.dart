import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/cancelTrsf/cancelTrsfCreditBody/cancelTrsfCreditAmount.dart';
import 'package:mymobileproject/UI/widgets/cancelTrsf/cancelTrsfCreditBody/cancelTrsfCreditBtn.dart';
import 'package:mymobileproject/UI/widgets/cancelTrsf/cancelTrsfCreditBody/referenceNumber.dart';
import 'package:mymobileproject/UI/widgets/home/sizeboxHeightSession.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/passwordTrsfCreditSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/recipientNumberSection.dart';

class CancelTrsfCreditBody extends StatelessWidget {
  const CancelTrsfCreditBody({super.key});

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
            AmountCreditToCancel(),
            SizeboxHeightSession(),
            PasswordTrsfCreditSection(),
            SizeboxHeightSession(),
            CancelTrsfCreditBtn()
          ],
        ),
      ),
    );
  }
}
