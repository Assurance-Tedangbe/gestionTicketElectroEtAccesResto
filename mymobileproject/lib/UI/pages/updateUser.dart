import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateUserBody.dart';

class UpdateUser extends StatelessWidget {
  static const String _title = 'Modifier un utilisateur';
  const UpdateUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: UpdateUserBody());
  }
}
