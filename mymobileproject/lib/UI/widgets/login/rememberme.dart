import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.blue),
          child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.white,
              activeColor: kPrimaryColor,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              }),
        ),
        const Text(
          'Se souvenir',
          style: TextStyle(color: Colors.black, fontSize: 20),
        )
      ]),
    );
  }
}
