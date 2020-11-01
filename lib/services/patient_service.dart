import 'package:flutter_auth/database/repository.dart';
import 'package:flutter_auth/models/patients.dart';

class PatientService {
  Repository _repository;
  PatientService() {
    _repository = Repository();
  }
  savePatient(Patients patient) async {
    return await _repository.save('patients', patient.patientMap());
  }

  getPatients() async {
    return await _repository.getAll('patients');
  }

  getPatientById(patientId) async {
    return await _repository.getById('patients', patientId);
  }

  updatePatient(Patients patient) async {
    return await _repository.update('patients', patient.patientMap());
  }

  deletePatient(patientId) async {
  return await _repository.delete('patients', patientId);
  }
}
