import 'package:flutter/material.dart';
import 'package:mymobileproject/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/label.dart';
import 'package:mymobileproject/UI/widgets/updateUser/SizeboxBtwLabelField.dart';
import 'package:mymobileproject/constants.dart';

class ConfirmPwdSection extends StatelessWidget {
  // final TextEditingController controller;       // ← ICI

  const ConfirmPwdSection({
    super.key,
    //  required this.controller,     // ← ICI
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      // ← ICI
      builder: (context, userProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Label(text: 'Confirmer mot de passe'),
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
              child: TextField(
                // controller: controller,     // ← ICI
                keyboardType: TextInputType.visiblePassword,
                obscureText: !userProvider.isPasswordVisible, // ← ICI
                style: const TextStyle(color: enterTextFieldColor),
                onChanged: (value) {
                  userProvider.confirmepwd(value); // ← ICI
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 11),
                  prefixIcon: const Icon(Icons.password, color: kPrimaryColor),
                  hintText: 'Confirmer mot de passe',
                  hintStyle: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 12,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      userProvider.isPasswordVisible // ← ICI
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      userProvider.togglePasswordVisibility(); // ← ICI
                    },
                  ),
                  border: InputBorder.none,
                  errorText: userProvider.passwordError, // ← ICI
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/* class ConfirmPwdSection extends StatefulWidget {
  const ConfirmPwdSection({super.key});

  @override
  State<ConfirmPwdSection> createState() => _ConfirmPwdSectionState();
}

class _ConfirmPwdSectionState extends State<ConfirmPwdSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Label(text: 'Confirmer mot de passe'),
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
              hintText: 'Confirmer mot de passe',
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
