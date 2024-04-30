import 'package:get/get.dart';
import 'package:study_lancer/controller/country_code_controller.dart';
import 'package:study_lancer/controller/country_type_controller.dart';
import 'package:study_lancer/controller/general_controller.dart';
import 'package:study_lancer/controller/home_controller.dart';
import 'package:study_lancer/controller/login_controller.dart';
import 'package:study_lancer/controller/otp_controller.dart';
import 'package:study_lancer/controller/terms_and_condition_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<GeneralController>(GeneralController(), permanent: true);
    Get.put<TermsAndConditionController>(TermsAndConditionController(), permanent: false);
    Get.put<CountryCodeController>(CountryCodeController(), permanent: true);
    Get.put<LoginController>(LoginController(), permanent: false);
    Get.put<OTPController>(OTPController(), permanent: false);
    Get.put<CountryTypeController>(CountryTypeController(), permanent: false);
    Get.put<HomeController>(HomeController(), permanent: false);
  }
}
