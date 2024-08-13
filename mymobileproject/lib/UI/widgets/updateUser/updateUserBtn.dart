import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class UpdateUserBtn extends StatefulWidget {
  const UpdateUserBtn({super.key});

  @override
  State<UpdateUserBtn> createState() => _UpdateUserBtnState();
}

class _UpdateUserBtnState extends State<UpdateUserBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        height: 90,
        child: ElevatedButton(
          onPressed: () => print('update pressed'),
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            textStyle: const TextStyle(
                color: kSecondColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: const Text('Modifier'),
        ));
  }
}
