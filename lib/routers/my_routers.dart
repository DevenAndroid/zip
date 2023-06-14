import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zip/screens/dashboard_screen.dart';
import 'package:zip/screens/enterMobileno.dart';
import 'package:zip/screens/enter_email.dart';
import 'package:zip/screens/onboarding.dart';
import 'package:zip/screens/otpemail.dart';
import 'package:zip/screens/otpmobile.dart';

import '../splash1.dart';

class MyRouters{
  static var splash = "/splash";
  static var oBScreen = "/oBScreen";
  static var dashBoard = "/dashBoard";
  static var enterEmailScreen = "/enterEmailScreen";
  static var mobileNumber = "/mobileNumber";
  static var mobileOtpScreen = "/mobileOtpScreen";
  static var otpEmailScreen = "/otpEmailScreen";

  static var route = [
    GetPage(name: '/', page: () =>  const Splash()),
  GetPage(name: '/oBScreen', page: () =>  const OBScreen()),
  GetPage(name: '/dashBoard', page: () =>  const DashBoard()),
  GetPage(name: '/enterEmailScreen', page: () =>  const EmailScreen()),
  GetPage(name: '/mobileNumber', page: () =>  const MobileNumberScreen()),
  GetPage(name: '/mobileOtpScreen', page: () =>  const MobileOtpScreen()),
  GetPage(name: '/otpEmailScreen', page: () =>  const EmailOtpScreen()),

  ];
}