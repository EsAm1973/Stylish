
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String montserratFontFamily = 'Montserrat';
const String poppinsFontFamily = 'Poppins';
const String libreCaslonTextFontFamily = 'Libre Caslon Text';
const String plusJakartaSansFontFamily = 'Plus Jakarta Sans';
const String robotoFontFamily = 'Roboto';

abstract class AppTextStyles {
  // from: Get Started
  static TextStyle bold36 = TextStyle(
    fontSize: 36.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w700,
    height: 1.19.h,
  );

  // from: Splash screen
  static TextStyle extraBold24 = TextStyle(
    fontSize: 24.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w800,
    height: 1.22.h,
  );

  // from: Get Started
  static TextStyle bold23 = TextStyle(
    fontSize: 23.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w600,
    height: 1.22.h,
  );

  // from: Sucessfully
  static TextStyle bold22 = TextStyle(
    fontSize: 22.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w700,
    height: 1.00.h,
  );

  // from: Sucessfully
  static TextStyle bold21 = TextStyle(
    fontSize: 21.sp,
    fontFamily: poppinsFontFamily,
    fontWeight: FontWeight.w600,
    height: 0.76.h,
  );

  // from: Home page
  static TextStyle semiBold20 = TextStyle(
    fontSize: 20.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w500,
    height: 1.10.h,
  );

  // from: Home page
  static TextStyle bold18 = TextStyle(
    fontSize: 18.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w600,
    height: 1.22.h,
  );

  // from: Splash screen
  static TextStyle bold18_2 = TextStyle(
    fontSize: 18.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w600,
    height: 1.22.h,
  );

  // from: Home page
  static TextStyle extraBold18 = TextStyle(
    fontSize: 18.sp,
    fontFamily: libreCaslonTextFontFamily,
    fontWeight: FontWeight.w700,
    height: 1.22.h,
  );

  // from: Sucessfully
  static TextStyle semiBold18 = TextStyle(
    fontSize: 18.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w500,
    height: 1.50.h,
  );

  // from: Checkout
  static TextStyle semiBold17 = TextStyle(
    fontSize: 17.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w500,
    height: 1.22.h,
  );

  // from: Home page
  static TextStyle semiBold16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w500,
    height: 1.25.h,
  );

  // from: Sucessfully
  static TextStyle bold16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w600,
    height: 1.22.h,
  );

  // from: Profile
  static TextStyle bold16_2 = TextStyle(
    fontSize: 16.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w600,
    height: 0.88.h,
  );

  // from: Checkout
  static TextStyle regular16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w400,
    height: 1.22.h,
  );

  // from: Get Started
  static TextStyle w100_15 = TextStyle(
    fontSize: 15.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w100,
    height: 1.17.h,
  );

  // from: Sucessfully
  static TextStyle semiBold15 = TextStyle(
    fontSize: 15.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w500,
    height: 1.93.h,
  );

  // from: Get Started
  static TextStyle semiBold15_2 = TextStyle(
    fontSize: 15.sp,
    fontFamily: poppinsFontFamily,
    fontWeight: FontWeight.w500,
    height: 1.33.h,
  );

  // from: Profile
  static TextStyle bold15 = TextStyle(
    fontSize: 15.sp,
    fontFamily: plusJakartaSansFontFamily,
    fontWeight: FontWeight.w600,
    height: 1.60.h,
  );

  // from: Get Started
  static TextStyle regular14 = TextStyle(
    fontSize: 14.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w400,
    height: 1.54.h,
  );

  // from: Shop page
  static TextStyle bold14 = TextStyle(
    fontSize: 14.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w600,
    height: 1.14.h,
  );

  // from: Profile
  static TextStyle bold14_2 = TextStyle(
    fontSize: 14.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w600,
    height: 1.22.h,
  );

  // from: Shop page
  static TextStyle semiBold14 = TextStyle(
    fontSize: 14.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w500,
    height: 1.14.h,
  );

  // from: Home page
  static TextStyle regular14_2 = TextStyle(
    fontSize: 14.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w400,
    height: 1.43.h,
  );

  // from: Splash screen
  static TextStyle regular14_3 = TextStyle(
    fontSize: 14.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w600,
    height: 1.71.h,
  );

  // from: Checkout
  static TextStyle regular14_4 = TextStyle(
    fontSize: 14.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w400,
    height: 1.22.h,
  );

  // from: Sign Up
  static TextStyle regular14_5 = TextStyle(
    fontFamily: poppinsFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    height: 1.50.h,
  );

  // from: Profile
  static TextStyle semiBold13 = TextStyle(
    fontSize: 13.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w600,
    height: 1.69.h,
  );

  // from: Checkout
  static TextStyle regular13 = TextStyle(
    fontSize: 13.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w400,
    height: 1.22.h,
  );

  // from: Home page
  static TextStyle semiBold12 = TextStyle(
    fontSize: 12.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w500,
    height: 1.33.h,
  );

  // from: Profile
  static TextStyle semiBold12_2 = TextStyle(
    fontSize: 12.sp,
    fontFamily: plusJakartaSansFontFamily,
    fontWeight: FontWeight.w500,
    height: 1.26.h,
  );

  // from: Home page
  static TextStyle regular12 = TextStyle(
    fontSize: 12.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w400,
    height: 1.33.h,
  );

  // from: Home page
  static TextStyle w300_12 = TextStyle(
    fontSize: 12.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w300,
    height: 1.33.h,
  );

  // from: Profile
  static TextStyle regular12_2 = TextStyle(
    fontSize: 12.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w400,
    height: 1.22.h,
  );

  // from: Shop page
  static TextStyle bold12 = TextStyle(
    fontSize: 12.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w600,
    height: 1.33.h,
  );

  // from: Home page
  static TextStyle semiBold12_3 = TextStyle(
    fontSize: 12.sp,
    fontFamily: robotoFontFamily,
    fontWeight: FontWeight.w500,
    height: 1.33.h,
  );

  // from: Home page
  static TextStyle regular12_3 = TextStyle(
    fontSize: 12.sp,
    fontFamily: robotoFontFamily,
    fontWeight: FontWeight.w400,
    height: 1.33.h,
  );

  // from: Sign Up
  static TextStyle semiBold12_4 = TextStyle(
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    height: 1.22.h,
  );

  // from: Home page
  static TextStyle regular10 = TextStyle(
    fontSize: 10.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w400,
    height: 1.60.h,
  );

  // from: Shop page
  static TextStyle semiBold10 = TextStyle(
    fontSize: 10.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w500,
    height: 2.20.h,
  );

  // from: Checkout
  static TextStyle semiBold8 = TextStyle(
    fontSize: 8.sp,
    fontFamily: montserratFontFamily,
    fontWeight: FontWeight.w500,
    height: 2.75.h,
  );
}
