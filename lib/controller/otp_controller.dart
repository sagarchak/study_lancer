import 'dart:async';

import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get to => Get.find();
  RxBool isButtonEnable = false.obs;
  RxBool isResend = true.obs;
  RxInt secondsRemaining = 30.obs;
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
}
