import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:study_lancer/api/common_http_client.dart';
import 'package:study_lancer/api/url.dart';
import 'package:study_lancer/entity/country_type_entity.dart';
import 'package:study_lancer/entity/terms_and_condition_entity.dart';
import 'package:study_lancer/enum/http.dart';
import 'package:study_lancer/screens/home_screen.dart';
import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/common_utils.dart';

class CountryTypeController extends GetxController {
  static CountryTypeController get to => Get.find(); // add this
  RxBool isButtonEnable = false.obs;
  RxInt colorCode = 0.obs;
  Stream<List<CountryTypeEntity>> callCountryTypeApi() async* {
    final response = await CommonHttpClient(
      apiCountryType,
      method: HttpMethod.Get,
    ).getResponse();
    if (response != null && response.statusCode == 200) {
      var resBody = response.body;
      if (CommonUtils.checkIfNotNull(resBody)) {
        Map<String, dynamic> resMap = jsonDecode(resBody);

        var data = resMap["data"];
        List countries = data["countries"];

        if (resMap != null && data != null && countries.isNotEmpty) {
          yield countries.map((e) => CountryTypeEntity.fromJson(e)).toList();
        }
      }
    } else {
      CommonUtils.failureToast(something_went_wrong, "User Already Exist");
    }
  }

  callApiPostCountry() async {
    if (colorCode.value > 0) {
      final response =
          await CommonHttpClient(apiCountryType, method: HttpMethod.Post, body: {"country_id": colorCode.value.toString()}).getResponse();
      if (response != null && response.statusCode == 200) {
        var resBody = response.body;
        if (CommonUtils.checkIfNotNull(resBody)) {
          Map<String, dynamic> resMap = jsonDecode(resBody);
          Get.offAll(HomeScreen());
          CommonUtils.successToast(loginSuccessTitle, resMap["message"] ?? "");
        }
      } else {
        CommonUtils.failureToast(loginFailedTitle, something_went_wrong);
      }
    }
  }
}
