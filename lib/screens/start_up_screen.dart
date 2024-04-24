import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:study_lancer/controller/country_code_controller.dart';
import 'package:study_lancer/controller/general_controller.dart';
import 'package:study_lancer/enum/user_type.dart';
import 'package:study_lancer/screens/country_code_screen.dart';

import 'package:study_lancer/screens/terms_and_condition_screen.dart';
import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/colors.dart';
import 'package:study_lancer/utils/common_utils.dart';
import 'package:study_lancer/utils/style.dart';

class StartUp extends StatelessWidget {
  const StartUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: AlignmentDirectional.bottomStart, children: [
        Image.asset(
          start_up,
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
        Container(
            padding: const EdgeInsets.all(10),
            height: Get.height * 0.36,
            width: Get.width * 8.95,
            decoration:
                const BoxDecoration(color: cardcolor, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Spacer(),
              Text(
                welcomeText,
                style: StyleManager.semiboldWithLargeFontTextStyle,
                textScaleFactor: 1,
                maxLines: 1,
              ),
              Text(
                registerRoleText,
                style: StyleManager.regularTextStyle,
                maxLines: 1,
                textScaleFactor: 1,
              ),
              const Spacer(),
              Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                GestureDetector(
                  onTap: () {
                    CountryCodeController.to.callCounryCodeApi();
                    Get.to(const CountryCode());
                    GeneralController.to.user_type.value = UserType.Student.name;
                  },
                  child: Container(
                    height: Get.height * 0.16,
                    width: Get.width * 0.38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(color: bordercolor, width: 5, strokeAlign: BorderSide.strokeAlignOutside),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 6,
                          blurRadius: 8,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage(student),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    CountryCodeController.to.callCounryCodeApi();
                    Get.to(CountryCode());
                    GeneralController.to.user_type.value = UserType.Agent.name;
                  },
                  child: Container(
                    height: Get.height * 0.16,
                    width: Get.width * 0.38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(color: bordercolor, width: 5, strokeAlign: BorderSide.strokeAlignOutside),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 6,
                          blurRadius: 8,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage(agent),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ]),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    studentText,
                    style: StyleManager.semiBoldTextStyle,
                  ),
                  Text(
                    agentText,
                    style: StyleManager.semiBoldTextStyle,
                  )
                ],
              ),
              const Spacer(),
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: agree, style: StyleManager.regularWithSmallFontTextStyle),
                TextSpan(
                    text: termsAndCondition,
                    style: StyleManager.semiBoldWithHighlightTextStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(const TermsAndCondition());
                      }),
              ]))
            ]))
      ]),
    );
  }
}
