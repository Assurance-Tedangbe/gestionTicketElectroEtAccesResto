import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/activateAccount.dart';
import 'package:mymobileproject/UI/pages/consultAccount.dart';
import 'package:mymobileproject/UI/widgets/admin/createAccountIcon.dart';
import 'package:mymobileproject/UI/widgets/alertdialog/deleteStudent.dart';
import 'package:mymobileproject/UI/pages/updateUser.dart';
import 'package:mymobileproject/constants.dart';

class ListStudentsPage extends StatefulWidget {
  // final List<Student> listStudents;
  const ListStudentsPage({
    super.key,
//   required this.listStudents
  });

  @override
  State<ListStudentsPage> createState() => _ListStudentsPageState();
}

class _ListStudentsPageState extends State<ListStudentsPage> {
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
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ConsultAccount()));
                            },
                            icon: const Icon(Icons.visibility)),
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
                                  builder: (context) => const DeleteStudent()));
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
