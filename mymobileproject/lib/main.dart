import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymobileproject/UI/pages/activateAccount.dart';
import 'package:mymobileproject/UI/pages/adminInterface.dart';
import 'package:mymobileproject/UI/pages/agentInterface.dart';
import 'package:mymobileproject/UI/pages/buyTicket.dart';
import 'package:mymobileproject/UI/pages/cancelRecharge.dart';
import 'package:mymobileproject/UI/pages/cancelTransfertCredit.dart';
import 'package:mymobileproject/UI/pages/cancelTransfertTicket.dart';
import 'package:mymobileproject/UI/pages/consultAccount.dart';
import 'package:mymobileproject/UI/pages/creditAccount.dart';
import 'package:mymobileproject/UI/pages/deactivateAccount.dart';
import 'package:mymobileproject/UI/pages/debitAccount.dart';
import 'package:mymobileproject/UI/pages/coverPage.dart';
import 'package:mymobileproject/UI/pages/rootView.dart';
import 'package:mymobileproject/UI/pages/login.dart';
import 'package:mymobileproject/UI/pages/logout.dart';
import 'package:mymobileproject/UI/pages/porterInterface.dart';
import 'package:mymobileproject/UI/pages/transfert.ticket.dart';
import 'package:mymobileproject/UI/widgets/admin/agent.mgmt.dart/manage.agent.dart';
import 'package:mymobileproject/UI/widgets/admin/porter.mgmt.dart/manage.porter.dart';
import 'package:mymobileproject/UI/widgets/admin/student.mgmt.dart/manage.student.dart';
import 'package:mymobileproject/UI/pages/scanqr.dart';
import 'package:mymobileproject/UI/pages/settings.dart';
import 'package:mymobileproject/UI/pages/signup.dart';
import 'package:mymobileproject/UI/pages/studentInterface.dart';
import 'package:mymobileproject/UI/pages/transfertCredit.dart';
import 'package:mymobileproject/UI/pages/updateProfile.dart';
import 'package:mymobileproject/bloc/historic.bloc.dart';
import 'package:mymobileproject/bloc/services.bloc.dart';
import 'package:mymobileproject/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ServicesBloc()),
      BlocProvider(create: (context) => HistoricBloc()),
    ], child: const RootView());
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
        "/home": (context) => RootV(),
        "/login": (context) => LoginPage(),
        "/sign-up": (context) => SignUpPage(),
        "/admin": (context) => AdminInterface(),
        "/manage-students": (context) => ManageStudent(),
        "/manage-agents": (context) => ManageAgent(),
        "/manage-porters": (context) => ManagePorter(),
        "/scanQR": (context) => ScanQR(),
        "/activate-account": (context) => ActivateAccount(),
        "/deactivate-account": (context) => DeactivateAccount(),
        "/student": (context) => StudentInterface(),
        "/ticket": (context) => BuyTicket(),
        "/transfert-ticket": (context) => TransfertTicket(),
        "/transfert-credit": (context) => TransfertCredit(),
        "cancel-transfert-ticket": (context) => CancelTrsfTicket(),
        "/cancel-transfert-credit": (context) => CancelTrsfCredit(),
        "/consult-account": (context) => ConsultAccount(),
        "/update-profile": (context) => UpdateProfile(),
        "/porter": (context) => PorterInterface(),
        "/debit-account": (context) => DebitAccount(),
        "/agent": (context) => AgentInterface(),
        "/credit-account": (context) => CreditAccount(),
        "/cancel-recharge": (context) => CancelRecharge(),
        "/settings": (context) => SettingsPage(),
        "/log-out": (context) => LogOut(),
      },
      initialRoute: "/cover",
    );
  }
}
