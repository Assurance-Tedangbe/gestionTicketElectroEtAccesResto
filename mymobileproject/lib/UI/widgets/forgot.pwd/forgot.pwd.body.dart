import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/constants.dart';

class ForgotPwdBody extends StatelessWidget {
  const ForgotPwdBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.lock,
              color: kPrimaryColor,
              size: 70,
            ),
            SizedBox(height: 12),
            //    managePassword(),
            SizedBox(height: 12),
            //   confirmPassword(),
            SizedBox(height: 12),
            //    manageSignupBtn(),
          ],
        ),
      ),
    );
  }
}
