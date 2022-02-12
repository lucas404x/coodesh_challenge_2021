import 'package:flutter/material.dart';

import '../../../data/models/patient_model.dart';

class PatientListTile extends StatelessWidget {
  final PatientModel patient;
  const PatientListTile({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(patient.photo),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Text(patient.fullname),
              const SizedBox(height: 8),
              Text(patient.nationality),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(patient.gender), Text(patient.dateBirthday)],
              )
            ],
          )),
        ],
      ),
    );
  }
}
