import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class StudentAccountNumber extends StatefulWidget {
  const StudentAccountNumber({super.key});

  @override
  State<StudentAccountNumber> createState() => _StudentAccountNumberState();
}

class _StudentAccountNumberState extends State<StudentAccountNumber> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'N° compte étudiant',
          style: TextStyle(
            color: kThirdColor,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 290,
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
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.person, color: kPrimaryColor),
                hintText: 'N° compte etudiant',
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
