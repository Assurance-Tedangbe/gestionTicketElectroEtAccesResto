import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/updateUser/SizeboxBtwLabelField.dart';
import 'package:mymobileproject/UI/widgets/updateUser/fieldLabel.dart';
import 'package:mymobileproject/constants.dart';

class UpdateUsername extends StatefulWidget {
  const UpdateUsername({super.key});

  @override
  State<UpdateUsername> createState() => _UpdateUsernameState();
}

class _UpdateUsernameState extends State<UpdateUsername> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const FieldLabel(fldLabel: "Nom d'utilisateur"),
        const SizeBoxBtwLabelField(),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ],
              border: Border.all(color: kPrimaryColor, width: 3)),
          height: 60,
          child: const TextField(
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
            ),
          ),
        )
      ],
    );
  }
}
