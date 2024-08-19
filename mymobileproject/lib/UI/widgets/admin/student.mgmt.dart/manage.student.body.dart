import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/admin/student.mgmt.dart/listStudents.dart';

class ManageStudentsBody extends StatelessWidget {
  const ManageStudentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(children: [
          ListStudentsPage(),
        ]),
      ),
    );
  }
}
