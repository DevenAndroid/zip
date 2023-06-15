import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zip/screens/birthday_screen.dart';
import 'package:zip/screens/country_page.dart';
import 'package:zip/screens/dashboard_screen.dart';
import 'package:zip/screens/enterMobileno.dart';
import 'package:zip/screens/enter_email.dart';
import 'package:zip/screens/exchange_screen.dart';
import 'package:zip/screens/onboarding.dart';
import 'package:zip/screens/otp_screen.dart';
import 'package:zip/screens/otpemail.dart';
import 'package:zip/screens/otpmobile.dart';
import 'package:zip/screens/regestration_address.dart';
import 'package:zip/screens/regestration_extra_details.dart';
import 'package:zip/screens/regestration_selectable.dart';
import 'package:zip/screens/resgestration_name.dart';
import 'package:zip/screens/transaction1_page.dart';
import 'package:zip/screens/transaction_history.dart';
import 'package:zip/screens/zipTag)_screen.dart';

import '../splash1.dart';

class MyRouters{
  static var splash = "/splash";
  static var oBScreen = "/oBScreen";
  static var dashBoard = "/dashBoard";
  static var enterEmailScreen = "/enterEmailScreen";
  static var mobileNumber = "/mobileNumber";
  static var mobileOtpScreen = "/mobileOtpScreen";
  static var otpEmailScreen = "/otpEmailScreen";
  static var selectableScreen = "/selectableScreen";
  static var userScreen = "/userScreen";
  static var birthdayScreen = "/birthdayScreen";
  static var tagScreen = "/tagScreen";
  static var addressScreen = "/addressScreen";
  static var extraDetailsScreen = "/extraDetailsScreen";
  static var countryScreen = "/countryScreen";
  static var otpScreen = "/otpScreen";
  static var transactionsFirst = "/transactionsFirst";
  static var transactionsHistory = "/transactionsHistory";
  static var exchangeMoney = "/exchangeMoney";

  static var route = [
    GetPage(name: '/', page: () =>  const Splash()),
  GetPage(name: '/oBScreen', page: () =>  const OBScreen()),
  GetPage(name: '/dashBoard', page: () =>  const DashBoard()),
  GetPage(name: '/enterEmailScreen', page: () =>  const EmailScreen()),
  GetPage(name: '/mobileNumber', page: () =>  const MobileNumberScreen()),
  GetPage(name: '/mobileOtpScreen', page: () =>  const MobileOtpScreen()),
  GetPage(name: '/otpEmailScreen', page: () =>  const EmailOtpScreen()),
    GetPage(name: '/selectableScreen', page: () =>  const SelectableScreen()),
    GetPage(name: '/userScreen', page: () =>   const UserScreen()),
    GetPage(name: '/birthdayScreen', page: () =>   const BirthdayScreen()),
    GetPage(name: '/tagScreen', page: () =>   const TagScreen()),
    GetPage(name: '/addressScreen', page: () =>   const AddressScreen()),
    GetPage(name: '/extraDetailsScreen', page: () =>   const ExtraDetailsScreen()),
    GetPage(name: '/countryScreen', page: () =>   const CountryScreen()),
    GetPage(name: '/otpScreen', page: () =>   const OtpScreen()),
    GetPage(name: '/transactionsFirst', page: () =>   const TransactionsFirst()),
    GetPage(name: '/transactionsHistory', page: () =>   const TransactionsHistory()),
    GetPage(name: '/exchangeMoney', page: () =>   const ExchangeMoney()),
  ];
}