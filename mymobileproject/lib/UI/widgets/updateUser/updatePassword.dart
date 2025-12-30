import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/label.dart';
import 'package:mymobileproject/UI/widgets/updateUser/SizeboxBtwLabelField.dart';
import 'package:mymobileproject/constants.dart';
import 'package:provider/provider.dart';
import 'package:mymobileproject/provider/user_provider.dart';

class UpdatePassword extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const UpdatePassword({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Label(text: 'Mot de passe'),
            const SizeBoxBtwLabelField(),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: kSecondColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: boxshadowColor,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
                border: Border.all(color: kPrimaryColor, width: 3),
              ),
              height: 50,
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: const TextStyle(
                  color: enterTextFieldColor,
                ),
                onChanged: onChanged,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 11),
                  prefixIcon: Icon(Icons.password, color: kPrimaryColor),
                  hintText: 'Nouveau mot de passe',
                  hintStyle: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 12,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/* class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Label(text: 'Mot de passe'),
        const SizeBoxBtwLabelField(),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: boxshadowColor, blurRadius: 6, offset: Offset(0, 2))
              ],
              border: Border.all(color: kPrimaryColor, width: 3)),
          height: 50,
          child: const TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: TextStyle(
              color: enterTextFieldColor,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 11),
              prefixIcon: Icon(Icons.password, color: kPrimaryColor),
              hintText: 'Mot de passe',
              hintStyle: TextStyle(
                color: kPrimaryColor,
                fontSize: 12,
              ),
              suffixIcon: Icon(
                Icons.visibility_off,
                color: kPrimaryColor,
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
} */
