import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/interfaces/patient_repository_interface.dart';
import '../../data/models/patient_list_item_model.dart';
import '../../data/models/patient_model.dart';

part 'patient_list_event.dart';
part 'patient_list_state.dart';

class PatientListBloc extends Bloc<PatientListEvent, PatientListState> {
  final IPatientRepository _patientRepository;

  final List<PatientListItemModel> _patients = List.empty(growable: true);
  List<PatientListItemModel> get patients => _patients;

  PatientListBloc(this._patientRepository) : super(PatientListInitialState()) {
    on<PatientListLoadEvent>(_fetchPatients);
  }

  _fetchPatients(
      PatientListEvent event, Emitter<PatientListState> emitter) async {
    emitter(PatientListLoadingState());

    List<PatientModel> localPatients;

    try {
      localPatients = await _patientRepository.getPatients(50);
    } catch (e) {
      emitter(PatientListErrorState(e.toString()));
      return;
    }

    _patients.addAll(localPatients
        .map((patient) => PatientListItemModel.fromPatientModel(patient)));

    emitter(PatientListLoadedState());
  }
}
