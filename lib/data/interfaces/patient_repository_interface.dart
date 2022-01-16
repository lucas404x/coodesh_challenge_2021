abstract class IPatientRepository {
  Future<Map<String, dynamic>> getPatientById(String id);
  Future<List<Map<String, dynamic>>> getPatients(int quantity);
}
