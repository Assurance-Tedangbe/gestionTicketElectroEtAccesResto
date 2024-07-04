import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/forgot.pwd/gotoreset.pwd.btn.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/login/login.emailsection.dart';

class ForgotPwdBody extends StatelessWidget {
  const ForgotPwdBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LoginEmailSection(),
          SizeboxHeight(),
          GoToResetPwdBtn(),
        ],
      ),
    );
  }
}
