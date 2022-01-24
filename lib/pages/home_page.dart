import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/patient_list_bloc/patient_list_bloc.dart';
import '../data/repositories/patient_repository.dart';
import 'widgets/patient_list.dart';
import 'widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _HomeHeader(),
            const SizedBox(height: 32),
            BlocProvider(
              create: (context) =>
                  PatientListBloc(context.read<PatientRepository>()),
              child: _HomeBody(),
            )
          ],
        ),
      )),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('Pharma Inc',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 64),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(child: SearchBar(onChanged: (_) {})),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.filter_list_alt))
          ],
        )
      ],
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientListBloc, PatientListState>(
        builder: (context, state) {
      final bloc = context.read<PatientListBloc>();
      if (state is PatientListInitialState) {
        bloc.add(PatientListLoadEvent());
      }

      if (state is PatientListLoadedState) {
        return Flexible(child: PatientList(patients: bloc.patients));
      }

      if (state is PatientListErrorState) {
        return Center(child: Text(state.message));
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
