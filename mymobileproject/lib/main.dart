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
        primaryColor: kPrimaryColor,
      ),
      routes: {
        "/cover": (context) => const CoverPage(),
        "/home": (context) => const RootV(),
        "/login": (context) => const LoginPage(),
        "/sign-up": (context) => const SignUpPage(),
        "/admin": (context) => const AdminInterface(),
        "/manage-students": (context) => const ManageStudent(),
        "/manage-agents": (context) => const ManageAgent(),
        "/manage-porters": (context) => const ManagePorter(),
        "/scanQR": (context) => const ScanQR(),
        "/activate-account": (context) => const ActivateAccount(),
        "/deactivate-account": (context) => const DeactivateAccount(),
        "/student": (context) => const StudentInterface(),
        "/ticket": (context) => const BuyTicket(),
        "/transfert-ticket": (context) => const TransfertTicket(),
        "/transfert-credit": (context) => const TransfertCredit(),
        "/cancel-transfert-ticket": (context) => const CancelTrsfTicket(),
        "/cancel-transfert-credit": (context) => const CancelTrsfCredit(),
        "/consult-account": (context) => const ConsultAccount(),
        "/update-profile": (context) => const UpdateProfile(),
        "/porter": (context) => const PorterInterface(),
        "/debit-account": (context) => const DebitAccount(),
        "/agent": (context) => const AgentInterface(),
        "/credit-account": (context) => const CreditAccount(),
        "/cancel-recharge": (context) => const CancelRecharge(),
        "/settings": (context) => const SettingsPage(),
        "/log-out": (context) => const LogOut(),
      },
      initialRoute: "/cover",
    );
  }
}
