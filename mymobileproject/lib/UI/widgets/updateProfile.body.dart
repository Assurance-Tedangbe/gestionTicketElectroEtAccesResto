import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class UpdateProfileBody extends StatefulWidget {
  const UpdateProfileBody({super.key});

  @override
  State<UpdateProfileBody> createState() => _UpdateProfileBodyState();
}

class _UpdateProfileBodyState extends State<UpdateProfileBody> {
  @override
  Widget build(BuildContext context) {
    return const Background(
        child: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[],
      ),
    ));
  }
}

Widget updateName() {
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
          ),
        ),
      )
    ],
  );
}

Widget updateUsername() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Nom d\'utilisateur',
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
          ),
        ),
      )
    ],
  );
}

Widget updateEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Email',
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
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
          ),
        ),
      )
    ],
  );
}

Widget manageUpdateBtn() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      height: 100,
      child: ElevatedButton(
        onPressed: () => print('update pressed'),
        child: const Text('Modifier'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ));
}
