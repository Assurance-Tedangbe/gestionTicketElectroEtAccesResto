import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/updateUser/SizeboxBtwLabelField.dart';
import 'package:mymobileproject/UI/widgets/updateUser/fieldLabel.dart';
import 'package:mymobileproject/constants.dart';

class EmailSection extends StatefulWidget {
  const EmailSection({super.key});

  @override
  State<EmailSection> createState() => _EmailSectionState();
}

class _EmailSectionState extends State<EmailSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const FieldLabel(fldLabel: "Email"),
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
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: kPrimaryColor),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 12,
                )),
          ),
        )
      ],
    );
  }
}
