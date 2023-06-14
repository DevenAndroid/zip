
import 'package:get/get.dart';
import 'package:zip/screens/enterMobileno.dart';
import 'package:zip/screens/enter_email.dart';
import 'package:zip/screens/otpemail.dart';
import 'package:zip/screens/otpmobile.dart';

import '../screens/onboarding.dart';
import '../splash1.dart';

class MyRouters{
  static var splash = "/splash";
  static var oBScreen = "/oBScreen";
  static var mobileNumber = "/mobileNumber";
  static var enterEmailScreen = "/enterEmailScreen";
  static var otpEmailScreen = "/otpEmailScreen";
  static var mobileOtpScreen = "/mobileOtpScreen";

  static var route = [
    GetPage(name: '/', page: () =>  const Splash()),

  GetPage(name: '/oBScreen', page: () =>  const OBScreen()),
  GetPage(name: '/mobileNumber', page: () =>  const MobileNumberScreen()),
  GetPage(name: '/enterEmailScreen', page: () =>   const EmailScreen()),
  GetPage(name: '/otpEmailScreen', page: () =>   const EmailOtpScreen()),
  GetPage(name: '/mobileOtpScreen', page: () =>   const MobileOtpScreen()),


  ];
}