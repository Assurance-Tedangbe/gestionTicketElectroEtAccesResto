import 'package:flutter/material.dart';

class LoginPasswordSection extends StatefulWidget {
  const LoginPasswordSection({super.key});

  @override
  State<LoginPasswordSection> createState() => _LoginPasswordSectionState();
}

class _LoginPasswordSectionState extends State<LoginPasswordSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Mot de passe',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            //    fontWeight: FontWeight.bold,
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
            //  keyboardType: TextInputType.emailAddress,
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.password, color: Colors.blue),
              hintText: 'Mot de passe',
              hintStyle: TextStyle(
                color: Colors.blue,
                fontSize: 12,
              ),
              suffixIcon: Icon(
                Icons.visibility,
                color: Colors.blue,
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
