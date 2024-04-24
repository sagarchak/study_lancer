import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:study_lancer/api/common_http_client.dart';
import 'package:study_lancer/api/url.dart';
import 'package:study_lancer/entity/country_code_entity.dart';
import 'package:study_lancer/enum/http.dart';
import 'package:study_lancer/utils/common_utils.dart';

class CountryCodeController extends GetxController {
  static CountryCodeController get to => Get.find();

  final TextEditingController codeController = TextEditingController();
  RxList<CountryCodeEntity> countryList = RxList<CountryCodeEntity>();
  RxList<CountryCodeEntity> searchList = RxList<CountryCodeEntity>();
  callCounryCodeApi() async {
    codeController.text = "";
    searchList.value = [];
    countryList.value = [];
    final response = await CommonHttpClient(
      apiCountryCode,
      method: HttpMethod.Get,
    ).getResponse();
    if (response != null && response.statusCode == 200) {
      var resBody = response.body;
      if (CommonUtils.checkIfNotNull(resBody)) {
        Map<String, dynamic> resMap = jsonDecode(resBody);

        List data = resMap["data"];
        if (resMap != null && data != null) {
          data.map((e) {
            countryList.add(CountryCodeEntity.fromJson(e));
          }).toList();
        }
      }
    }
  }

  onSearchTextChanged(String text) async {
    searchList.clear();
    if (text.isEmpty) {
      return;
    }

    countryList.forEach((countrylist) {
      var count = countrylist.name.split(" ")[0];

      searchList.addIf(count.substring(0).contains(text.trim().capitalizeFirst.toString()), countrylist);
    });
  }
}
