import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'package:study_lancer/controller/country_code_controller.dart';
import 'package:study_lancer/controller/login_controller.dart';
import 'package:study_lancer/controller/otp_controller.dart';
import 'package:study_lancer/entity/otp_entity.dart';
import 'package:study_lancer/screens/country_study_type.dart';
import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/colors.dart';
import 'package:study_lancer/utils/style.dart';

class OTPScreen extends StatelessWidget {
  String phone;
  OTPScreen(this.phone, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 5, right: 20),
        child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(
              back,
              fit: BoxFit.fill,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SizedBox(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Text(
                verify_number,
                textScaleFactor: 1,
                style: StyleManager.regularWithLargeFontTextStyle,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: Get.width * 0.6,
                child: Text(
                  otpDescription,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  textScaleFactor: 1,
                  style: StyleManager.regularWithHighlightColor,
                ),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [cardGradientcolor1, cardGradientcolor2])),
                height: Get.height * 0.01,
                width: double.maxFinite,
                margin: EdgeInsets.zero,
              ),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Pinput(
                    errorPinTheme: PinTheme(decoration: BoxDecoration(border: Border.all(color: borderTextFeild))),
                    controller: OTPController.to.otpontroller,
                    length: 4,
                    onChanged: (value) {
                      OTPController.to.controlButton(value);
                    },
                    defaultPinTheme: PinTheme(
                        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: borderTextFeild))),
                        width: Get.width * 0.09,
                        height: Get.height * 0.035,
                        textStyle: StyleManager.regularPinTextStyle),
                  )),
              const Spacer(
                flex: 1,
              ),
              Obx(
                () => Center(
                  child: Text(
                    OTPController.to.errorText.value,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    textScaleFactor: 1,
                    style: StyleManager.regularErrorTextStyle,
                  ),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  otpNotReceive,
                  textScaleFactor: 1,
                  style: StyleManager.regularWithBlackColor,
                ),
              ),
              Obx(
                () => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: OTPController.to.isResend.isTrue
                        ? TextButton(
                            onPressed: () {
                              OTPController.to.startCode();
                              OTPController.to.callApiResend(phone);
                            },
                            child: Text(
                              resend_OTP,
                              textScaleFactor: 1,
                              style: StyleManager.semiBoldResendTextStyle,
                            ))
                        : RichText(
                            text: TextSpan(children: [
                            TextSpan(text: resending, style: StyleManager.regularWaitingTextStyle),
                            TextSpan(text: OTPController.to.secondsRemaining.value.toString(), style: StyleManager.regularPinTextStyle),
                            TextSpan(text: seconds, style: StyleManager.regularPinTextStyle)
                          ]))),
              ),
              const Spacer(
                flex: 1,
              ),
              Obx(() => InkWell(
                    highlightColor: cardcolor,
                    splashColor: cardcolor,
                    radius: 100,
                    onTap: OTPController.to.isButtonEnable.isTrue
                        ? () {
                            OTPController.to.callVerifyOTPApi(OTPEntity(phone, OTPController.to.otpontroller.text));
                          }
                        : null,
                    child: Container(
                      alignment: Alignment.center,
                      height: 59,
                      width: 192,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: OTPController.to.isButtonEnable.isTrue ? buttonBorderColor : buttonBorderDisableColor,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside),
                        color: cardcolor,
                        borderRadius: BorderRadius.circular(100),
                        gradient: const LinearGradient(
                            colors: [buttonGradientColor1, buttonGradientColor2], begin: Alignment.center, end: Alignment.center),
                        boxShadow: [
                          BoxShadow(
                              color: OTPController.to.isButtonEnable.isTrue ? shadowcolor1 : shadowcolor2,
                              blurRadius: 12,
                              spreadRadius: 0,
                              offset: Offset(6, 6)),
                          BoxShadow(
                              color: OTPController.to.isButtonEnable.isTrue ? shadowcolor2 : shadowcolor1,
                              blurRadius: 12,
                              spreadRadius: 0,
                              offset: Offset(-6, -6))
                        ],
                      ),
                      child: Text(
                        verify,
                        textScaleFactor: 1,
                        style: OTPController.to.isButtonEnable.isTrue
                            ? StyleManager.regularEnableButtonTextStyle
                            : StyleManager.regularDisableButtonTextStyle,
                      ),
                    ),
                  )),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
