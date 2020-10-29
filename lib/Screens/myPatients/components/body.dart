import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/myPatients/components/background.dart';
import 'package:flutter_auth/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: ListView(children: [
        PatientsCard(
          fName: 'Leonardo',
          sex: 'M',
          age: '45 years ',
          issue: 'Bone Fracture in the ankle region',
          uid: '15567',
          pictureLocation: 'assets/images/leonardo.jpeg',
          scale: 25.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        PatientsCard(
          fName: 'Gal',
          sex: 'F',
          age: '35 years',
          issue: 'Ligament Fracture in upper arm',
          uid: '35498',
          pictureLocation: 'assets/images/scarlett.jpg',
          scale: 7.0,
        )
      ]),
    );
  }
}

class PatientsCard extends StatelessWidget {
  final String fName;

  final String pictureLocation;
  final String uid;
  final String age;
  final String sex;
  final String issue;
  final double scale;

  PatientsCard({
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Last Visit : 15-10-2020',
                              style: TextStyle(fontSize: 18.0),
                            )
                          ],
                        )
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
