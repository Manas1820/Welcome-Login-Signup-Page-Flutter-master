import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  var roomnumber=0;
  final firestore = FirebaseFirestore.instance;

  void readData() async {
    databaseReference.once().then((DataSnapshot snapshot) {
     
      print('Data : ${snapshot.value}');
    });
  }

  void updateData() async {
    databaseReference.update({'rooms': roomnumber.toString()});
  }

  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Inventory'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Rooms'),
          Text('$roomnumber'),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  ++roomnumber;
                });
                updateData();
                print(roomnumber);
              }),
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  --roomnumber;
                });
                updateData();
                print(roomnumber);
              }),
        ],
      ),
    );
  }
}
