import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/patients.dart';
import 'package:flutter_auth/services/patient_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyPatientsScreen extends StatefulWidget {
  @override
  _MyPatientsScreenState createState() => _MyPatientsScreenState();
}

class _MyPatientsScreenState extends State<MyPatientsScreen> {
  var _patientName = TextEditingController();
  var _disease = TextEditingController();
  var _patient = Patients();
  var _patientservice = PatientService();
  final _auth = FirebaseAuth.instance;
  List<Patients> _patientList = List<Patients>();

  var _editPatientName = TextEditingController();

  var _editPatientDisease = TextEditingController();

  var patient;

  @override
  void initState() {
    super.initState();
    getAllPatients();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  getAllPatients() async {
    _patientList = List<Patients>();
    var patients = await _patientservice.getPatients();
    patients.forEach((patient) {
      setState(() {
        var model = Patients();
        model.name = patient['name'];
        model.id = patient['id'];
        model.disease = patient['disease'];

        _patientList.add(model);
      });

      print('Disease: ' + patient['disease']);
    });
  }

  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(
                onPressed: () async {
                  _patient.name = _patientName.text;
                  _patient.disease = _disease.text;
                  var result = await _patientservice.savePatient(_patient);
                  print(result);
                  if (result > 0) Navigator.pop(context);
                },
                child: Text('Save'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
            title: Text('Patient Details'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _patientName,
                    decoration: InputDecoration(hintText: 'Name'),
                  ),
                  TextField(
                    controller: _disease,
                    decoration: InputDecoration(hintText: 'Disease'),
                  )
                ],
              ),
            ),
          );
        });
  }

  _editPatientDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(
                onPressed: () async {
                  _patient.id = patient[0]['id'];
                  _patient.name = _editPatientName.text;
                  _patient.disease = _editPatientDisease.text;
                  var result = await _patientservice.updatePatient(_patient);
                  if (result > 0) {
                    Navigator.pop(context);
                    getAllPatients();
                    _showSackbar(
                      Text('Success'),
                    );
                  }
                  print(result);
                },
                child: Text('Update'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
            title: Text('Edit Patient Details'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _editPatientName,
                    decoration: InputDecoration(hintText: 'Name'),
                  ),
                  TextField(
                    controller: _editPatientDisease,
                    decoration: InputDecoration(hintText: 'Disease'),
                  )
                ],
              ),
            ),
          );
        });
  }

  _editPatient(BuildContext context, patientId) async {
    patient = await _patientservice.getPatientById(patientId);
    setState(() {
      _editPatientName.text = patient[0]['name'] ?? 'No Name';
      _editPatientDisease.text = patient[0]['diesease'] ?? 'No Disease';
    });
    _editPatientDialog(context);
  }

  _showSackbar(message) {
    var _snackbar = SnackBar(
      content: message,
    );
    _scaffoldKey.currentState.showSnackBar(_snackbar);
  }

  _deleteDialog(BuildContext context, patientId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: Text('Are you sure you want to delete'),
            actions: [
              FlatButton(
                child: Text('Yes'),
                onPressed: () async {
                  await _patientservice.deletePatient(patientId);
                  Navigator.pop(context);
                  getAllPatients();
                },
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.builder(
          itemCount: _patientList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _editPatient(context, _patientList[index].id);
                    }),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_patientList[index].name),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      onPressed: () {
                        _deleteDialog(context, _patientList[index].id);
                      },
                    )
                  ],
                ),
              ),
            );
          }),
      appBar: AppBar(
        title: Text('My Patients'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  _auth.signOut();
                  Navigator.pop(context);
                },
                child: Icon(Icons.close)),
          )
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text('Doctor'),
            accountName: Text('John Morreau'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: kPrimaryLightColor,
                child: Icon(
                  Icons.phone_android,
                  color: kPrimaryColor,
                  size: 30.0,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Appointments'),
            leading: Icon(Icons.notifications),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyPatientsScreen()));
            },
            title: Text('My Patients'),
            leading: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text('Payments'),
            leading: Icon(Icons.payment),
          ),
          ListTile(
            title: Text('Equipment Status'),
            leading: Icon(Icons.shop),
          ),
        ],
      )),
    );
  }
}
