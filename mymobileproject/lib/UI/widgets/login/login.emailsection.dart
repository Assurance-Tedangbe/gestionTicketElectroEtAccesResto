import 'package:flutter/material.dart';

class LoginEmailSection extends StatefulWidget {
  const LoginEmailSection({super.key});

  @override
  State<LoginEmailSection> createState() => _LoginEmailSectionState();
}

class _LoginEmailSectionState extends State<LoginEmailSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            //   fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ],
              border: Border.all(color: Colors.blue, width: 3)),
          height: 60,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Colors.blue),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                )),
          ),
        )
      ],
    );
  }
}
