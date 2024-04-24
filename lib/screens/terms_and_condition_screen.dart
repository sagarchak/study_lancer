import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import 'package:study_lancer/controller/terms_and_condition_controller.dart';
import 'package:study_lancer/entity/terms_and_condition_entity.dart';
import 'package:study_lancer/utils/app_constants.dart';

import 'package:study_lancer/utils/style.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset(
                close,
                fit: BoxFit.fill,
              )),
        ),
        body: StreamBuilder<TermsAndCondtionEntity>(
            stream: TermsAndConditionController.to.callTermsandConditionApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.green),
                );
              }
              if (snapshot.data == null) {
                return const Center(
                  child: Text("Data is not available"),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        book,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: Get.width * 0.06,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(text: snapshot.data?.title ?? "Terms of Service", style: StyleManager.mediumHighlightwithLargeFontTextStyle),
                        const TextSpan(text: "\n"),
                        const TextSpan(text: "\n"),
                        TextSpan(text: "Update ", style: StyleManager.regularWithBlackColor),
                        TextSpan(
                            text: DateFormat("dd-MM-yyyy").format(DateTime.parse(snapshot.data?.updated_at ?? DateTime.now().toString())),
                            style: StyleManager.regularWithBlackColor)
                      ])),
                      SizedBox(
                        width: Get.width * 0.12,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                    height: Get.height * 0.8,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Html(
                            shrinkWrap: true,
                            data: snapshot.data?.content ?? "",
                            style: {
                              'html': Style(textAlign: TextAlign.justify),
                              "body": Style.fromTextStyle(StyleManager.regularWithSmallFontTextStyle),
                              "h1": Style.fromTextStyle(StyleManager.mediumwithHighlightColor)
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }));
  }
}
