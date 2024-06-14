import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mymobileproject/UI/pages/agentInterface.dart';
import 'package:mymobileproject/UI/pages/coverPage.dart';
import 'package:mymobileproject/UI/pages/creditAccount.dart';
import 'package:mymobileproject/UI/pages/debitAccount.dart';
import 'package:mymobileproject/UI/pages/porterInterface.dart';
import 'package:mymobileproject/UI/widgets/home/myhome.body.dart';
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
            ? AppBar(
                title: const Text(
                  "Calculateur",
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                backgroundColor: kPrimaryColor,
                leading: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                ),
              )
            : null,*/
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
            Icon(
              Icons.home,
              color: Colors.white,
              size: 35.0,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
              size: 35.0,
            ),
            Icon(
              Icons.person_2,
              color: Colors.white,
              size: 35.0,
            ),
            Icon(
              Icons.person_3,
              color: Colors.white,
              size: 35.0,
            )
          ],
        ),
      )),
    );
  }

  Widget selectedContent({required int index}) {
    Widget widget = const HomeBody();
    switch (index) {
      case 0:
        widget = const HomeBody();
        break;
      case 1:
        widget = const AgentInterface();
        break;
      case 2:
        widget = const PorterInterface();
        break;
      case 3:
        widget = const CoverPage();
        break;
    }
    return widget;
  }
}
