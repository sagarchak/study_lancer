import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'package:study_lancer/controller/country_code_controller.dart';
import 'package:study_lancer/controller/login_controller.dart';
import 'package:study_lancer/screens/login_screen.dart';
import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/colors.dart';
import 'package:study_lancer/utils/style.dart';

class CountryCode extends StatelessWidget {
  const CountryCode({super.key});

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: Get.height * 0.28,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  selectedcountrycode,
                  textScaleFactor: 1,
                  style: StyleManager.regularWithLargeFontTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(35, 20, 35, 0),
                    child: Obx(
                      () => TextFormField(
                        readOnly: CountryCodeController.to.countryList.isEmpty ? true : false,
                        style: StyleManager.mediumTextStyle,
                        onChanged: (text) {
                          CountryCodeController.to.onSearchTextChanged(text);
                        },
                        controller: CountryCodeController.to.codeController,
                        decoration: InputDecoration(
                          hintText: search,
                          hintStyle: StyleManager.lightTextStyle,
                          filled: true,
                          fillColor: textFieldTextColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: textFieldTextColor, width: 10.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          prefixIconColor: highlightTextColor,
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Obx(() => CountryCodeController.to.countryList.isEmpty
              ? const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.green),
                  ),
                )
              : Expanded(
                  child: CountryCodeController.to.searchList.isEmpty || CountryCodeController.to.codeController.text.isEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            var list = CountryCodeController.to.countryList;

                            try {
                              return InkWell(
                                onTap: () {
                                  Get.to(LoginScreen(list[index].tel_code, list[index].flag))?.then((value) {
                                    LoginController.to.loginTextController.text = "";
                                    LoginController.to.errorText.value = "";
                                    CountryCodeController.to.countryList.value = [];
                                    CountryCodeController.to.searchList.value = [];
                                    CountryCodeController.to.callCounryCodeApi();
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [cardGradientcolor1, cardGradientcolor2])),
                                  height: Get.height * 0.12,
                                  width: double.maxFinite,
                                  margin: EdgeInsets.zero,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      list[index].flag != null && list[index].flag.isNotEmpty
                                          ? Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: SizedBox(
                                                width: Get.width * 0.09,
                                                height: Get.height * 0.03,
                                                child: SvgPicture.network(
                                                  list[index].flag,
                                                  fit: BoxFit.cover,
                                                  placeholderBuilder: (BuildContext context) {
                                                    return const CircularProgressIndicator(
                                                      color: Colors.green,
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      SizedBox(
                                        width: Get.width * 0.52,
                                        child: Text(
                                          list[index].name ?? "",
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                          textScaleFactor: 1,
                                          style: StyleManager.mediumwithLargeFontTextStyle,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.12,
                                        child: Text(
                                          list[index].tel_code ?? "",
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                          textScaleFactor: 1,
                                          style: StyleManager.mediumWithSmallFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          },
                          itemCount: CountryCodeController.to.countryList.length,
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            var list = CountryCodeController.to.searchList;

                            try {
                              return InkWell(
                                onTap: () {
                                  Get.to(LoginScreen(list[index].tel_code, list[index].flag))?.then((value) {
                                    LoginController.to.loginTextController.text = "";
                                    LoginController.to.errorText.value = "";
                                    CountryCodeController.to.countryList.value = [];
                                    CountryCodeController.to.searchList.value = [];
                                    CountryCodeController.to.callCounryCodeApi();
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [cardGradientcolor1, cardGradientcolor2])),
                                  height: Get.height * 0.12,
                                  width: double.maxFinite,
                                  margin: EdgeInsets.zero,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      list[index].flag != null && list[index].flag.isNotEmpty
                                          ? Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: SizedBox(
                                                  width: Get.width * 0.09,
                                                  height: Get.height * 0.03,
                                                  child: Obx(() => !CountryCodeController.to.checkLoading.value
                                                      ? SvgPicture.network(
                                                          list[index].flag,
                                                          fit: BoxFit.cover,
                                                          placeholderBuilder: (BuildContext context) {
                                                            return const CircularProgressIndicator(
                                                              color: Colors.green,
                                                            );
                                                          },
                                                        )
                                                      : const CircularProgressIndicator(
                                                          color: Colors.green,
                                                        ))),
                                            )
                                          : const SizedBox.shrink(),
                                      SizedBox(
                                        width: Get.width * 0.52,
                                        child: Text(
                                          list[index].name ?? "",
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                          textScaleFactor: 1,
                                          style: StyleManager.mediumwithLargeFontTextStyle,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.12,
                                        child: Text(
                                          list[index].tel_code ?? "",
                                          overflow: TextOverflow.fade,
                                          textScaleFactor: 1,
                                          maxLines: 1,
                                          style: StyleManager.mediumWithSmallFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          },
                          itemCount: CountryCodeController.to.searchList.length,
                        )))
        ],
      ),
    );
  }
}
