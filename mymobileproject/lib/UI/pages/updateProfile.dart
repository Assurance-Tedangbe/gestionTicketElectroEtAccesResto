import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/updateProfile.body.dart';

class UpdateProfile extends StatefulWidget {
  // const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  static const String _title = 'Mettre à jour son profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: Body());
  }
}
