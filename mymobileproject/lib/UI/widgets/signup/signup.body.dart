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
