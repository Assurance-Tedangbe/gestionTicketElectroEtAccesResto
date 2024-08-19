import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/activateAccount.dart';
import 'package:mymobileproject/UI/pages/adminInterface.dart';
import 'package:mymobileproject/UI/pages/updateUser.dart';
import 'package:mymobileproject/UI/widgets/admin/createAccountIcon.dart';
import 'package:mymobileproject/UI/widgets/admin/student.mgmt.dart/dataTableStyle.dart';
import 'package:mymobileproject/UI/widgets/admin/student.mgmt.dart/headTableStyle.dart';
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
  Future<void> _showDeletePorterDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Suppression compte Portier'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Etes-vous sûr de vouloir supprimer ce compte'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ANNULER'),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AdminInterface())),
            ),
            TextButton(
              child: const Text('OUI'),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AdminInterface())),
            ),
          ],
        );
      },
    );
  }

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
                  DataColumn(label: HeadTableStyle(data: "Nom d'utilisateur")),
                  DataColumn(label: HeadTableStyle(data: "Email")),
                  DataColumn(label: HeadTableStyle(data: "Actions")),
                ],
                rows: [
                  // this brackets are just for test by not included in dynamic view
                  // listStudents
                  //   .map((data) =>
                  DataRow(cells: [
                    const DataCell(DataTableStyle(datafromBack: 'Tedangbe')),
                    const DataCell(
                        DataTableStyle(datafromBack: 'tedangbek@gmail.com')),
                    DataCell(Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const UpdateUser()));
                            },
                            icon: const Icon(Icons.update, size: 45)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ActivateAccount()));
                            },
                            icon: const Icon(Icons.no_accounts, size: 45)),
                        IconButton(
                            onPressed: _showDeletePorterDialog,
                            icon: const Icon(Icons.delete, size: 45)),
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
