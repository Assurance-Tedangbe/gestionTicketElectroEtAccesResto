import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/logout.dart';
import 'package:mymobileproject/UI/pages/research.dart';
import 'package:mymobileproject/UI/widgets/admin/admin.drawer.dart';
import 'package:mymobileproject/UI/widgets/admin/adminInterface.body.dart';

class AdminInterface extends StatelessWidget {
  static const String _title = 'Interface Administrateur';
  const AdminInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const AdminDrawer(),
      appBar: AppBar(
        title: const Text(_title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Rechercher des services',
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ServiceResearch())),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Se déconnecter',
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const LogOut())),
          ),
        ],
      ),
      body: const AdminBody(),
    );
  }
}
