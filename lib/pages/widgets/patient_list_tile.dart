import 'package:flutter/material.dart';

import '../../data/models/patient_list_item_model.dart';

class PatientListTile extends StatelessWidget {
  final PatientListItemModel patient;
  const PatientListTile({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(patient.fullname),
    );
  }
}
