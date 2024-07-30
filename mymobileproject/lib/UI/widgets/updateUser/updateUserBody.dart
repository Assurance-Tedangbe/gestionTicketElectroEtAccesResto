import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.template.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateConfirmPassword.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateEmail.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateFullName.dart';
import 'package:mymobileproject/UI/widgets/updateUser/pageIconTemplate.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updatePassword.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateRole.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateUserBtn.dart';
import 'package:mymobileproject/UI/widgets/updateUser/updateUsername.dart';

class UpdateUserBody extends StatefulWidget {
  const UpdateUserBody({super.key});

  @override
  State<UpdateUserBody> createState() => _UpdateUserBodyState();
}

class _UpdateUserBodyState extends State<UpdateUserBody> {
  @override
  Widget build(BuildContext context) {
    return const Background(
        child: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PageIconTemplate(iconData: Icons.update),
          SizeboxTemplate(),
          UpdateFullName(),
          SizeboxTemplate(),
          UpdateUsername(),
          SizeboxTemplate(),
          UpdateRole(),
          SizeboxTemplate(),
          UpdateEmail(),
          SizeboxTemplate(),
          UpdatePassword(),
          SizeboxTemplate(),
          UpdateConfirmPassword(),
          SizeboxTemplate(),
          UpdateUserBtn()
        ],
      ),
    ));
  }
}
