import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../interfaces/patient_repository_interface.dart';
import '../models/patient_model.dart';

class PatientRepository implements IPatientRepository {
  final Client _client;

  PatientRepository(this._client);

  @override
  Future<PatientModel> getPatientById(String id) {
    // TODO: implement getPatientById
    throw UnimplementedError();
  }

  @override
  Future<List<PatientModel>> getPatients(int quantity) async {
    final url = Uri.parse('https://randomuser.me/api/?results=$quantity');

    try {
      final content = await _makeRequest(url);
      List results = jsonDecode(content)["results"];
      return results
          .map((map) => PatientModel.fromMap(map))
          .toList()
          .cast<PatientModel>();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _makeRequest(Uri url) async {
    try {
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw HttpException(response.body);
      }
    } catch (_) {
      rethrow;
    }
  }
}
