import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/updateUser/SizeboxBtwLabelField.dart';
import 'package:mymobileproject/UI/widgets/updateUser/fieldLabel.dart';
import 'package:mymobileproject/constants.dart';

class FullNameSection extends StatefulWidget {
  const FullNameSection({super.key});

  @override
  State<FullNameSection> createState() => _FullNameSectionState();
}

class _FullNameSectionState extends State<FullNameSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const FieldLabel(fldLabel: "Nom complet"),
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
                prefixIcon: Icon(Icons.person, color: kPrimaryColor),
                hintText: 'Nom & prénom',
                hintStyle: TextStyle(color: kPrimaryColor, fontSize: 12)),
          ),
        )
      ],
    );
  }
}
