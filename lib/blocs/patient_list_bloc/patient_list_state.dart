part of 'patient_list_bloc.dart';

abstract class PatientListState {}

class PatientListInitialState extends PatientListState {}

class PatientListLoadingState extends PatientListState {}

class PatientListLoadedState extends PatientListState {}

class PatientListErrorState extends PatientListState {
  final String message;

  PatientListErrorState(this.message);
}
