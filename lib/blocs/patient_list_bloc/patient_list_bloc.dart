import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/interfaces/patient_repository_interface.dart';
import '../../data/models/patient_model.dart';
import 'package:rxdart/rxdart.dart';

part 'patient_list_event.dart';
part 'patient_list_state.dart';

class PatientListBloc extends Bloc<PatientListEvent, PatientListState> {
  static const int _patientsNumber = 50;

  final IPatientRepository _patientRepository;

  final List<PatientModel> _patients = List.empty(growable: true);

  String _lastQuery = '';
  String get lastQuery => _lastQuery;

  PatientListBloc(this._patientRepository) : super(PatientListInitialState()) {
    on<PatientListLoadEvent>(_loadList);
    on<PatientListExtendEvent>(_extendList);
    on<PatientListSearchEvent>(
      _filterListByQuery,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 500))
          .switchMap(mapper),
    );
  }

  _loadList(PatientListEvent event, Emitter<PatientListState> emitter) async {
    emitter(PatientListLoadingState());
    try {
      _patients.addAll(await _fetchPatients());
      emitter(PatientListLoadedState(patients: _patients));
    } catch (e) {
      emitter(PatientListErrorState(e.toString()));
    }
  }

  _extendList(PatientListEvent event, Emitter<PatientListState> emitter) async {
    try {
      _patients.addAll(await _fetchPatients());
      emitter(PatientListLoadedState(patients: _patients));
    } catch (e) {
      emitter(PatientListErrorState(e.toString()));
    }
  }

  Future<List<PatientModel>> _fetchPatients() async {
    return await _patientRepository.getPatients(_patientsNumber);
  }

  _filterListByQuery(
      PatientListSearchEvent event, Emitter<PatientListState> emitter) {
    emitter(PatientListLoadingState());

    String query = event.query.trim();
    _lastQuery = query;
    if (query.isEmpty) {
      emitter(PatientListLoadedState(patients: _patients));
    }

    emitter(PatientListLoadedState(patients: _getListUpdated(query)));
  }

  List<PatientModel> _getListUpdated(String query) {
    return _patients
        .where((patient) =>
            patient.fullname.toUpperCase().contains(query.toUpperCase()))
        .toList();
  }
}
