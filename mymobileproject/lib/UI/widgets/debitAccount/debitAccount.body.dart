import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/scanqr.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/debitAccount/debitStudentAccountNumber.dart';
import 'package:mymobileproject/UI/widgets/debitAccount/debitValidateBtn.dart';
import 'package:mymobileproject/UI/widgets/debitAccount/infoContainer.dart';
import 'package:mymobileproject/UI/widgets/debitAccount/ouContainer.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';
import 'package:mymobileproject/UI/widgets/home/sizeboxHeightSession.dart';
import 'package:mymobileproject/constants.dart';

class DebitBody extends StatelessWidget {
  const DebitBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const InfoContainer(),
              const SizeboxHeightSession(),
              const ScanQR(),
              const SizeboxHeightSession(),
              const OuContainer(),
              const SizeboxHeightSession(),
              Container(
                alignment: Alignment.center,
                height: size.height * 0.4,
                width: size.width * 7,
                decoration: BoxDecoration(
                  color: textContainerColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: boxshadowColor,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ],
                ),
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DebitStdAccNumber(),
                      SizeboxTemplate(),
                      DebitValidateBtn()
                    ]),
              ),
            ]),
      ),
    );
  }
}
