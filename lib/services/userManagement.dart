import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/nav_screens.dart';

class UserManagement {
  Widget handleAuth() {
    return new StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        // if(snapshot.connectionState==ConnectionState.waiting){
        // to show a loading screen
        // }
        if (snapshot.hasData) {
          return NavScreen();
        }
        return LoginScreen();
      },
    );
  }

  authorizeAccess(BuildContext context) {
    FirebaseFirestore.instance.collection('/users').where('uid');
  }
}
