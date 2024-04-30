import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'package:study_lancer/controller/country_code_controller.dart';
import 'package:study_lancer/controller/country_type_controller.dart';
import 'package:study_lancer/controller/login_controller.dart';
import 'package:study_lancer/controller/otp_controller.dart';
import 'package:study_lancer/entity/country_type_entity.dart';
import 'package:study_lancer/screens/home_screen.dart';
import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/colors.dart';
import 'package:study_lancer/utils/style.dart';

class CountryStudyTypeScreen extends StatefulWidget {
  CountryStudyTypeScreen();

  @override
  State<CountryStudyTypeScreen> createState() => _CountryStudyTypeScreenState();
}

class _CountryStudyTypeScreenState extends State<CountryStudyTypeScreen> {
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
        padding: const EdgeInsets.all(0.0),
        child: SizedBox(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Text(
                select_country,
                textScaleFactor: 1,
                style: StyleManager.regularWithLargeFontTextStyle,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: Get.width * 0.6,
                child: Text(
                  select_country_description,
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
              StreamBuilder<List<CountryTypeEntity>>(
                  stream: CountryTypeController.to.callCountryTypeApi(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return SizedBox(
                        height: Get.height * 0.45,
                        width: Get.width * 0.9,
                        child: const Center(
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    }
                    return SizedBox(
                      height: Get.height * 0.45,
                      width: Get.width * 0.9,
                      child: GridView.builder(
                          itemCount: snapshot.data?.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (ctx, index) {
                            return GridTile(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(
                                  () => InkWell(
                                    onTap: () {
                                      int code = snapshot.data![index].id;
                                      if (code != null) {
                                        CountryTypeController.to.colorCode.value = snapshot.data![index].id;
                                        CountryTypeController.to.isButtonEnable.value = true;
                                      }
                                    },
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16.0),
                                        child: snapshot.data![index].flag.isNotEmpty
                                            ? Image.network(
                                                snapshot.data![index].image,
                                                fit: BoxFit.contain,
                                                height: Get.height * 0.13,
                                                width: Get.width * 0.23,
                                                color: CountryTypeController.to.colorCode.value == snapshot.data![index].id ? null : Colors.grey,
                                                colorBlendMode: BlendMode.saturation,
                                              )
                                            : SizedBox(
                                                height: Get.height * 0.13,
                                                width: Get.width * 0.23,
                                              )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    snapshot.data![index].name ?? "",
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                    style: StyleManager.regularWaitingTextStyle,
                                  ),
                                )
                              ],
                            ));
                          }),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => InkWell(
                      highlightColor: cardcolor,
                      splashColor: cardcolor,
                      radius: 100,
                      onTap: CountryTypeController.to.isButtonEnable.isTrue
                          ? () {
                              CountryTypeController.to.callApiPostCountry();
                            }
                          : null,
                      child: Container(
                        alignment: Alignment.center,
                        height: 59,
                        width: 213,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: CountryTypeController.to.isButtonEnable.isTrue ? buttonBorderColor : buttonBorderDisableColor,
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignInside),
                          color: cardcolor,
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(
                              colors: [buttonGradientColor1, buttonGradientColor2], begin: Alignment.center, end: Alignment.center),
                          boxShadow: [
                            BoxShadow(
                                color: CountryTypeController.to.isButtonEnable.isTrue ? shadowcolor1 : shadowcolor2,
                                blurRadius: 12,
                                spreadRadius: 0,
                                offset: const Offset(6, 6)),
                            BoxShadow(
                                color: CountryTypeController.to.isButtonEnable.isTrue ? shadowcolor2 : shadowcolor1,
                                blurRadius: 12,
                                spreadRadius: 0,
                                offset: const Offset(-6, -6))
                          ],
                        ),
                        child: Text(
                          proceed,
                          textScaleFactor: 1,
                          style: CountryTypeController.to.isButtonEnable.isTrue
                              ? StyleManager.regularEnableButtonTextStyle
                              : StyleManager.regularDisableButtonTextStyle,
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  cannot_see,
                  textScaleFactor: 1,
                  style: StyleManager.regularWithBlackColor,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    consult,
                    textScaleFactor: 1,
                    style: StyleManager.semiBoldResendTextStyle,
                  )),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
