import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/admin/porter.mgmt.dart/account.porter.management.dart';

class ManagePorterBody extends StatelessWidget {
  const ManagePorterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Column(children: [PorterMgmt()]),
        ),
      ),
    );
  }
}
