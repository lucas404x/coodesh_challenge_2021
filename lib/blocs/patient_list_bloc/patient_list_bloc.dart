import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_inc_app/data/models/patient_model.dart';

import '../../data/interfaces/patient_repository_interface.dart';

part 'patient_list_event.dart';
part 'patient_list_state.dart';

class PatientListBloc extends Bloc<PatientListEvent, PatientListState> {
  final IPatientRepository _patientRepository;

  final List<PatientModel> _patients = List.empty(growable: true);
  List<PatientModel> get patients => _patients;

  PatientListBloc(this._patientRepository) : super(PatientListInitialState()) {
    on<PatientListLoadEvent>(_loadList);
    on<PatientListExtendEvent>(_extendList);
  }

  _loadList(PatientListEvent event, Emitter<PatientListState> emitter) async {
    emitter(PatientListLoadingState());
    try {
      _patients.addAll(await _fetchPatients());
      emitter(PatientListLoadedState());
    } catch (e) {
      emitter(PatientListErrorState(e.toString()));
    }
  }

  _extendList(PatientListEvent event, Emitter<PatientListState> emitter) async {
    try {
      _patients.addAll(await _fetchPatients());
      emitter(PatientListLoadedState());
    } catch (e) {
      emitter(PatientListErrorState(e.toString()));
    }
  }

  Future<List<PatientModel>> _fetchPatients() async {
    return await _patientRepository.getPatients(50);
  }
}
