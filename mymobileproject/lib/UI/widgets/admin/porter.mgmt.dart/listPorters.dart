import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/activateAccount.dart';
import 'package:mymobileproject/UI/pages/updateUser.dart';
import 'package:mymobileproject/UI/widgets/admin/createAccountIcon.dart';
import 'package:mymobileproject/UI/widgets/alertdialog/deletePorter.dart';
import 'package:mymobileproject/constants.dart';

class ListPortersPage extends StatefulWidget {
  //final List<Porter> listPorters;
  const ListPortersPage({
    super.key,
    //  required this.listPorters,
  });

  @override
  State<ListPortersPage> createState() => _ListPortersPageState();
}

class _ListPortersPageState extends State<ListPortersPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CreateAccountIcon(),
                ]),
          ),
          FittedBox(
            child: DataTable(
                sortColumnIndex: 1,
                showCheckboxColumn: false,
                border: TableBorder.all(width: 1.0, color: ticketSectionColor),
                columns: const [
                  DataColumn(
                      label: Text(
                    "Nom d'utilisateur",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "Email",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "Actions",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
                ],
                rows: [
                  // this brackets are just for test by not included in dynamic view
                  // listStudents
                  //   .map((data) =>
                  DataRow(cells: [
                    const DataCell(
                      Text('Tedangbe',
                          //data.username,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                    ),
                    const DataCell(
                      Text('tedangbek@gmail.com',
                          //data.email,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                    ),
                    DataCell(Row(
                      children: [
                        /*  IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ConsultAccount()));
                            },
                            icon: const Icon(Icons.visibility)),*/
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const UpdateUser()));
                            },
                            icon: const Icon(Icons.update)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ActivateAccount()));
                            },
                            icon: const Icon(Icons.no_accounts)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const DeletePorter()));
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    )),
                  ])
                  //   )
                  //   .toList(),
                ]),
          ),
        ],
      ),
    );
  }
}
