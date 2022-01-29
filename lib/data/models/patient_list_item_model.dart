import '../../utils/date_time_utils.dart';
import 'patient_model.dart';

class PatientListItemModel {
  final String id;
  final String gender;
  final String profile;
  final String fullname;
  final String nationality;
  final String dateBirthday;

  PatientListItemModel({
    required this.id,
    required this.gender,
    required this.profile,
    required this.fullname,
    required this.nationality,
    required this.dateBirthday,
  });

  factory PatientListItemModel.fromPatientModel(PatientModel patient) =>
      PatientListItemModel(
          id: patient.id,
          gender: patient.gender
              .replaceFirst(patient.gender[0], patient.gender[0].toUpperCase()),
          profile: patient.photo,
          fullname: patient.fullname,
          nationality: patient.nationality,
          dateBirthday:
              DateTimeUtils.formatDateToLocalString(patient.dateBirthday));
}
