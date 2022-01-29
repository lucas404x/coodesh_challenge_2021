import 'package:flutter/material.dart';

import '../../data/models/patient_list_item_model.dart';
import 'patient_list_tile.dart';

class PatientList extends StatelessWidget {
  final List<PatientListItemModel> patients;
  final Function onEndList;

  const PatientList({Key? key, required this.patients, required this.onEndList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: patients.length + 1,
        itemBuilder: (_, index) {
          if (index == patients.length) {
            onEndList();
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator()),
                    SizedBox(width: 16),
                    Text("Loading more...")
                  ],
                ));
          }

          return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: PatientListTile(patient: patients[index]));
        });
  }
}
