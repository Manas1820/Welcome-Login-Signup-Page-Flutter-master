import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Roles extends StatefulWidget {
  final UserCredential user;

  const Roles({Key key, this.user}) : super(key: key);

  @override
  _RolesState createState() => _RolesState();
}

class _RolesState extends State<Roles> {
  var user_id = ""; // TODO: Pass the user Id here
  final db = FirebaseFirestore.instance;
  StreamSubscription sub;
  Map data;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    sub = db.collection('users').doc(user_id).snapshots().listen((snap) {
      setState(() {
        data = snap.data();
        _loading = true;
      });
    });
  }

  //use data['Roles'] to get the role of the user inside build and then inside
  // _loading you can write the code for navigating to various pages

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return null;
    } else {
      return null;
    }
  }
}
