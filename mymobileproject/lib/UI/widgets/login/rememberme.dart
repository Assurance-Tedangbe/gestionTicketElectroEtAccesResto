import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

/*
  Widget pour la case à cocher "Se souvenir de moi".
*/
class RememberMe extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const RememberMe({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: kPrimaryColor),
            child: Checkbox(
              value: value,
              checkColor: kPrimaryColor,
              activeColor: kSecondColor,
              onChanged: onChanged,
            ),
          ),
          const Text(
            'Se souvenir de moi',
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/* class RememberMe extends StatefulWidget {
  const RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: kPrimaryColor),
          child: Checkbox(
              value: isRememberMe,
              checkColor: kSecondColor,
              activeColor: kPrimaryColor,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              }),
        ),
        const Text(
          'Se souvenir',
          style: TextStyle(color: kThirdColor, fontSize: 20),
        )
      ]),
    );
  }
} */
