class SerializeUtils {
  static Map<String, dynamic> mapPatientProperties(Map<String, dynamic> json) {
    Map<String, dynamic> name = json['name'];
    Map<String, dynamic> location = json['location'];
    DateTime dateBirthday = DateTime.parse(json['dob']['date']);

    return {
      'id': '',
      'email': json['email'],
      'photo': json['picture']['medium'],
      'gender': json['gender'],
      'nationality': json['nat'],
      'phoneNumber': json['cell'],
      'address':
          '${location['street']['name']}, ${location['street']['number']} - ${location['postcode']}',
      'fullname': '${name['title']} ${name['first']} ${name['last']}',
      'dateBirthday': dateBirthday.toLocal(),
    };
  }
}
