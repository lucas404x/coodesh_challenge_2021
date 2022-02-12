part of 'patient_list_bloc.dart';

abstract class PatientListEvent {}

class PatientListLoadEvent extends PatientListEvent {}

class PatientListExtendEvent extends PatientListEvent {}

class PatientListSearchEvent extends PatientListEvent {
  final String query;

  PatientListSearchEvent({required this.query});
}
