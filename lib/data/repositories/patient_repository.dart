import 'dart:convert';
import 'dart:io';

import '../../utils/serialize_utils.dart';
import '../interfaces/patient_repository_interface.dart';

class PatientRepository implements IPatientRepository {
  final HttpClient _client;

  PatientRepository(this._client);

  @override
  Future<Map<String, dynamic>> getPatientById(String id) {
    // TODO: implement getPatientById
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getPatients(int quantity) async {
    final url = Uri.parse('https://randomuser.me/api/?results=$quantity');

    try {
      final content = await _makeRequest(url);
      List results = jsonDecode(content)["results"];
      return results
          .map((json) => SerializeUtils.mapPatientProperties(json))
          .toList()
          .cast<Map<String, dynamic>>();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _makeRequest(Uri url) async {
    final request = await _client.getUrl(url);
    final response = await request.close();

    if (response.statusCode == 200) {
      final content = await response.transform(utf8.decoder).join();
      return content;
    } else {
      throw HttpException(response.reasonPhrase);
    }
  }
}
