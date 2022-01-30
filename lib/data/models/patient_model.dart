import '../../utils/date_time_utils.dart';

class PatientModel {
  final String id;
  final String email;
  final String photo;
  final String gender;
  final String address;
  final String fullname;
  final String phoneNumber;
  final String nationality;
  final String dateBirthday;

  PatientModel({
    required this.id,
    required this.email,
    required this.photo,
    required this.gender,
    required this.address,
    required this.fullname,
    required this.phoneNumber,
    required this.nationality,
    required this.dateBirthday,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'photo': photo,
      'gender': gender,
      'address': address,
      'fullname': fullname,
      'phoneNumber': phoneNumber,
      'nationality': nationality,
      'dateBirthday': dateBirthday,
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    String gender = map['gender'];
    Map<String, dynamic> id = map['id'];
    Map<String, dynamic> name = map['name'];
    Map<String, dynamic> location = map['location'];
    DateTime dateBirthday = DateTime.parse(map['dob']['date']).toLocal();

    return PatientModel(
      id: '${id['name']} - ${id['value']}',
      email: map['email'],
      photo: map['picture']['medium'],
      gender: gender.replaceFirst(gender[0], gender[0].toUpperCase()),
      nationality: map['nat'],
      phoneNumber: map['cell'],
      address:
          '${location['street']['name']}, ${location['street']['number']} - ${location['postcode']}',
      fullname: '${name['title']} ${name['first']} ${name['last']}',
      dateBirthday: DateTimeUtils.formatDateToLocalString(dateBirthday),
    );
  }
}
