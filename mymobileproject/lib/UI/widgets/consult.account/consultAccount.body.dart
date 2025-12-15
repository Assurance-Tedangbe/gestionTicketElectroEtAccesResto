import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/consult.account/consult.data.dart';
import 'package:mymobileproject/UI/widgets/consult.account/consultBtn.dart';
import 'package:mymobileproject/UI/widgets/consult.account/usernameConsultSection.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';
import 'package:mymobileproject/UI/widgets/updateUser/pageIconTemplate.dart';
import 'package:mymobileproject/provider/user_provider.dart';
import 'package:provider/provider.dart';

/*
  Widget principal pour la consultation de compte.
  StatefulWidget pour gérer le contrôleur du champ nom d'utilisateur.
*/
class ConsultBody extends StatefulWidget {
  const ConsultBody({super.key});

  @override
  State<ConsultBody> createState() => _ConsultBodyState();
}

class _ConsultBodyState extends State<ConsultBody> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _onConsultSuccess() {
    // Navigation vers la page d'affichage des données
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ConsultData()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icône de la page
            const PageIconTemplate(iconData: Icons.search),
            const SizedBox(height: 20),

            Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                return Column(
                  children: [
                    UsernameConsultSection(
                      controller: _usernameController,
                      onChanged: (value) =>
                          userProvider.setConsultUsername(value),
                    ),
                    //const SizedBox(height: 20),
                    const SizeboxTemplate(),
                    ConsultBtn(
                      onConsultSuccess: _onConsultSuccess,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
