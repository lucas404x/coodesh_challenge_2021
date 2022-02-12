import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../constants/colors.dart';
import '../../data/repositories/patient_repository.dart';
import '../home_page/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: ((context, snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => RepositoryProvider(
                          create: (context) => PatientRepository(Client()),
                          child: const HomePage(),
                        )));
              });
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    backgroundColor: AppColors.deepBlue,
                  ),
                )
              ],
            );
          })),
    );
  }
}
