
import 'package:get/get.dart';
import 'package:zip/screens/add_card.dart';
import 'package:zip/screens/addapayer.dart';
import 'package:zip/screens/buyservices.dart';
import 'package:zip/screens/enterMobileno.dart';
import 'package:zip/screens/enter_email.dart';
import 'package:zip/screens/generatepaymentlink.dart';
import 'package:zip/screens/mycard.dart';
import 'package:zip/screens/otpemail.dart';
import 'package:zip/screens/otpmobile.dart';
import 'package:zip/screens/paybillsservices.dart';
import 'package:zip/screens/request_payment.dart';
import 'package:zip/screens/requestapayment.dart';
import 'package:zip/screens/requestapaymentconfirm.dart';
import 'package:zip/screens/requestapaymentcontinue.dart';
import 'package:zip/screens/setting.dart';
import 'package:zip/screens/sharepaymentlink.dart';
import 'package:zip/screens/transfer_limit.dart';
import 'package:zip/screens/wallet_screen.dart';

import '../screens/onboarding.dart';
import '../screens/profile_screen.dart';
import '../splash1.dart';

class MyRouters{
  static var splash = "/splash";
  static var oBScreen = "/oBScreen";
  static var mobileNumber = "/mobileNumber";
  static var enterEmailScreen = "/enterEmailScreen";
  static var otpEmailScreen = "/otpEmailScreen";
  static var mobileOtpScreen = "/mobileOtpScreen";
  static var walletScreen = "/walletScreen";
  static var addCard = "/addCard";
  static var myCard = "/myCard";
  static var buyServices = "/buyServices";
  static var payBillsServices = "/payBillsServices";
  static var profile = "/profile";
  static var setting = "/setting";
  static var transferLimit = "/transferLimit";
  static var requestPayment = "/requestPayment";
  static var addAPayer = "/addAPayer";
  static var requestAPayment = "/requestAPayment";
  static var requestAPaymentConfirm = "/requestAPaymentConfirm";
  static var route = [
    GetPage(name: '/', page: () =>   const GeneratePaymentLink()),

  GetPage(name: '/oBScreen', page: () =>  const OBScreen()),
  GetPage(name: '/mobileNumber', page: () =>  const MobileNumberScreen()),
  GetPage(name: '/enterEmailScreen', page: () =>   const EmailScreen()),
  GetPage(name: '/otpEmailScreen', page: () =>   const EmailOtpScreen()),
  GetPage(name: '/mobileOtpScreen', page: () =>   const MobileOtpScreen()),
    GetPage(name: "/walletScreen", page: ()=>  WalletScreen()),
    GetPage(name: "/addCard", page: ()=>  AddCard()),
    GetPage(name: "/myCard", page: ()=>  MyCard()),
    GetPage(name: "/buyServices", page: ()=>  BuyServices()),
    GetPage(name: "/payBillsServices", page: ()=>  const PayBillsServices()),
    GetPage(name: "/profile", page: ()=>  const ProfileScreen()),
    GetPage(name: "/setting", page: ()=>  const Setting()),
    GetPage(name: "/requestPayment", page: ()=>  const RequestPayment()),
    GetPage(name: "/addAPayer", page: ()=>  const AddAPayer()),
    GetPage(name: "/requestAPaymentConfirm", page: ()=>  const RequestApaymentConfirm()),



  ];
}