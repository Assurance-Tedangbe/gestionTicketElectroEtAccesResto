import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/widgets/settings.body.dart';

class SettingsPage extends StatefulWidget {
  // const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const String _title = 'Paramètres';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(_title)),
        body: Body());
  }
}
