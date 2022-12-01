import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/home.dart';
import 'package:mymobileproject/UI/pages/login.dart';
import 'package:mymobileproject/UI/pages/settings.dart';
import 'package:mymobileproject/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RootView();
  }
}

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.lightBlue,
        primaryColor: kPrimaryColor,
        // scaffoldBackgroundColor: secondColor
      ),
      routes: {
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
        "/settings": (context) => const SettingsPage(),
      },
      initialRoute: "/home",
    );
  }
}
