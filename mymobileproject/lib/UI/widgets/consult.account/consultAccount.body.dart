import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/consult.account/consultBtn.dart';
import 'package:mymobileproject/UI/widgets/consult.account/studentAccountNumber.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';

class ConsultBody extends StatelessWidget {
  const ConsultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StudentAccountNumber(),
            SizeboxTemplate(),
            ConsultBtn()
          ],
        ),
      ),
    );
  }
}
