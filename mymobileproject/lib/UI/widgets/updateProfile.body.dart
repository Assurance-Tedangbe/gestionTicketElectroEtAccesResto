import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.update,
            color: Colors.blue,
            size: 70,
          ),
          const SizedBox(height: 12),
          updateName(),
          const SizedBox(height: 12),
          updateUsername(),
          const SizedBox(height: 12),
          updateEmail(),
          const SizedBox(height: 12),
          manageUpdateBtn(),
        ],
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
            // prefixIcon: Icon(Icons.person, color: Colors.blue),
            // hintText: 'Nom & prénom',
            //  hintStyle: TextStyle(color: Colors.blue, fontSize: 12)
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
            //    prefixIcon: Icon(Icons.person, color: Colors.blue),
            //    hintText: 'Nom d\'utilisateur',
            //    hintStyle: TextStyle(color: Colors.blue, fontSize: 12)
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
            //  prefixIcon: Icon(Icons.email, color: Colors.blue),
            //   hintText: 'Email',
            //  hintStyle: TextStyle(color: Colors.blue,fontSize: 12,)
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
