import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:study_lancer/controller/general_controller.dart';

import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/style.dart';

class CommonUtils {
  late SharedPreferences preferences;
  saveToken(String token) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString(bearer, token);
  }

  getToken(String key) async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getString(bearer);
  }

  static bool checkIfNotNull(String? value) {
    return value != null && value.trim().isNotEmpty && value.trim() != 'null' && value.trim() != "";
  }

  static commonToast() {
    Get.showSnackbar(
      GetSnackBar(
        borderRadius: 25,
        titleText: Text(
          'No Internet',
          style: StyleManager.boldCommonTextStyle,
        ),
        messageText: Text(
          NO_INTERNET,
          style: StyleManager.extraLightTextStyle,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static successToast(String title, String data) {
    Get.showSnackbar(
      GetSnackBar(
        borderRadius: 25,
        titleText: Text(
          title,
          style: StyleManager.boldSuccessTextStyle,
        ),
        messageText: Text(
          data,
          style: StyleManager.extraLightTextStyle,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static failureToast(String title, String data) {
    Get.showSnackbar(
      GetSnackBar(
        borderRadius: 25,
        titleText: Text(
          title,
          style: StyleManager.boldFailureTextStyle,
        ),
        messageText: Text(
          data,
          style: StyleManager.extraLightTextStyle,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static Future<bool> checkInternet() async {
    GeneralController.to.isConnected.value = false;
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.first == ConnectivityResult.mobile || connectivityResult.first == ConnectivityResult.wifi) {
      GeneralController.to.isConnected.value = true;
      return true;
    }
    return false;
  }
}
