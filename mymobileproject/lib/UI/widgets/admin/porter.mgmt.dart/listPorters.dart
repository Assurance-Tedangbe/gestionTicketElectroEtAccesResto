import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/updateUser.dart';
import 'package:mymobileproject/UI/widgets/admin/createAccountIcon.dart';
import 'package:mymobileproject/UI/widgets/admin/student.mgmt.dart/dataTableStyle.dart';
import 'package:mymobileproject/UI/widgets/admin/student.mgmt.dart/headTableStyle.dart';
import 'package:mymobileproject/UI/widgets/consult.account/consult.data.dart';
import 'package:mymobileproject/constants.dart';
import 'package:provider/provider.dart';
import 'package:mymobileproject/provider/user_provider.dart';
import 'package:mymobileproject/model/user_model.dart';

class ListPortiersPage extends StatefulWidget {
  const ListPortiersPage({super.key});

  @override
  State<ListPortiersPage> createState() => _ListPortiersPageState();
}

class _ListPortiersPageState extends State<ListPortiersPage> {
  @override
  void initState() {
    super.initState();
    // Charger les utilisateurs au démarrage
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.loadAllUsers();
    });
  }

  // Filtrer les utilisateurs avec le rôle PORTIER
  List<User> _getPortiers(List<User> allUsers) {
    return allUsers.where((user) {
      return user.role?.roleName?.toUpperCase() == 'PORTIER';
    }).toList();
  }

  Future<void> _showDeletePortierDialog(User portier) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Suppression compte Portier'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Êtes-vous sûr de vouloir supprimer le compte de ${portier.username} ?',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  '⚠️ Cette action est irréversible !',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'ANNULER',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text(
                'SUPPRIMER',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                await _deletePortier(portier);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deletePortier(User portier) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final success = await userProvider.deleteExistingUser(portier.userId!);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Compte ${portier.username} supprimé avec succès'),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors de la suppression: ${userProvider.error}'),
          backgroundColor: errorColor,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _navigateToPortierDetails(BuildContext context, User portier) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.currentUser = portier;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ConsultData(userId: portier.userId!),
      ),
    );
  }

  void _navigateToUpdatePortier(BuildContext context, User portier) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.currentUser = portier;
    userProvider.prefillUpdateForm(portier);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UpdateUser(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final portiers = _getPortiers(userProvider.users);

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // En-tête avec bouton de création et compteur
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        // Bouton de rafraîchissement
                        IconButton(
                          onPressed: () =>
                              userProvider.loadAllUsers(forceRefresh: true),
                          icon: const Icon(Icons.refresh, color: kPrimaryColor),
                          tooltip: 'Rafraîchir la liste',
                        ),
                        // Compteur de portiers
                        Text(
                          '${portiers.length} portier(s)',
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const CreateAccountIcon(),
                  ],
                ),
              ),

              // Indicateur de chargement
              if (userProvider.isLoading && portiers.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: CircularProgressIndicator(color: kPrimaryColor),
                  ),
                )
              else if (portiers.isEmpty)
                // Message si aucun portier
                Container(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.security_outlined,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Aucun portier trouvé',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (userProvider.users.isNotEmpty)
                        const Text(
                          'Créez un nouveau portier ou vérifiez que\nles utilisateurs ont bien le rôle PORTIER',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () =>
                            userProvider.loadAllUsers(forceRefresh: true),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Rafraîchir'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              else
                // Table des portiers
                _buildPortiersTable(portiers),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPortiersTable(List<User> portiers) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: ticketSectionColor, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: DataTable(
          sortColumnIndex: 0,
          sortAscending: true,
          showCheckboxColumn: false,
          headingRowHeight: 50,
          dataRowHeight: 60,
          horizontalMargin: 16,
          columnSpacing: 24,
          columns: const [
            DataColumn(
              label: HeadTableStyle(data: "Nom d'utilisateur"),
              numeric: false,
            ),
            DataColumn(
              label: HeadTableStyle(data: "Nom complet"),
              numeric: false,
            ),
            DataColumn(
              label: HeadTableStyle(data: "Email"),
              numeric: false,
            ),
            DataColumn(
              label: HeadTableStyle(data: "Rôle"),
              numeric: false,
            ),
            DataColumn(
              label: HeadTableStyle(data: "Actions"),
              numeric: false,
            ),
          ],
          rows: portiers.map((portier) {
            return DataRow(
              cells: [
                DataCell(
                  Tooltip(
                    message: 'Cliquer pour voir les détails',
                    child: DataTableStyle(datafromBack: portier.username),
                  ),
                  onTap: () => _navigateToPortierDetails(context, portier),
                ),
                DataCell(
                  DataTableStyle(
                    datafromBack: '${portier.firstName} ${portier.lastName}',
                  ),
                ),
                DataCell(
                  DataTableStyle(datafromBack: portier.email),
                ),
                DataCell(
                  Chip(
                    label: Text(
                      portier.role?.roleName ?? 'PORTIER',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    backgroundColor: Colors.purple,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ),
                DataCell(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Bouton Voir les détails
                      Tooltip(
                        message: 'Voir les détails',
                        child: IconButton(
                          onPressed: () =>
                              _navigateToPortierDetails(context, portier),
                          icon: const Icon(Icons.visibility,
                              size: 24, color: Colors.blue),
                          padding: const EdgeInsets.all(6),
                        ),
                      ),
                      const SizedBox(width: 4),

                      // Bouton Modifier
                      Tooltip(
                        message: 'Modifier',
                        child: IconButton(
                          onPressed: () =>
                              _navigateToUpdatePortier(context, portier),
                          icon: const Icon(Icons.edit,
                              size: 24, color: Colors.orange),
                          padding: const EdgeInsets.all(6),
                        ),
                      ),
                      const SizedBox(width: 4),

                      // Bouton Supprimer
                      Tooltip(
                        message: 'Supprimer',
                        child: IconButton(
                          onPressed: () => _showDeletePortierDialog(portier),
                          icon: const Icon(Icons.delete,
                              size: 24, color: Colors.red),
                          padding: const EdgeInsets.all(6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/adminInterface.dart';
import 'package:mymobileproject/UI/pages/updateUser.dart';
import 'package:mymobileproject/UI/widgets/admin/createAccountIcon.dart';
import 'package:mymobileproject/UI/widgets/admin/student.mgmt.dart/dataTableStyle.dart';
import 'package:mymobileproject/UI/widgets/admin/student.mgmt.dart/headTableStyle.dart';
import 'package:mymobileproject/constants.dart';

class ListPortersPage extends StatefulWidget {
  const ListPortersPage({
    super.key,
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
                            onPressed: _showDeletePorterDialog,
                            icon: const Icon(Icons.delete, size: 45)),
                      ],
                    )),
                  ])
                ]),
          ),
        ],
      ),
    );
  }
}

 */