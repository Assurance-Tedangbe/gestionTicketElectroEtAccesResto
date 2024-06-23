import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
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
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
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
