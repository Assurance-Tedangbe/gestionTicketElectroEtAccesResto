import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/logout.dart';
import 'package:mymobileproject/UI/pages/rootView.dart';
import 'package:mymobileproject/UI/widgets/home/home.drawer.dart';
import 'package:mymobileproject/UI/widgets/home/myhome.body.dart';

class Home extends StatelessWidget {
  static const String _title = 'Bienvenue';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const HomeDrawer(),
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
      body: const HomeBody(),
      // bottomNavigationBar: buildMyNavBar(context),
      //backgroundColor: Colors.blueGrey,
    );
  }
}
