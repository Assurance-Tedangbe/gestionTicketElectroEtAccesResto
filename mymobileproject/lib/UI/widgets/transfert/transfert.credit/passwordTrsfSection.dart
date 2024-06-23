import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/home/stat.label.dart';
import 'package:mymobileproject/constants.dart';

class PasswordTrsfSection extends StatefulWidget {
  const PasswordTrsfSection({super.key});

  @override
  State<PasswordTrsfSection> createState() => _PasswordTrsfSectionState();
}

class _PasswordTrsfSectionState extends State<PasswordTrsfSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Label(label: 'Votre mot de passe'),
        const SizedBox(height: 10),
        Container(
          width: 300,
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ],
              border: Border.all(color: kPrimaryColor, width: 3)),
          child: const TextField(
            //  keyboardType: TextInputType.emailAddress,
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.password, color: kPrimaryColor),
              hintText: 'Mot de passe',
              hintStyle: TextStyle(
                color: kPrimaryColor,
                fontSize: 12,
              ),
              suffixIcon: Icon(
                Icons.visibility,
                color: kPrimaryColor,
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
