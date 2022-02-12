import 'package:flutter/material.dart';

import '../../data/models/patient_model.dart';
import 'patient_list_tile.dart';
import 'patient_modal.dart';

class PatientList extends StatelessWidget {
  final List<PatientModel> patients;
  final bool shouldShowLoadingMore;
  final Function onEndList;

  const PatientList(
      {Key? key,
      required this.patients,
      required this.shouldShowLoadingMore,
      required this.onEndList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:
            shouldShowLoadingMore ? patients.length + 1 : patients.length,
        itemBuilder: (_, index) {
          if (index == patients.length && shouldShowLoadingMore) {
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

          return GestureDetector(
            onTap: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) => PatientModal(patient: patients[index])),
            child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: PatientListTile(patient: patients[index])),
          );
        });
  }
}
