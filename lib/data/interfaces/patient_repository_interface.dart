import '../models/patient_model.dart';

abstract class IPatientRepository {
  Future<PatientModel> getPatientById(String id);
  Future<List<PatientModel>> getPatients(int quantity);
}
