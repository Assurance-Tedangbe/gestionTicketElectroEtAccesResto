import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/activateAccount.dart';
import 'package:mymobileproject/UI/pages/consultAccount.dart';
import 'package:mymobileproject/UI/pages/coverPage.dart';
import 'package:mymobileproject/UI/pages/creditAccount.dart';

class NavigationBarAgent extends StatelessWidget {
  const NavigationBarAgent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CoverPage())),
            tooltip: 'Accueil',
            icon: const Icon(
              Icons.home,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ActivateAccount())),
            tooltip: 'Activer compte',
            icon: const Icon(
              Icons.accessible,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CreditAccount())),
            tooltip: 'Crediter un compte',
            icon: const Icon(
              Icons.attach_money,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
              enableFeedback: false,
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ConsultAccount())),
              tooltip: 'Consulter un compte',
              icon: const Icon(
                Icons.account_balance,
                color: Colors.white,
                size: 35,
              )),
        ],
      ),
    );
  }
}
