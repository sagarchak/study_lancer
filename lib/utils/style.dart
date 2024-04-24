import 'package:flutter/material.dart';

import 'package:study_lancer/utils/colors.dart';

class StyleManager {
  //Regular
  static var regularWithLargeFontTextStyle = const TextStyle(
    fontFamily: 'Metropolis',
    color: fontcolorlight,
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  static var regularTextStyle = const TextStyle(fontFamily: 'Metropolis', color: fontcolorlight, fontSize: 14, fontWeight: FontWeight.w400);

  static var regularWithBlackColor = const TextStyle(fontFamily: 'Metropolis', color: dateTextColor, fontSize: 14, fontWeight: FontWeight.w400);
  static var regularWithHighlightColor =
      const TextStyle(fontFamily: 'Metropolis', color: highlightTextColor, fontSize: 14, fontWeight: FontWeight.w400);
  static var regularWithSmallFontTextStyle =
      const TextStyle(fontFamily: 'Metropolis', color: fontcolorlight, fontSize: 12, fontWeight: FontWeight.w400);

  static var regularEnableButtonTextStyle =
      const TextStyle(fontFamily: 'Metropolis', color: getOTPTextColor, fontSize: 18, fontWeight: FontWeight.w400);

  static var regularDisableButtonTextStyle =
      const TextStyle(fontFamily: 'Metropolis', color: getOTPTextColorDisable, fontSize: 18, fontWeight: FontWeight.w400);

  static var regularErrorTextStyle = const TextStyle(fontFamily: 'Metropolis', color: errorColor, fontSize: 14, fontWeight: FontWeight.w400);
  static var regularPinTextStyle = const TextStyle(fontFamily: 'Metropolis', color: highlightTextColor, fontSize: 18, fontWeight: FontWeight.w400);
  static var regularWaitingTextStyle = const TextStyle(fontFamily: 'Metropolis', color: dateTextColor, fontSize: 18, fontWeight: FontWeight.w400);

  //SemiBold
  static var semiBoldTextStyle = const TextStyle(fontFamily: 'Metropolis', color: fontcolorlight, fontSize: 14, fontWeight: FontWeight.w600);
  static var semiBoldResendTextStyle =
      const TextStyle(fontFamily: 'Metropolis', color: highlightTextColor, fontSize: 18, fontWeight: FontWeight.w600);
  static var semiBoldWithHighlightTextStyle =
      const TextStyle(fontFamily: 'Metropolis', color: highlightTextColor, fontSize: 14, fontWeight: FontWeight.w600);
  static var semiboldWithLargeFontTextStyle = const TextStyle(
    fontFamily: 'Metropolis',
    color: fontcolorlight,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  //Mediam
  static var mediumHighlightwithLargeFontTextStyle =
      const TextStyle(fontFamily: 'Metropolis', color: highlightTextColor, fontSize: 18, fontWeight: FontWeight.w500);
  static var mediumTextStyle = const TextStyle(fontFamily: 'Metropolis', color: fontcolorlight, fontSize: 18, fontWeight: FontWeight.w500);
  static var mediumwithLargeFontTextStyle =
      const TextStyle(fontFamily: 'Metropolis', color: fontcolorlight, fontSize: 18, fontWeight: FontWeight.w500);
  static var mediumwithHighlightColor =
      const TextStyle(fontFamily: 'Metropolis', color: highlightTextColor, fontSize: 14, fontWeight: FontWeight.w500);
  static var mediumWithSmallFont = const TextStyle(fontFamily: 'Metropolis', color: fontcolorlight, fontSize: 14, fontWeight: FontWeight.w500);
  static var mediumWthPhoneHint = const TextStyle(fontFamily: 'Metropolis', color: phoneNumberHintColor, fontSize: 18, fontWeight: FontWeight.w500);

  //Bold
  static var boldSuccessTextStyle = const TextStyle(fontFamily: 'Metropolis', color: successToastColor, fontSize: 14, fontWeight: FontWeight.w700);
  static var boldFailureTextStyle = const TextStyle(fontFamily: 'Metropolis', color: faiureToastColor, fontSize: 14, fontWeight: FontWeight.w700);
  static var boldCommonTextStyle = const TextStyle(fontFamily: 'Metropolis', color: commonToastColor, fontSize: 14, fontWeight: FontWeight.w700);

  //Light
  static var lightTextStyle = const TextStyle(fontFamily: 'Metropolis', color: fontcolorlight, fontSize: 18, fontWeight: FontWeight.w400);

  //Extra Light
  static var extraLightTextStyle = const TextStyle(fontFamily: 'Metropolis', color: fontcolorlight, fontSize: 12, fontWeight: FontWeight.w400);
}
