import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/debitAccount.dart';
import 'package:mymobileproject/UI/pages/coverPage.dart';
import 'package:mymobileproject/UI/pages/logout.dart';
import 'package:mymobileproject/UI/widgets/porter/porterInterface.body.dart';
import 'package:mymobileproject/UI/widgets/porter/porter.drawer.dart';

class PorterInterface extends StatefulWidget {
  const PorterInterface({super.key});

  @override
  State<PorterInterface> createState() => _PorterInterfaceState();
}

class _PorterInterfaceState extends State<PorterInterface> {
  static const String _title = 'Interface portier';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const PortierDrawer(),
      appBar: AppBar(
        title: const Text(_title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Se déconnecter',
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LogOut())),
          ),
        ],
      ),
      body: Body(),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
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
                .push(MaterialPageRoute(builder: (context) => DebitAccount())),
            tooltip: 'Débiter un compte',
            icon: const Icon(
              Icons.money_off,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {});
            },
            tooltip: 'Scanner code QR',
            icon: const Icon(
              Icons.scanner,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
