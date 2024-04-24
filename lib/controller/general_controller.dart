import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralController extends GetxController {
  static GeneralController get to => Get.find(); // add this

  RxBool isLoading = true.obs;
  RxBool isConnected = false.obs;
  RxString user_type = "".obs;
  SharedPreferences? preferences;
}
