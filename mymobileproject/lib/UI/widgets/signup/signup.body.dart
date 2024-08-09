import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';
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

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PageIconTemplate(iconData: Icons.person_add),
            SizeboxTemplate(),
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
            SizeboxHeightSession(),
            SignupBtn(),
            CheckSigninBtn()
            // manageFields(label: "Confirmer mot de passe", obscureText: true),
          ],
        ),
      ),
    );
  }
}

/*
Widget manageFields({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      const SizedBox(height: 10)
    ],
  );
}
*/