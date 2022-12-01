import 'package:flutter/material.dart';
import 'package:mymobileproject/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
            height: 50,
            //   padding:const EdgeInsets.symmetric(vertical: 3, horizontal: 40),
            color: kPrimaryColor,
            //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                text,
                style: TextStyle(
                    color: color, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )),
      ),
    );
  }
}
