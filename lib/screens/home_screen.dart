import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'package:study_lancer/controller/country_code_controller.dart';
import 'package:study_lancer/controller/login_controller.dart';
import 'package:study_lancer/controller/otp_controller.dart';
import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/colors.dart';
import 'package:study_lancer/utils/style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen();

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
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        spreadRadius: 8,
                        blurRadius: 8,
                        offset: const Offset(-3, -12),
                      )
                    ]),
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            foregroundColor: cardGradientcolor2,
                            backgroundColor: cardGradientcolor2,
                            minimumSize: const Size(230, 68),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: const BorderSide(color: cardGradientcolor2, width: 10, strokeAlign: BorderSide.strokeAlignInside))),
                        child: Text(logout, textScaleFactor: 1, style: StyleManager.regularEnableButtonTextStyle),
                      ),
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        spreadRadius: 8,
                        blurRadius: 8,
                        offset: const Offset(-3, -12),
                      )
                    ]),
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            foregroundColor: cardGradientcolor2,
                            backgroundColor: cardGradientcolor2,
                            minimumSize: const Size(230, 68),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: const BorderSide(color: cardGradientcolor2, width: 10, strokeAlign: BorderSide.strokeAlignInside))),
                        child: Text(delete_user, textScaleFactor: 1, style: StyleManager.regularEnableButtonTextStyle),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
