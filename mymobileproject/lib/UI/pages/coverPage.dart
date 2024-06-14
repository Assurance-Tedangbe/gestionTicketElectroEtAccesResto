import 'package:flutter/material.dart';

import '../widgets/cover/cover.body.dart';
import '../widgets/cover/cover.drawer.dart';

class CoverPage extends StatefulWidget {
  const CoverPage({super.key});

  @override
  State<CoverPage> createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
  static const String _title = 'Couverture';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: const CoverDrawer(),
        appBar: AppBar(title: const Text(_title)),
        body: CoverBody());
  }
}
