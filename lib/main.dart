import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma_inc_app/utils/color_utils.dart';
import 'data/repositories/patient_repository.dart';
import 'pages/home_page.dart';
import 'package:pharma_inc_app/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primarySwatch = ColorUtils.createMaterialColor(AppColors.aqua);

    return RepositoryProvider(
        create: (context) => PatientRepository(Client()),
        child: MaterialApp(
          title: 'Pharma Inc',
          theme: ThemeData(
              primarySwatch: primarySwatch,
              colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch)
                  .copyWith(secondary: AppColors.deepBlue),
              textTheme: GoogleFonts.nunitoTextTheme()),
          home: const HomePage(),
          scrollBehavior: const ScrollBehavior(
              androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
        ));
  }
}
