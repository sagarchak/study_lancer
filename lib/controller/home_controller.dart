import 'dart:convert';

import 'package:get/get.dart';
import 'package:study_lancer/api/common_http_client.dart';
import 'package:study_lancer/api/url.dart';
import 'package:study_lancer/enum/http.dart';
import 'package:study_lancer/screens/start_up_screen.dart';
import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/common_utils.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  callApiLogout() async {
    final response = await CommonHttpClient(
      apiLogout,
      method: HttpMethod.Post,
    ).getResponse();
    if (response != null && response.statusCode == 200) {
      var resBody = response.body;
      if (CommonUtils.checkIfNotNull(resBody)) {
        Map<String, dynamic> resMap = jsonDecode(resBody);
        var data = resMap["data"];
        if (resMap != null && data != null) {
          CommonUtils.successToast(logout, resMap["message"] ?? "");
          CommonUtils().saveToken("");
          Get.offAll(const StartUp());
        }
      }
    } else {
      CommonUtils.successToast("$logout Failed", something_went_wrong);
    }
  }

  callApiDelete() async {
    final response = await CommonHttpClient(
      apiDelete,
      method: HttpMethod.Post,
    ).getResponse();
    if (response != null && response.statusCode == 200) {
      var resBody = response.body;
      if (CommonUtils.checkIfNotNull(resBody)) {
        Map<String, dynamic> resMap = jsonDecode(resBody);
        var data = resMap["data"];
        if (resMap != null && data != null) {
          CommonUtils.successToast(delete_user, resMap["message"] ?? "");
          CommonUtils().saveToken("");
          Get.offAll(const StartUp());
        }
      }
    } else {
      CommonUtils.successToast("$delete_user Failed", something_went_wrong);
    }
  }
}
