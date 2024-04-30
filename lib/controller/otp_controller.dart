import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_lancer/api/common_http_client.dart';
import 'package:study_lancer/api/url.dart';
import 'package:study_lancer/controller/general_controller.dart';
import 'package:study_lancer/entity/otp_entity.dart';

import 'package:study_lancer/enum/http.dart';
import 'package:study_lancer/screens/country_study_type.dart';
import 'package:study_lancer/utils/app_constants.dart';

import 'package:study_lancer/utils/common_utils.dart';

class OTPController extends GetxController {
  static OTPController get to => Get.find();
  RxBool isButtonEnable = false.obs;
  RxBool isResend = true.obs;
  RxInt secondsRemaining = 30.obs;
  RxString errorText = "".obs;
  TextEditingController otpontroller = TextEditingController();
  Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  startCode() {
    secondsRemaining.value = 30;
    isResend.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining.value != 1) {
        secondsRemaining.value--;
      } else {
        isResend.value = true;
        timer.cancel();
      }
    });
  }

  void controlButton(String value) {
    if (value.length == 4) {
      isButtonEnable.value = true;
    } else {
      isButtonEnable.value = false;
    }
  }

  callVerifyOTPApi(OTPEntity body) async {
    if (body != null) {
      final response = await CommonHttpClient(apiVerify, method: HttpMethod.Post, body: body.toJson()).getResponse();
      if (response != null && response.statusCode == 200) {
        var resBody = response.body;
        if (CommonUtils.checkIfNotNull(resBody)) {
          Map<String, dynamic> resMap = jsonDecode(resBody);

          Map<String, dynamic> data = resMap["data"];
          String accessToken = data["access_token"];

          if (resMap != null && data != null && accessToken.isNotEmpty) {
            CommonUtils().saveToken(accessToken);
            CommonUtils.successToast(loginSuccessTitle, resMap["message"] ?? "");
            secondsRemaining.value = 30;
            timer.cancel();
            isResend.value = true;
            otpontroller.text = "";
            errorText.value = "";
            Get.to(CountryStudyTypeScreen());
          }
        }
      } else {
        CommonUtils.failureToast(loginFailedTitle, something_went_wrong);
        errorText.value = otp_Error_text;
      }
    }
  }

  callApiResend(String phone) async {
    if (phone.isNotEmpty) {
      final response = await CommonHttpClient(apiResend, method: HttpMethod.Post, body: {"phone": phone}).getResponse();
      if (response != null && response.statusCode == 200) {
        var resBody = response.body;
        if (CommonUtils.checkIfNotNull(resBody)) {
          Map<String, dynamic> resMap = jsonDecode(resBody);
          CommonUtils.successToast(resendOTPtitle, resMap["message"] ?? "");
        }
      } else {
        CommonUtils.failureToast(resendOTPFailedTitle, something_went_wrong);
      }
    }
  }
}
