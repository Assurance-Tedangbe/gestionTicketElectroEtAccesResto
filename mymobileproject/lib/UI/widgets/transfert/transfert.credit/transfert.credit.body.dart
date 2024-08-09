import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/cancelTransfertCredit.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/home/sizeboxHeightSession.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/amountSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/passwordTrsfSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/recipientNumberSection.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/trsfCreditBtn.dart';
import 'package:mymobileproject/constants.dart';

class TransfertBody extends StatefulWidget {
  const TransfertBody({super.key});

  @override
  State<TransfertBody> createState() => _TransfertBodyState();
}

class _TransfertBodyState extends State<TransfertBody> {
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
            PasswordTrsfSection(),
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
