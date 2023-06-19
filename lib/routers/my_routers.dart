
import 'package:get/get.dart';
import 'package:zip/screens/accountsinbank.dart';
import 'package:zip/screens/add_card.dart';
import 'package:zip/screens/addapayer.dart';
import 'package:zip/screens/addrecipients.dart';
import 'package:zip/screens/addrecipientstart.dart';
import 'package:zip/screens/buyservices.dart';
import 'package:zip/screens/createrecipients.dart';
import 'package:zip/screens/enterMobileno.dart';
import 'package:zip/screens/enter_email.dart';
import 'package:zip/screens/generatepaymentlink.dart';
import 'package:zip/screens/mycard.dart';
import 'package:zip/screens/otpemail.dart';
import 'package:zip/screens/otpmobile.dart';
import 'package:zip/screens/paybillsservices.dart';
import 'package:zip/screens/paynowbalance.dart';
import 'package:zip/screens/request_payment.dart';
import 'package:zip/screens/requestapayment.dart';
import 'package:zip/screens/requestapaymentconfirm.dart';
import 'package:zip/screens/requestapaymentcontinue.dart';
import 'package:zip/screens/sendcash.dart';
import 'package:zip/screens/sendcashyourbalance.dart';
import 'package:zip/screens/setting.dart';
import 'package:zip/screens/sharepaymentlink.dart';
import 'package:zip/screens/transfer_limit.dart';
import 'package:zip/screens/wallet_screen.dart';
import 'package:zip/screens/yourrecipient.dart';

import '../screens/addfundsinbank.dart';
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
  static var addFundsInBank = "/addFundsInBank";
  static var accountsInBank = "/addFundsInBank";
  static var payNowBalance = "/payNowBalance";
  static var sendCash = "/sendCash";
  static var addRecipients = "/addRecipients";
  static var createRecipients = "/createRecipients";
  static var addRecipientsStart = "/addRecipientsStart";
  static var sendCashYourBalance = "/sendCashYourBalance";
  static var yourRecipient = "/yourRecipient";

  static var route = [
    GetPage(name: '/', page: () =>   const YourRecipient()),

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
    GetPage(name: "/addFundsInBank", page: ()=>  const AddFundsInBank()),
    GetPage(name: "/accountsInBank", page: ()=>  const AccountsInBank()),
    GetPage(name: "/payNowBalance", page: ()=>  const PayNowBalance()),
    GetPage(name: "/sendCash", page: ()=>  const SendCash()),
    GetPage(name: "/addRecipients", page: ()=>  const AddRecipients()),
    GetPage(name: "/createRecipients", page: ()=>  const CreateRecipients()),
    GetPage(name: "/addRecipientsStart", page: ()=>  const AddRecipientStart()),
    GetPage(name: "/sendCashYourBalance", page: ()=>  const SendCashYourBalance()),
    GetPage(name: "/yourRecipient", page: ()=>  const YourRecipient()),

  ];
}