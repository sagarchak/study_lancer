import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_lancer/api/common_http_client.dart';
import 'package:study_lancer/api/url.dart';
import 'package:study_lancer/controller/general_controller.dart';
import 'package:study_lancer/controller/otp_controller.dart';
import 'package:study_lancer/entity/country_code_entity.dart';
import 'package:study_lancer/entity/login_entity.dart';
import 'package:study_lancer/enum/http.dart';
import 'package:study_lancer/enum/user_type.dart';
import 'package:study_lancer/screens/otp_screen.dart';
import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/common_utils.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  TextEditingController loginTextController = TextEditingController();
  RxBool isButtonEnable = false.obs;
  RxString errorText = "".obs;

  String? mobileValidator(String? value) {
    RegExp mobileRegExp = RegExp(r'^[0-9]{10}$');
    final isValidMobile = mobileRegExp.hasMatch(value ?? "");
    if (!isValidMobile) {
      errorText.value = "Please enter a valid mobile number";
      isButtonEnable.value = false;
    } else {
      errorText.value = "";
      isButtonEnable.value = true;
    }
  }

  callLoginApi(LoginEntity? body) async {
    if (body != null) {
      final response = await CommonHttpClient(GeneralController.to.user_type.value == UserType.Student.name ? apiStudent : apiAgent,
              method: HttpMethod.Post, body: body.toJson())
          .getResponse();
      if (response != null && response.statusCode == 200) {
        var resBody = response.body;
        if (CommonUtils.checkIfNotNull(resBody)) {
          Map<String, dynamic> resMap = jsonDecode(resBody);

          List data = resMap["data"];
          if (resMap != null && data != null) {
            CommonUtils.successToast("Login Success", login_success_description);
            Get.to(const OTPScreen())?.then((value) {
              OTPController.to.secondsRemaining.value = 30;
              OTPController.to.timer.cancel();
              OTPController.to.isResend.value = true;
            });
          }
        }
      } else {
        CommonUtils.failureToast("Login Failed", something_went_wrong);
      }
    }
  }

  checkInternetForFlag() async {
    if (await CommonUtils.checkInternet() == true) {
      kDebugMode.printInfo(info: "success");
    } else {
      CommonUtils.commonToast();
    }
  }
}
