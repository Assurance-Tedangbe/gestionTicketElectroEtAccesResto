import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mymobileproject/UI/pages/adminInterface.dart';
import 'package:mymobileproject/UI/pages/agentInterface.dart';
import 'package:mymobileproject/UI/pages/home.dart';
import 'package:mymobileproject/UI/pages/porterInterface.dart';
import 'package:mymobileproject/UI/pages/studentInterface.dart';
import 'package:mymobileproject/UI/widgets/navigation/bottomIcon.dart';
import 'package:mymobileproject/UI/widgets/navigation/bottomText.dart';
import 'package:mymobileproject/constants.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: SafeArea(
          child: Scaffold(
        /*  appBar: index == 2
            ? AppBar(): null,*/
        body: selectedContent(index: index),
        bottomNavigationBar:
            //index == 3
            //     ? null :
            CurvedNavigationBar(
          letIndexChange: (value) => true,
          index: index,
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
          backgroundColor: const Color.fromARGB(255, 250, 250, 250),
          color: kPrimaryColor,
          items: const [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomIcon(bottomicon: Icons.home),
                TextAsTooltip(text: "Accueil")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomIcon(bottomicon: Icons.person),
                TextAsTooltip(text: "Interface Etudiant")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomIcon(bottomicon: Icons.person_3_outlined),
                TextAsTooltip(text: "Interface Agent")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomIcon(bottomicon: Icons.person_4),
                TextAsTooltip(text: "Interface Portier")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomIcon(bottomicon: Icons.manage_accounts),
                TextAsTooltip(text: "Portail Admin")
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget selectedContent({required int index}) {
    Widget widget = const Home();
    switch (index) {
      case 0:
        widget = const Home();
        break;
      case 1:
        widget = const Padding(
          padding: EdgeInsets.only(left: 2.0, right: 2.0),
          child: StudentInterface(),
        );
        break;
      case 2:
        widget = const AgentInterface();
        break;
      case 3:
        widget = const PorterInterface();
        break;
      case 4:
        widget = const AdminInterface();
        break;
    }
    return widget;
  }
}
