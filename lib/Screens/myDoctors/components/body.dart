import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/myPatients/components/background.dart';
import 'package:flutter_auth/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: ListView(children: [
        DoctorsCard(
          fName: 'Will Smith',
          sex: 'M',
          age: '45 years ',
          issue: 'M.S. (Neurosurgery)',
          uid: '15567',
          pictureLocation: 'assets/images/smith.jpg',
          scale: 25.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        DoctorsCard(
          fName: 'Kobe Bryant',
          sex: 'M',
          age: '35 years',
          issue: 'Fellowship in Stroke Neurology',
          uid: '35498',
          pictureLocation: 'assets/images/kobe.jpg',
          scale: 7.0,
        )
      ]),
    );
  }
}

class DoctorsCard extends StatelessWidget {
  final String fName;

  final String pictureLocation;
  final String uid;
  final String age;
  final String sex;
  final String issue;
  final double scale;

  DoctorsCard({
    this.fName,
    this.age,
    this.pictureLocation,
    this.sex,
    this.uid,
    this.issue,
    this.scale,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            padding: EdgeInsets.all(10.0),
            constraints: BoxConstraints(),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  ),
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundColor: kPrimaryColor,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(pictureLocation),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              fName,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            CircleAvatar(backgroundColor: Colors.green,),
                           
                            Container(
                              margin: EdgeInsets.only(left: 20.0),
                              child: Image.asset(
                                sex == 'M'
                                    ? 'assets/images/male-sign.png'
                                    : 'assets/images/female-sign.png',
                                scale: 20.0,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Row(
                          children: [
                            Text(
                              age,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.grey[600]),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                  
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      issue,
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}
