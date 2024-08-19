import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/forgot.pwd/gotoreset.pwd.btn.dart';
import 'package:mymobileproject/UI/widgets/login/login.emailsection.dart';

class ForgotPwdBody extends StatelessWidget {
  const ForgotPwdBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.2),
          LoginEmailSection(),
          const GoToResetPwdBtn(),
        ],
      ),
    );
  }
}
