import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_lancer/binding/app_binding.dart';

import 'package:study_lancer/screens/splash_screen.dart';

import 'package:study_lancer/screens/start_up_screen.dart';

import 'package:study_lancer/utils/colors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "Metropolis", scaffoldBackgroundColor: cardcolor),
      debugShowCheckedModeBanner: false,
      title: 'Study Lancer',
      initialBinding: AppBinding(),
      home: SplashScreen(),
    );
  }
}
