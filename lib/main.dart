import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Role/role_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';

import 'package:flutter_auth/Screens/myPatients/mypatients_screen.dart';
import 'package:flutter_auth/Screens/nav_screens.dart';
import 'package:flutter_auth/constants.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      routes: {
        'rolescreen': (context) => RoleScreen(),
        'welcomescreen': (context) => WelcomeScreen(),
        'signupscreen': (context) => SignUpScreen(),
        'loginscreen': (context) => LoginScreen(),
        'mypatientsscreen': (context) => MyPatientsScreen(),
      },
    );
  }
}
