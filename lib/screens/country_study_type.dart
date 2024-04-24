import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'package:study_lancer/controller/country_code_controller.dart';
import 'package:study_lancer/controller/login_controller.dart';
import 'package:study_lancer/controller/otp_controller.dart';
import 'package:study_lancer/screens/home_screen.dart';
import 'package:study_lancer/utils/app_constants.dart';
import 'package:study_lancer/utils/colors.dart';
import 'package:study_lancer/utils/style.dart';

class CountryStudyTypeScreen extends StatelessWidget {
  CountryStudyTypeScreen();

  List<String> countries = [
    "https://studylancer-bucket.blr1.cdn.digitaloceanspaces.com/system/canada.png",
    "https://studylancer-bucket.blr1.cdn.digitaloceanspaces.com/system/australia.png"
  ];

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
              SizedBox(
                height: Get.height * 0.45,
                width: Get.width * 0.9,
                child: GridView.builder(
                    itemCount: countries.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (ctx, index) {
                      return GridTile(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                countries[index],
                                fit: BoxFit.contain,
                                height: Get.height * 0.13,
                                width: Get.width * 0.23,
                                color: Colors.grey,
                                colorBlendMode: BlendMode.saturation,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Australia",
                              textScaleFactor: 1,
                              textAlign: TextAlign.center,
                              style: StyleManager.regularWaitingTextStyle,
                            ),
                          )
                        ],
                      ));
                    }),
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
                        onPressed: () {
                          Get.offAll(HomeScreen());
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: cardGradientcolor2,
                            backgroundColor: cardGradientcolor2,
                            minimumSize: const Size(230, 68),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: const BorderSide(color: cardGradientcolor2, width: 10, strokeAlign: BorderSide.strokeAlignInside))),
                        child: Text(proceed, textScaleFactor: 1, style: StyleManager.regularEnableButtonTextStyle),
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
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
