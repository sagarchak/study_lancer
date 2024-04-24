import 'dart:convert';

import 'package:get/get.dart';

import 'package:study_lancer/api/common_http_client.dart';
import 'package:study_lancer/api/url.dart';
import 'package:study_lancer/entity/terms_and_condition_entity.dart';
import 'package:study_lancer/enum/http.dart';
import 'package:study_lancer/utils/common_utils.dart';

class TermsAndConditionController extends GetxController {
  static TermsAndConditionController get to => Get.find(); // add this

  Stream<TermsAndCondtionEntity> callTermsandConditionApi() async* {
    final response = await CommonHttpClient(
      apiCondition,
      method: HttpMethod.Get,
    ).getResponse();
    if (response != null && response.statusCode == 200) {
      var resBody = response.body;
      if (CommonUtils.checkIfNotNull(resBody)) {
        Map<String, dynamic> resMap = jsonDecode(resBody);
        if (resMap != null) {
          yield TermsAndCondtionEntity.fromJson(resMap["data"]);
        }
      }
    }
  }
}
