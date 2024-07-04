import 'package:flutter/material.dart';

class NameSection extends StatefulWidget {
  const NameSection({super.key});

  @override
  State<NameSection> createState() => _NameSectionState();
}

class _NameSectionState extends State<NameSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Nom complet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
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
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.person, color: Colors.blue),
                hintText: 'Nom & prénom',
                hintStyle: TextStyle(color: Colors.blue, fontSize: 12)),
          ),
        )
      ],
    );
  }
}
