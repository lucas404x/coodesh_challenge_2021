import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors.dart';
import 'pages/splash_page/splash_page.dart';
import 'utils/color_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primarySwatch = ColorUtils.createMaterialColor(AppColors.aqua);

    return MaterialApp(
      title: 'Pharma Inc',
      theme: ThemeData(
          primaryColor: AppColors.aqua,
          primarySwatch: primarySwatch,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch)
              .copyWith(secondary: AppColors.deepBlue),
          textTheme: GoogleFonts.nunitoTextTheme()),
      home: const SplashPage(),
      scrollBehavior: const ScrollBehavior(
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
    );
  }
}
