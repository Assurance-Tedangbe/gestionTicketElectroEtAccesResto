import 'package:flutter/material.dart';
import 'package:mymobileproject/provider/user_provider.dart';
import 'package:provider/provider.dart'; // Pour accéder au Provider
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/label.dart';
import 'package:mymobileproject/UI/widgets/updateUser/SizeboxBtwLabelField.dart';
import 'package:mymobileproject/constants.dart';

/*
  Widget pour le champ "Prénom" transformé en StatelessWidget.
  L'état est maintenant géré par le UserProvider, ce qui permet :
  - Une meilleure séparation des responsabilités
  - Une gestion d'état centralisée
  - Une meilleure testabilité
*/
class FirstNameSection extends StatelessWidget {
  final TextEditingController controller; // ← ICI

  const FirstNameSection({
    super.key,
    required this.controller, // ← ICI
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Label(text: 'Prénom'),

        // Espacement entre le label et le champ
        const SizeBoxBtwLabelField(),

        // Container qui englobe le TextField pour le style
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: kSecondColor, // Couleur de fond
            borderRadius: BorderRadius.circular(10), // Bords arrondis
            boxShadow: const [
              // Ombre pour l'effet de relief
              BoxShadow(
                color: boxshadowColor,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
            border:
                Border.all(color: kPrimaryColor, width: 3), // Bordure colorée
          ),
          height: 50, // Hauteur fixe
          child: TextField(
            controller: controller, // ← ICI
            keyboardType: TextInputType.text, // Type de clavier texte
            style: const TextStyle(color: enterTextFieldColor),
            onChanged: (value) {
              // Appel au Provider pour mettre à jour l'état
              Provider.of<UserProvider>(context, listen: false)
                  .firstname(value); // ← ICI
            },
            decoration: const InputDecoration(
              border: InputBorder.none, // Pas de bordure interne
              contentPadding: EdgeInsets.only(top: 11), // Padding interne
              prefixIcon: Icon(Icons.person, color: kPrimaryColor),
              hintText: 'Prénom', // Texte indicatif
              hintStyle: TextStyle(
                  color: kPrimaryColor, fontSize: 12), // Style du hint
            ),
          ),
        ),
      ],
    );
  }
}

/* class FullNameSection extends StatefulWidget {
  const FullNameSection({super.key});

  @override
  State<FullNameSection> createState() => _FullNameSectionState();
}

class _FullNameSectionState extends State<FullNameSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Label(text: 'Nom complet'),
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
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: enterTextFieldColor,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 11),
                prefixIcon: Icon(Icons.person, color: kPrimaryColor),
                hintText: 'Nom & prénom',
                hintStyle: TextStyle(color: kPrimaryColor, fontSize: 12)),
          ),
        )
      ],
    );
  }
}
 */