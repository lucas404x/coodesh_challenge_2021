class PatientModel {
  final String id;
  final String email;
  final String photo;
  final String gender;
  final String address;
  final String fullname;
  final String phoneNumber;
  final String nationality;
  final DateTime dateBirthday;

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
    return PatientModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      photo: map['photo'] ?? '',
      gender: map['gender'] ?? '',
      address: map['address'] ?? '',
      fullname: map['fullname'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      nationality: map['nationality'] ?? '',
      dateBirthday: map['dateBirthday'],
    );
  }
}
