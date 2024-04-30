import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'package:study_lancer/controller/country_code_controller.dart';
import 'package:study_lancer/controller/home_controller.dart';
import 'package:study_lancer/controller/login_controller.dart';
import 'package:study_lancer/controller/otp_controller.dart';
import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/colors.dart';
import 'package:study_lancer/utils/style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SizedBox(
          height: Get.height,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  welcome,
                  textScaleFactor: 1,
                  style: StyleManager.regularWithLargeFontTextStyle,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    highlightColor: cardcolor,
                    splashColor: cardcolor,
                    radius: 100,
                    onTap: () {
                      HomeController.to.callApiLogout();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 59,
                      width: 202,
                      decoration: BoxDecoration(
                        border: Border.all(color: buttonBorderColor, width: 2, strokeAlign: BorderSide.strokeAlignInside),
                        color: cardcolor,
                        borderRadius: BorderRadius.circular(100),
                        gradient: const LinearGradient(
                            colors: [buttonGradientColor1, buttonGradientColor2], begin: Alignment.center, end: Alignment.center),
                        boxShadow: const [
                          BoxShadow(color: shadowcolor1, blurRadius: 12, spreadRadius: 0, offset: Offset(6, 6)),
                          BoxShadow(color: shadowcolor2, blurRadius: 12, spreadRadius: 0, offset: Offset(-6, -6))
                        ],
                      ),
                      child: Text(
                        logout,
                        textScaleFactor: 1,
                        style: StyleManager.regularEnableButtonTextStyle,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 25,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    highlightColor: cardcolor,
                    splashColor: cardcolor,
                    radius: 100,
                    onTap: () {
                      HomeController.to.callApiDelete();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 59,
                      width: 242,
                      decoration: BoxDecoration(
                        border: Border.all(color: buttonBorderColor, width: 2, strokeAlign: BorderSide.strokeAlignInside),
                        color: cardcolor,
                        borderRadius: BorderRadius.circular(100),
                        gradient: const LinearGradient(
                            colors: [buttonGradientColor1, buttonGradientColor2], begin: Alignment.center, end: Alignment.center),
                        boxShadow: const [
                          BoxShadow(color: shadowcolor1, blurRadius: 12, spreadRadius: 0, offset: Offset(6, 6)),
                          BoxShadow(color: shadowcolor2, blurRadius: 12, spreadRadius: 0, offset: Offset(-6, -6))
                        ],
                      ),
                      child: Text(
                        delete_user,
                        textScaleFactor: 1,
                        style: StyleManager.regularEnableButtonTextStyle,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
