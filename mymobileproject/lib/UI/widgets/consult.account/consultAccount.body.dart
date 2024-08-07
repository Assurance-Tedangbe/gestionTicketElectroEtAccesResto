import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/consult.account/gotoConsultPageBtn.dart';
import 'package:mymobileproject/UI/widgets/consult.account/userAccountNumberSection.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';

class ConsultBody extends StatefulWidget {
  const ConsultBody({super.key});

  @override
  State<ConsultBody> createState() => _ConsultBodyState();
}

class _ConsultBodyState extends State<ConsultBody> {
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*  Container(
              alignment: Alignment.center,
              height: size.height * 0.1,
              width: size.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
                //border: Border.all(color: Colors.blue, width: 3)
              ),
              child: const Text(
                "Pour voir l'état du compte, veuillez renseigner son n° et cliquez sur le bouton pour afficher les informations",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),*/
            UserAccountNumberSection(),
            SizeboxTemplate(),
            GoToConsultPage()
          ],
        ),
      ),
    );
  }
}
