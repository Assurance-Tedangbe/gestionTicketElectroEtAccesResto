import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/admin/student.mgmt.dart/listStudents.dart';

class ManageStudentsBody extends StatelessWidget {
  const ManageStudentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Column(children: [
          ListStudentsPage(),
        ]),
      ),
    );
  }
}
