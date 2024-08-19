import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizeboxHeightSession.dart';
import 'package:mymobileproject/UI/widgets/signup/checksignin.btn.dart';
import 'package:mymobileproject/UI/widgets/signup/confirmpwdsection.dart';
import 'package:mymobileproject/UI/widgets/signup/emailsection.dart';
import 'package:mymobileproject/UI/widgets/signup/fullnamesection.dart';
import 'package:mymobileproject/UI/widgets/signup/passwordsection.dart';
import 'package:mymobileproject/UI/widgets/signup/roleSection.dart';
import 'package:mymobileproject/UI/widgets/signup/signup.Btn.dart';
import 'package:mymobileproject/UI/widgets/signup/usernamesection.dart';
import 'package:mymobileproject/UI/widgets/updateUser/pageIconTemplate.dart';

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
            FullNameSection(),
            SizeboxHeightSession(),
            UsernameSection(),
            SizeboxHeightSession(),
            RoleSection(),
            SizeboxHeightSession(),
            EmailSection(),
            SizeboxHeightSession(),
            PasswordSection(),
            SizeboxHeightSession(),
            ConfirmPwdSection(),
            SignupBtn(),
            CheckSigninBtn()
          ],
        ),
      ),
    );
  }
}
