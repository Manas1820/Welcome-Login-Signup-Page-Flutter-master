import 'package:flutter/material.dart';
import 'package:flutter_auth/services/patient_service.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _patientName = TextEditingController();

  var _patientDisease = TextEditingController();

  var _patientLastVisit = TextEditingController();

  var _sex = List<DropdownMenuItem>();

  DateTime _date = DateTime.now();
  @override
  void initState() {
    super.initState();
    _loadPatients();
  }

  var _selectedValue;
  _loadPatients() async {
    var _patientService = PatientService();
    var patients = await _patientService.getPatients();
    patients.forEach((patient) {
      setState(() {
        _sex.add(DropdownMenuItem(
          child: Text(patient['name']),
          value: patient['name'],
        ));
      });
    });
  }

  _selectDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2099));

    if (_pickedDate != null) {
      setState(() {
        _date = _pickedDate;
        _patientLastVisit.text = DateFormat('yyyy-MM-dd').format(_pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Patients'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _patientName,
            decoration: InputDecoration(
                hintText: 'Enter Patient Name', labelText: 'Name'),
          ),
          TextField(
            controller: _patientDisease,
            decoration: InputDecoration(
                hintText: "Enter Patient's Disease", labelText: 'Disease'),
          ),
          TextField(
            controller: _patientLastVisit,
            decoration: InputDecoration(
                hintText: 'YY-MM-DD ',
                labelText: 'Date',
                prefixIcon: InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Icon(Icons.calendar_today))),
          ),
          DropdownButtonFormField(
            items: _sex,
            onChanged: (value) {
              setState(() {
                _selectedValue = value;
              });
            },
            value: _selectedValue,
            hint: Text('Sex'),
          )
        ],
      ),
    );
  }
}
