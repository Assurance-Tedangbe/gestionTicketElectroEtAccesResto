import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/consultAccount.dart';
import 'package:mymobileproject/UI/pages/coverPage.dart';
import 'package:mymobileproject/UI/pages/ticket.dart';
import 'package:mymobileproject/UI/pages/transfertCredit.dart';

class NavigationBarStudent extends StatelessWidget {
  const NavigationBarStudent({super.key});

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
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Ticket())),
            tooltip: 'Achat ticket',
            icon: const Icon(
              Icons.money,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TransfertCredit())),
            tooltip: 'Transfert credit',
            icon: const Icon(
              Icons.transfer_within_a_station,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
              enableFeedback: false,
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ConsultAccount())),
              tooltip: 'Solde',
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
