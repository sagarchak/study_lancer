import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_connect/http/src/response/response.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:study_lancer/controller/general_controller.dart';
import 'package:study_lancer/enum/http.dart';
import 'package:study_lancer/utils/app_constants.dart';

import 'package:study_lancer/utils/common_utils.dart';

class CommonHttpClient {
  Map<String, String> headers = <String, String>{};
  Map<String, String>? body = <String, String>{};
  String url = '';
  HttpMethod method = HttpMethod.Post;
  bool showLoading = false;
  int repeatCount = 0;

  CommonHttpClient(this.url, {this.body, this.method = HttpMethod.Post, this.showLoading = false});

  initHeaders() async {
    String? accessToken = await CommonUtils().getToken(bearer);

    if (accessToken != null && accessToken.isNotEmpty) {
      accessToken;
      headers = {'Accept': 'application/json', 'Authorization': "Bearer ${accessToken.substring(4)}"};
    }
  }

  initBody() {
    body ??= <String, String>{};
  }

  showProgressDialog() {
    GeneralController.to.isLoading.value = true;
    if (showLoading) {
      Get.dialog(
        CircularProgressIndicator(),
        barrierDismissible: false,
      );
    }
  }

  Future<http.Response?> getResponse({
    List<String>? imagePathList,
  }) async {
    http.Response? response;
    if (await CommonUtils.checkInternet() == true) {
      //API Request TimeoutStream

      await initHeaders();
      initBody();
      if (CommonUtils.checkIfNotNull(url) && body != null) {
        showProgressDialog();
        try {
          if (kDebugMode) {
            debugPrint('Request Headers: $headers');
            debugPrint('Request Body: $body');
            debugPrint('Request URL: $url');
          }
          switch (method) {
            case HttpMethod.Get:
              var request = MultipartRequest(HttpMethod.Get.name.toUpperCase(), Uri.parse(url));
              request.headers.addAll(headers);

              response = await http.Response.fromStream(await request.send().catchError((err) => print(err.toString())));
              break;

            default:
              var request = MultipartRequest(HttpMethod.Post.name.toUpperCase(), Uri.parse(url));
              if (body != null) {
                request.fields.addAll(body!);
              }
              request.headers.addAll(headers);

              response = await http.Response.fromStream(await request.send().catchError((err) => print(err.toString())));

              break;
          }

          if (response?.statusCode == 401) {
            //todo logout
          }
          if (kDebugMode) {
            debugPrint('ImagesPaths: ${imagePathList != null ? imagePathList.length.toString() : '0'}');

            debugPrint('Headers: $headers');
            debugPrint('Body: $body');
            debugPrint('URL: $url');
            debugPrint('Response Code: ${response?.statusCode}');
          }
        } catch (e) {}
      }

      return response;
    } else {
      CommonUtils.commonToast();
    }
  }
}
