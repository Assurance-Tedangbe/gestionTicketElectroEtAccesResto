import 'package:flutter/material.dart';
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
            icon: const Icon(Icons.logout),
            tooltip: 'Se déconnecter',
            onPressed: () {},
          ),
        ],
      ),
      body: Body(),
      bottomNavigationBar: buildMyNavBar(context),
      //backgroundColor: Colors.blueGrey,
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
            onPressed: () {
              setState(() {});
            },
            tooltip: 'Accueil',
            icon: const Icon(
              Icons.home,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {});
            },
            tooltip: 'Achat ticket',
            icon: const Icon(
              Icons.money,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {});
            },
            tooltip: 'Transfert credit',
            icon: const Icon(
              Icons.transfer_within_a_station,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {});
              },
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
