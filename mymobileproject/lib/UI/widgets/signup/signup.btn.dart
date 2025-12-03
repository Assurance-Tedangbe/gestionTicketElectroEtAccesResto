import 'package:flutter/material.dart';
import 'package:mymobileproject/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:mymobileproject/constants.dart';

class SignupBtn extends StatelessWidget {
  // final VoidCallback onSignupSuccess; // ← ICI

  const SignupBtn({
    super.key,
    //  required this.onSignupSuccess, // ← ICI
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      // ← ICI
      builder: (context, userProvider, child) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 25),
          width: double.infinity,
          height: 90,
          child: ElevatedButton(
            // ← ICI
            onPressed: userProvider.isCreatingUser || !userProvider.isFormValid
                ? null
                : () async {
                    final success = await userProvider.submitSignup(); // ← ICI
                    if (success) {
                      // Afficher un message de succès
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Compte créé avec succès !'),
                          backgroundColor: Colors.green,
                        ),
                      );

                      // Réinitialiser le formulaire
                      userProvider.resetForm(); // ← ICI

                      // Navigation ou callback
                      //  onSignupSuccess(); // ← ICI
                    } else {
                      // Afficher l'erreur
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(userProvider.error),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: // ← ICI
                  userProvider.isFormValid && !userProvider.isCreatingUser
                      ? kPrimaryColor
                      : Colors.grey,
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              textStyle: const TextStyle(
                color: kSecondColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: userProvider.isCreatingUser // ← ICI
                ? const CircularProgressIndicator(color: kSecondColor)
                : const Text('Créer un compte'),
          ),
        );
      },
    );
  }
}

/* 
class SignupBtn extends StatefulWidget {
  const SignupBtn({super.key});

  @override
  State<SignupBtn> createState() => _SignupBtnState();
}

class _SignupBtnState extends State<SignupBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        height: 90,
        child: ElevatedButton(
          onPressed: () => print('Signup pressed'),
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            textStyle: const TextStyle(
                color: kSecondColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: const Text('Créer un compte'),
        ));
  }
} */
