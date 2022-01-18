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
    Map<String, dynamic> id = map['id'];
    Map<String, dynamic> name = map['name'];
    Map<String, dynamic> location = map['location'];
    DateTime dateBirthday = DateTime.parse(map['dob']['date']);

    return PatientModel(
      id: '${id['name']} - ${id['value']}',
      email: map['email'],
      photo: map['picture']['medium'],
      gender: map['gender'],
      nationality: map['nat'],
      phoneNumber: map['cell'],
      address:
          '${location['street']['name']}, ${location['street']['number']} - ${location['postcode']}',
      fullname: '${name['title']} ${name['first']} ${name['last']}',
      dateBirthday: dateBirthday.toLocal(),
    );
  }
}
