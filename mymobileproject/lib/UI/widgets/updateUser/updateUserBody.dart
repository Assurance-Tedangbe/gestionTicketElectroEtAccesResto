import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizeboxHeightSession.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PageIconTemplate(iconData: Icons.update),
          SizedBox(height: 5),
          UpdateFullName(),
          SizeboxHeightSession(),
          UpdateUsername(),
          SizeboxHeightSession(),
          UpdateRole(),
          SizeboxHeightSession(),
          UpdateEmail(),
          SizeboxHeightSession(),
          UpdatePassword(),
          SizeboxHeightSession(),
          UpdateConfirmPassword(),
          UpdateUserBtn()
        ],
      ),
    ));
  }
}
