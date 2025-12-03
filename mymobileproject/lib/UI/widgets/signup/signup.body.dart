import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizeboxHeightSession.dart';
import 'package:mymobileproject/UI/widgets/signup/checksignin.btn.dart';
import 'package:mymobileproject/UI/widgets/signup/confirmpwdsection.dart';
import 'package:mymobileproject/UI/widgets/signup/emailsection.dart';
import 'package:mymobileproject/UI/widgets/signup/firstnamesection.dart';
import 'package:mymobileproject/UI/widgets/signup/lastnamesection.dart';
import 'package:mymobileproject/UI/widgets/signup/passwordsection.dart';
import 'package:mymobileproject/UI/widgets/signup/roleSection.dart';
import 'package:mymobileproject/UI/widgets/signup/signup.Btn.dart';
import 'package:mymobileproject/UI/widgets/signup/usernamesection.dart';
import 'package:mymobileproject/UI/widgets/updateUser/pageIconTemplate.dart';

/*
  Widget principal qui organise tous les champs du formulaire d'inscription.
  Maintenant tous les sous-widgets sont des StatelessWidget dynamisés.
*/
class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _selectedRole;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignupSuccess() {
    // Navigation vers l'écran de connexion ou d'accueil
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void _onRoleChanged(String? role) {
    setState(() {
      _selectedRole = role;
    });
    // Vous pouvez aussi stocker le rôle dans le UserProvider si nécessaire
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        // Permet de scroller si le formulaire est trop long
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icône de la page
            const PageIconTemplate(iconData: Icons.person_add),
            const SizedBox(height: 5),
            FirstNameSection(
              controller: _firstNameController,
            ),
            const SizeboxHeightSession(),
            LastNameSection(controller: _lastNameController),
            const SizeboxHeightSession(),
            UsernameSection(controller: _usernameController),
            const SizeboxHeightSession(),
            // Section Rôle (chargée dynamiquement)
            RoleSection(onRoleChanged: _onRoleChanged),
            const SizeboxHeightSession(),
            EmailSection(controller: _emailController),
            const SizeboxHeightSession(),
            PasswordSection(controller: _passwordController),
            const SizeboxHeightSession(),
            ConfirmPwdSection(controller: _confirmPasswordController),
            const SizeboxHeightSession(),
            // Bouton de soumission (activé/désactivé dynamiquement)
            //SignupBtn(onSignupSuccess: _onSignupSuccess),
            const CheckSigninBtn(),
          ],
        ),
      ),
    );
  }
}
/* 
class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PageIconTemplate(iconData: Icons.person_add),
            SizedBox(height: 5),
            FirstNameSection(), //controller: controller),
            SizeboxHeightSession(),
            LastNameSection(), //controller: controller),
            SizeboxHeightSession(),
            UsernameSection(), //controller: controller),
            SizeboxHeightSession(),
            // RoleSection(onRoleChanged: (String? value) {  },),
            SizeboxHeightSession(),
            EmailSection(), //controller: controller),
            SizeboxHeightSession(),
            PasswordSection(), //controller: controller),
            SizeboxHeightSession(),
            ConfirmPwdSection(), //controller: controller),
            SignupBtn(),
            CheckSigninBtn()
          ],
        ),
      ),
    );
  }
}
 */