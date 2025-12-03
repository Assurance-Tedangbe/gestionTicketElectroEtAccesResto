import 'package:flutter/material.dart';
import 'package:mymobileproject/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/label.dart';
import 'package:mymobileproject/UI/widgets/updateUser/SizeboxBtwLabelField.dart';
import 'package:mymobileproject/constants.dart';

/*
  Widget pour le champ "Mot de passe" avec fonctionnalité de visibilité.
  Gère dynamiquement l'affichage/masquage du mot de passe.
*/
class PasswordSection extends StatelessWidget {
  final TextEditingController controller; // ← ICI

  const PasswordSection({
    super.key,
    required this.controller, // ← ICI
  });

  /* Consumer est utilisé QUAND ON A BESOIN DE "LIRE" DES DONNÉES DYNAMIQUES
     ce widgets a besoin d'accéder à des données dynamiques du Provider :
     userProvider.isPasswordVisible → Changement d'état booléen
     userProvider.passwordError → Messages d'erreur dynamiques */

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      // Consumer permet de réagir aux changements du Provider // ← ICI
      builder: (context, userProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Label(text: 'Mot de passe'),
            const SizeBoxBtwLabelField(),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: kSecondColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: boxshadowColor,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
                border: Border.all(color: kPrimaryColor, width: 3),
              ),
              height: 50,
              child: TextField(
                controller: controller, // ← ICI
                keyboardType:
                    TextInputType.visiblePassword, // Clavier pour mot de passe
                obscureText: !userProvider
                    .isPasswordVisible, // Masque le texte si false  ← ICI
                style: const TextStyle(color: enterTextFieldColor),
                onChanged: (value) {
                  // Met à jour le mot de passe dans le Provider
                  userProvider.motdepasse(value); // ← ICI
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 11),
                  prefixIcon: const Icon(Icons.password, color: kPrimaryColor),
                  hintText: 'Mot de passe',
                  hintStyle: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 12,
                  ),

                  // Bouton pour afficher/masquer le mot de passe
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Change l'icône selon l'état de visibilité
                      userProvider.isPasswordVisible // ← ICI
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      // Bascule l'état de visibilité via le Provider
                      userProvider.togglePasswordVisibility(); // ← ICI
                    },
                  ),
                  border: InputBorder.none,
                  // Affichage des erreurs de validation
                  errorText: userProvider.passwordError, // ← ICI
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/* 
class PasswordSection extends StatefulWidget {
  const PasswordSection({super.key});

  @override
  State<PasswordSection> createState() => _PasswordSectionState();
}

class _PasswordSectionState extends State<PasswordSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Label(text: 'Mot de passe'),
        const SizeBoxBtwLabelField(),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: boxshadowColor, blurRadius: 6, offset: Offset(0, 2))
              ],
              border: Border.all(color: kPrimaryColor, width: 3)),
          height: 50,
          child: const TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: TextStyle(
              color: enterTextFieldColor,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 11),
              prefixIcon: Icon(Icons.password, color: kPrimaryColor),
              hintText: 'Mot de passe',
              hintStyle: TextStyle(
                color: kPrimaryColor,
                fontSize: 12,
              ),
              suffixIcon: Icon(
                Icons.visibility_off,
                color: kPrimaryColor,
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
 */