import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Role/role_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/custom_tab_bar.dart';
import 'package:flutter_auth/Screens/inventoryScreen.dart';
import 'package:flutter_auth/Screens/myDoctors/mydoctors_screen.dart';
import 'package:flutter_auth/Screens/myPatients/mainscreen.dart';
import 'package:flutter_auth/Screens/myPatients/mypatients_screen.dart';
import 'package:flutter_auth/database/databaseUI.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    LoginScreen(),
    RoleScreen(),
    SignUpScreen(),
   Inventory(),
    MyPatientsScreen(),
    MainScreen(),
    DatabaseUI(),
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountOutline,
    MdiIcons.circleOutline,
    MdiIcons.bellOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: CustomTabBar(
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
            ),
          ),
        ));
  }
}
