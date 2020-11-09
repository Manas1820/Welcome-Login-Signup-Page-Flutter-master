import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/Screens/admin/admin_screen.dart';
import 'package:flutter_auth/Screens/myDoctors/mydoctors_screen.dart';
import 'package:flutter_auth/Screens/myPatients/mypatients_screen.dart';

class Roles extends StatefulWidget {
  final UserCredential user;

  const Roles({Key key, @required this.user}) : super(key: key);

  @override
  _RolesState createState() => _RolesState();
}

class _RolesState extends State<Roles> {
  
  final db = FirebaseFirestore.instance;
  StreamSubscription sub;
  Map data;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    print("Init state");
    sub = db
        .collection('users')
        .doc(widget.user.user.uid)
        .snapshots()
        .listen((snap) {
      setState(() {
        data = snap.data();
        _loading = true;
      });
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
  //use data['Roles'] to get the role of the user inside build and then inside
  // _loading you can write the code for navigating to various pages

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      if (data['role'] == 'admin') {
        return MyAdminScreen();
      }
      if (data['role'] == 'doctor') {
        return MyPatientsScreen();
      }
      if (data['role'] == 'patient') {
        return MyDoctorScreen();
      }
      if (data['role'] == 'nurse') {
        return MyDoctorScreen();
      }
    } else {
      return Loader();
    }
  }
}

class Loader extends StatelessWidget {
  const Loader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
