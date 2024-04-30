import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_lancer/controller/general_controller.dart';
import 'package:study_lancer/screens/home_screen.dart';
import 'package:study_lancer/screens/start_up_screen.dart';
import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/common_utils.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getToken() async {
    String? accessToken = await CommonUtils().getToken(bearer);

    if (accessToken != null && accessToken.isNotEmpty) {
      Get.offAll(HomeScreen());
    } else {
      Get.offAll(const StartUp());
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      if (mounted) {
        Future.delayed(const Duration(seconds: 1), () => getToken());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
