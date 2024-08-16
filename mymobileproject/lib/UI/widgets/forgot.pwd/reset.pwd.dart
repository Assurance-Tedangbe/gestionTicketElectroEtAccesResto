import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/forgot.pwd/reset.btn.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/signup/confirmpwdsection.dart';
import 'package:mymobileproject/UI/widgets/signup/passwordsection.dart';
import 'package:mymobileproject/constants.dart';

class ResetPwd extends StatefulWidget {
  const ResetPwd({super.key});

  @override
  State<ResetPwd> createState() => _ResetPwdState();
}

class _ResetPwdState extends State<ResetPwd> {
  static const String _title = 'Réinitialisation mot de passe';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text(_title)),
      body: const Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.lock_reset,
              color: kPrimaryColor,
              size: 70,
            ),
            SizeboxHeight(),
            PasswordSection(),
            SizeboxHeight(),
            ConfirmPwdSection(),
            SizeboxHeight(),
            ResetBtn(),
          ],
        ),
      ),
    );
  }
}
