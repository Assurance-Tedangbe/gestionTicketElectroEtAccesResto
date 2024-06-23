import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/background.dart';
import 'package:mymobileproject/UI/widgets/home/sizebox.height.dart';
import 'package:mymobileproject/UI/widgets/home/soldeSection.dart';
import 'package:mymobileproject/UI/widgets/student/statistics.student.dart';
import 'package:mymobileproject/UI/widgets/student/student.services.dart';

class StudentBody extends StatefulWidget {
  const StudentBody({super.key});

  @override
  State<StudentBody> createState() => _StudentBodyState();
}

class _StudentBodyState extends State<StudentBody> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Column(children: [
              SoldeSection(),
              SizeboxHeight(),
              StudentServices(),
              SizeboxHeight(),
              StatisticsStudent()
            ]),
          ),
        ),
      ),
    );
  }
}
