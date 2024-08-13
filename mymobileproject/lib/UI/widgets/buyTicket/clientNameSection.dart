import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/transfert/transfert.credit/label.dart';
import 'package:mymobileproject/constants.dart';

class ClientNameSection extends StatefulWidget {
  const ClientNameSection({super.key});

  @override
  State<ClientNameSection> createState() => _ClientNameSectionState();
}

class _ClientNameSectionState extends State<ClientNameSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Label(text: "Nom de l'acheteur"),
          const SizedBox(height: 5),
          Container(
            width: size.width * 0.50,
            height: size.height / 11.0,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(234, 234, 244, 1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
                border: Border.all(color: kPrimaryColor, width: 1)),
            child: const TextField(
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 15, bottom: 15),
                  prefixIcon: Icon(Icons.person, color: Colors.black54),
                  hintText: "Acheteur",
                  hintStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 11,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
