import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:study_lancer/controller/country_code_controller.dart';
import 'package:study_lancer/controller/login_controller.dart';
import 'package:study_lancer/controller/otp_controller.dart';
import 'package:study_lancer/entity/login_entity.dart';
import 'package:study_lancer/screens/otp_screen.dart';
import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/colors.dart';
import 'package:study_lancer/utils/style.dart';

class LoginScreen extends StatelessWidget {
  String telCode;
  String flag;

  LoginScreen(this.telCode, this.flag);

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
                enterphonenumber,
                textScaleFactor: 1,
                style: StyleManager.regularWithLargeFontTextStyle,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: Get.width * 0.6,
                child: Text(
                  enterDigit,
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
              Obx(
                () => Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    style: StyleManager.mediumTextStyle,
                    onChanged: (value) {
                      LoginController.to.mobileValidator(value);
                    },
                    controller: LoginController.to.loginTextController,
                    decoration: InputDecoration(
                      errorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: borderTextFeild)),
                      focusedErrorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: borderTextFeild)),
                      error: Padding(
                        padding: const EdgeInsets.fromLTRB(35, 8, 0, 8),
                        child: Text(
                          LoginController.to.errorText.value,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          textScaleFactor: 1,
                          style: StyleManager.regularErrorTextStyle,
                        ),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 16),
                      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: borderTextFeild)),
                      hintText: mobile_hint,
                      hintStyle: StyleManager.mediumWthPhoneHint,
                      prefixIcon: SizedBox(
                        width: Get.width * 0.35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 28,
                            ),
                            SizedBox(
                                width: Get.width * 0.1,
                                height: Get.height * 0.05,
                                child: flag != null && flag.isNotEmpty
                                    ? SvgPicture.network(flag, theme: SvgTheme(), fit: BoxFit.contain, placeholderBuilder: (BuildContext context) {
                                        LoginController.to.checkInternetForFlag();
                                        return const CircularProgressIndicator(
                                          color: Colors.green,
                                        );
                                      })
                                    : Container(
                                        height: 40,
                                        width: 40,
                                        color: fontcolorlight,
                                      )),
                            const Spacer(),
                            SizedBox(
                              width: Get.width * 0.15,
                              child: Text(
                                telCode ?? "",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.fade,
                                textScaleFactor: 1,
                                maxLines: 1,
                                style: StyleManager.mediumTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              Obx(() => InkWell(
                    highlightColor: cardcolor,
                    splashColor: cardcolor,
                    onTap: LoginController.to.isButtonEnable.isTrue
                        ? () {
                            LoginController.to.callLoginApi(LoginEntity(LoginController.to.loginTextController.text, telCode));
                          }
                        : null,
                    child: Container(
                      alignment: Alignment.center,
                      height: 59,
                      width: 214,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: LoginController.to.isButtonEnable.isTrue ? buttonBorderColor : buttonBorderDisableColor,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside),
                        color: cardcolor,
                        borderRadius: BorderRadius.circular(100),
                        gradient: const LinearGradient(
                            colors: [buttonGradientColor1, buttonGradientColor2], begin: Alignment.center, end: Alignment.center),
                        boxShadow: [
                          BoxShadow(
                              color: LoginController.to.isButtonEnable.isTrue ? shadowcolor1 : shadowcolor2,
                              blurRadius: 12,
                              spreadRadius: 0,
                              offset: Offset(6, 6)),
                          BoxShadow(
                              color: LoginController.to.isButtonEnable.isTrue ? shadowcolor2 : shadowcolor1,
                              blurRadius: 12,
                              spreadRadius: 0,
                              offset: Offset(-6, -6))
                        ],
                      ),
                      child: Text(
                        getOTP,
                        textScaleFactor: 1,
                        style: LoginController.to.isButtonEnable.isTrue
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
