import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/debitAccount.dart';
import 'package:mymobileproject/UI/pages/coverPage.dart';
import 'package:mymobileproject/UI/pages/logout.dart';
import 'package:mymobileproject/UI/pages/rootView.dart';
import 'package:mymobileproject/UI/widgets/porter/navigationbar.porter.dart';
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
            icon: const Icon(Icons.search),
            tooltip: 'Rechercher des services',
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => RootV())),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Se déconnecter',
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LogOut())),
          ),
        ],
      ),
      body: PorterBody(),
      //   bottomNavigationBar: NavigationBarPorter(),
    );
  }
}
