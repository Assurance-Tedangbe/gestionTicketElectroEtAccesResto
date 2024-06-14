import 'package:flutter/material.dart';
import 'package:mymobileproject/UI/pages/activateAccount.dart';
import 'package:mymobileproject/UI/pages/agentInterface.dart';
import 'package:mymobileproject/UI/pages/cancelRecharge.dart';
import 'package:mymobileproject/UI/pages/cancelTransfert.dart';
import 'package:mymobileproject/UI/pages/consultAccount.dart';
import 'package:mymobileproject/UI/pages/creditAccount.dart';
import 'package:mymobileproject/UI/pages/deactivateAccount.dart';
import 'package:mymobileproject/UI/pages/debitAccount.dart';
import 'package:mymobileproject/UI/pages/coverPage.dart';
import 'package:mymobileproject/UI/pages/rootView.dart';
import 'package:mymobileproject/UI/pages/login.dart';
import 'package:mymobileproject/UI/pages/logout.dart';
import 'package:mymobileproject/UI/pages/porterInterface.dart';
import 'package:mymobileproject/UI/pages/settings.dart';
import 'package:mymobileproject/UI/pages/signup.dart';
import 'package:mymobileproject/UI/pages/studentInterface.dart';
import 'package:mymobileproject/UI/pages/ticket.dart';
import 'package:mymobileproject/UI/pages/transfertCredit.dart';
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
        "/cover": (context) => CoverPage(),
        "/home": (context) => Home(),
        "/login": (context) => LoginPage(),
        "/sign-up": (context) => SignUpPage(),
        "/activate-account": (context) => ActivateAccount(),
        "/student": (context) => StudentInterface(),
        "/ticket": (context) => Ticket(),
        "/transfert-credit": (context) => Transfert(),
        "/consult-account": (context) => ConsultAccount(),
        "/update-profile": (context) => UpdateProfile(),
        "/porter": (context) => PorterInterface(),
        "/agent": (context) => AgentInterface(),
        "/credit-account": (context) => CreditAccount(),
        "/debit-account": (context) => DebitAccount(),
        "/deactivate-account": (context) => DeactivateAccount(),
        "/settings": (context) => SettingsPage(),
        "/cancel-recharge": (context) => CancelRecharge(),
        "/cancel-transfert": (context) => CancelTrsf(),
        "/log-out": (context) => LogOut(),
      },
      initialRoute: "/cover",
    );
  }
}
