import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizeboxHeightSession.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateConfirmPassword.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateEmail.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateFullName.dart';
import 'package:mymobileproject/UI/widgets/updateUser/pageIconTemplate.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updatePassword.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateRole.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateUserBtn.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateUsername.dart';
import 'package:mymobileproject/provider/user_provider.dart';
import 'package:provider/provider.dart';
/*
class UpdateUserBody extends StatefulWidget {
  const UpdateUserBody({super.key});

  @override
  State<UpdateUserBody> createState() => _UpdateUserBodyState();
}

class _UpdateUserBodyState extends State<UpdateUserBody> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    // Initialiser les contrôleurs
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();

    // Charger l'utilisateur et initialiser les champs
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserAndInitializeForm();
    });
  }

  void _loadUserAndInitializeForm() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Charger l'utilisateur
    await userProvider.loadUserById(widget.userId);

    final user = userProvider.currentUser;
    if (user != null) {
      // Pré-remplir les champs
      setState(() {
        _firstNameController.text = user.firstName;
        _lastNameController.text = user.lastName;
        _usernameController.text = user.username;
        _emailController.text = user.email;
      });

      // Initialiser le formulaire dans le provider
      userProvider.initializeFormWithUser(user);
    }
  }

  @override
  void dispose() {
    // Nettoyer les contrôleurs
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const PageIconTemplate(iconData: Icons.update),
            const SizedBox(height: 5),

            // Champs pré-remplis avec contrôleurs
            UpdateFullName(controller: _firstNameController),
            const SizeboxHeightSession(),

            UpdateUsername(controller: _usernameController),
            const SizeboxHeightSession(),

            // Le rôle (peut être changé)
            const UpdateRole(),
            const SizeboxHeightSession(),

            UpdateEmail(controller: _emailController),
            const SizeboxHeightSession(),

            // Mot de passe (laisser vide par défaut pour ne pas le changer)
            const UpdatePassword(),
            const SizeboxHeightSession(),

            const UpdateConfirmPassword(),

            // Bouton de mise à jour
            UpdateUserBtn(userId: widget.userId),
          ],
        ),
      ),
    );
  }
} */

class UpdateUserBody extends StatefulWidget {
  const UpdateUserBody({super.key});

  @override
  State<UpdateUserBody> createState() => _UpdateUserBodyState();
}

class _UpdateUserBodyState extends State<UpdateUserBody> {
  @override
  Widget build(BuildContext context) {
    return const Background(
        child: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PageIconTemplate(iconData: Icons.update),
          SizedBox(height: 5),
          UpdateFullName(),
          SizeboxHeightSession(),
          UpdateUsername(),
          SizeboxHeightSession(),
          UpdateRole(),
          SizeboxHeightSession(),
          UpdateEmail(),
          SizeboxHeightSession(),
          UpdatePassword(),
          SizeboxHeightSession(),
          UpdateConfirmPassword(),
          UpdateUserBtn()
        ],
      ),
    ));
  }
}
