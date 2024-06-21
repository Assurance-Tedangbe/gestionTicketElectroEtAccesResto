import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/logout.dart';
import 'package:mymobileproject/UI/pages/rootView.dart';

class AppBarTemplate extends StatefulWidget {
  const AppBarTemplate({super.key});

  @override
  State<AppBarTemplate> createState() => _AppBarTemplateState();
}

class _AppBarTemplateState extends State<AppBarTemplate> {
  static const String _title = 'Bienvenue';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(_title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
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
    );
  }
}
