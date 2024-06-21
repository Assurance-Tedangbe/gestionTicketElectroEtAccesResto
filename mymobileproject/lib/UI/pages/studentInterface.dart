import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/logout.dart';
import 'package:mymobileproject/UI/pages/rootView.dart';
import 'package:mymobileproject/UI/widgets/student/student.drawer.dart';
import 'package:mymobileproject/UI/widgets/student/studentInterface.body.dart';

class StudentInterface extends StatefulWidget {
  const StudentInterface({super.key});

  @override
  State<StudentInterface> createState() => _StudentInterfaceState();
}

class _StudentInterfaceState extends State<StudentInterface> {
  static const String _title = 'Interface Etudiant';

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const StudentDrawer(),
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
      body: StudentBody(),
      // bottomNavigationBar: NavigationBarStudent(),
      //backgroundColor: Colors.blueGrey,
    );
  }
}
