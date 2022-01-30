import 'package:flutter/material.dart';

import '../../data/models/patient_model.dart';

class PatientModal extends StatelessWidget {
  final PatientModel patient;
  const PatientModal({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SizedBox(
      width: _size.width,
      height: _size.height * .8,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 64),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              color: Colors.white,
              width: _size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 88,
                  ),
                  Center(
                    child: Text(
                      patient.fullname,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Center(
                    child: Text(patient.email,
                        style: Theme.of(context).textTheme.subtitle2),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    patient.address,
                    textAlign: TextAlign.justify,
                  ),
                  Text(patient.nationality),
                  Text(patient.gender),
                  Text(patient.dateBirthday),
                  Text(patient.phoneNumber),
                  Text(patient.id)
                ],
              ),
            ),
          ),
          Align(
            child: CircleAvatar(
              radius: 64,
              backgroundImage: NetworkImage(patient.photo),
              backgroundColor: Colors.transparent,
            ),
            alignment: Alignment.topCenter,
          )
        ],
      ),
    );
  }
}
