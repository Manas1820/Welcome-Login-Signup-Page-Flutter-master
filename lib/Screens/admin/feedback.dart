import 'package:flutter/material.dart';
class Feedbacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FeedBack n Complaints')),
      body:ListView(children: [
      DoctorsCard(
          fName: 'Will Smith',
          sex: 'M',
          age: '45 years ',
          issue: 'Room No 427 has problem with the AC',
          uid: '15567',
          pictureLocation: 'assets/images/smith.jpg',
          scale: 25.0,
        ),
        SizedBox(height:10.0),
        DoctorsCard(
          fName: 'Nie Yao',
          sex: 'M',
          age: '27 years ',
          issue: 'Was very satisfied with the services of the hospital',
          uid: '15567',
          pictureLocation: 'assets/images/smith.jpg',
          scale: 25.0,
        ),
      ],
      ),
      
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
                      style: TextStyle(fontSize: 12.0),
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}
