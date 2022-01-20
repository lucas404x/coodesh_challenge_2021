import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/repositories/patient_repository.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => PatientRepository(Client()),
        child: MaterialApp(
          title: 'Pharma Inc',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.nunitoTextTheme()),
          home: const HomePage(),
        ));
  }
}
