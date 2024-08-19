import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/cancelTransfertCredit.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/home/sizeboxHeightSession.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/amountSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/passwordTrsfCreditSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/recipientNumberSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/trsfCreditBtn.dart';
import 'package:mymobileproject/constants.dart';

class TransfertBody extends StatelessWidget {
  const TransfertBody({super.key});

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
              Icons.attach_money,
              color: kPrimaryColor,
              size: 70,
            ),
            const SizeboxHeight(),
            RecipientNumberSection(),
            const SizeboxHeightSession(),
            AmountSection(),
            const SizeboxHeightSession(),
            PasswordTrsfCreditSection(),
            const SizeboxHeightSession(),
            TrnasfertCreditBtn(),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              IconButton(
                iconSize: 60,
                icon: const Icon(
                  Icons.cancel,
                  color: kPrimaryColor,
                ),
                tooltip: 'Annuler transfert crédit',
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CancelTrsfCredit())),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
