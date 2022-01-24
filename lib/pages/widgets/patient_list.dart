import 'package:flutter/material.dart';

import '../../data/models/patient_list_item_model.dart';
import 'patient_list_tile.dart';

class PatientList extends StatelessWidget {
  final List<PatientListItemModel> patients;

  const PatientList({Key? key, required this.patients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (_, index) => PatientListTile(patient: patients[index]));
  }
}
