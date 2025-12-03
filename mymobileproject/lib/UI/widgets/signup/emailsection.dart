import 'package:flutter/material.dart';
import 'package:mymobileproject/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/label.dart';
import 'package:mymobileproject/UI/widgets/updateUser/SizeboxBtwLabelField.dart';
import 'package:mymobileproject/constants.dart';

/*
  Widget pour le champ "Email" avec validation en temps réel.
  Utilise Consumer pour réagir aux changements d'état du Provider.
*/
class EmailSection extends StatelessWidget {
  final TextEditingController controller; // ← ICI

  const EmailSection({
    super.key,
    required this.controller, // ← ICI
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      // Consumer permet de réagir aux changements du Provider  // ← ICI
      builder: (context, userProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Label(text: 'Email'),
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
                    TextInputType.emailAddress, // Clavier optimisé pour emails
                style: const TextStyle(color: enterTextFieldColor),
                onChanged: (value) {
                  // Met à jour l'email dans le Provider
                  userProvider.mail(value); // ← ICI
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 10),
                  prefixIcon: const Icon(Icons.email, color: kPrimaryColor),
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 12,
                  ),

                  // Affichage conditionnel des erreurs de validation
                  errorText: userProvider.emailError, // ← ICI
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
class EmailSection extends StatefulWidget {
  const EmailSection({super.key});

  @override
  State<EmailSection> createState() => _EmailSectionState();
}

class _EmailSectionState extends State<EmailSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Label(text: 'Email'),
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
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: enterTextFieldColor,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 10),
                prefixIcon: Icon(Icons.email, color: kPrimaryColor),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 12,
                )),
          ),
        )
      ],
    );
  }
}
 */