import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/activateAccount.dart';
import 'package:mymobileproject/UI/pages/agentInterface.dart';
import 'package:mymobileproject/UI/pages/deactivateAccount.dart';
import 'package:mymobileproject/UI/pages/home.dart';
import 'package:mymobileproject/UI/pages/login.dart';
import 'package:mymobileproject/UI/pages/loginout.dart';
import 'package:mymobileproject/UI/pages/porterInterface.dart';
import 'package:mymobileproject/UI/pages/settings.dart';
import 'package:mymobileproject/UI/pages/signup.dart';
import 'package:mymobileproject/UI/pages/studentInterface.dart';
import 'package:mymobileproject/UI/pages/updateProfile.dart';
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
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/sign up": (context) => SignUpPage(),
        "/activateAccount": (context) => ActivateAccount(),
        "/etudiant": (context) => StudentInterface(),
        "/updateProfile": (context) => UpdateProfile(),
        "/portier": (context) => PorterInterface(),
        "/vendeur": (context) => AgentInterface(),
        "/deactivateAccount": (context) => DeactivateAccount(),
        "/settings": (context) => SettingsPage(),
        "/log out": (context) => LogOut(),
      },
      initialRoute: "/home",
    );
  }
}
