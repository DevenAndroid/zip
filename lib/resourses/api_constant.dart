import 'dart:io';
import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/common_colour.dart';




class ApiUrls {
  static const String apiBaseUrl = 'https://zipfintech.eoxyslive.com/api/';
  static const String otps = "${apiBaseUrl}otps";
  static const String applyLoan = "${apiBaseUrl}apply-loan";
  static const String verifyOtp = "${apiBaseUrl}otps/";
  static const String chooseBank = "${apiBaseUrl}banks/";
  static const String registerUser = "${apiBaseUrl}register";
  static const String updatePassword = "${apiBaseUrl}update-password";
  static const String SettingApi = "${apiBaseUrl}settings";
  static const String faq = "${apiBaseUrl}faq";
  static const String verificationAfrica = "${apiBaseUrl}verification-africa";
  static const String verifyAfrica = "https://api.verified.africa/sfx-verify/v3/id-service/";
  static const String fetchAccount = "https://sandboxapi.fincra.com/profile/virtual-accounts/";
  static const String beneficiariesCreate  = "https://sandboxapi.fincra.com/profile/beneficiaries/business/";
  static const String payout  = "https://sandboxapi.fincra.com/disbursements/payouts";
  static const String conversion  = "https://sandboxapi.fincra.com/quotes/generate";
  static const String getBeneficiaries  = "https://sandboxapi.fincra.com/profile/beneficiaries/business/";
  static const String userVerifyOtp = "${apiBaseUrl}verify-otp";
  static const String updateDetails = "${apiBaseUrl}update-details";
  static const String verifyAccount = "${apiBaseUrl}virtual-account";
  static const String loginUser = "${apiBaseUrl}login";
  static const String changeZipPin = "${apiBaseUrl}change-zip-pin";
  static const String transfreLimitGet = "${apiBaseUrl}transfer-limit";
  static const String supportCategories = "${apiBaseUrl}support-categories";
  static const String myAddress = "${apiBaseUrl}my-address";
  static const String logout = "${apiBaseUrl}logout";
  static const String deleteAccount = "${apiBaseUrl}delete-account";
  static const String transfreLimitPost = "${apiBaseUrl}transfer-limit";
  static const String verifyPinSecurity = "${apiBaseUrl}verify-pin-security";
  static const String submitQuery = "${apiBaseUrl}submit-query";
  static const String myProfile = "${apiBaseUrl}my-profile";
  static const String updateProfile = "${apiBaseUrl}update-profile";
  static const String updateSetting = "${apiBaseUrl}update-settings";
  static const String notificationSettings = "${apiBaseUrl}notification-settings";
  static const String userSetting = "${apiBaseUrl}user-settings";
  static const String userAddress = "${apiBaseUrl}add-user-address";
  static const String zipTag = "${apiBaseUrl}check-zip-tag";
  static const String sendOtpForPin = "${apiBaseUrl}send-otp-for-pin";
  static const String verifyOtpForPin = "${apiBaseUrl}verify-otp-for-pin";
  static const String benificeryList  = "https://api.flutterwave.com/v3/beneficiaries";
  static const String vritualAccount  = "https://api.flutterwave.com/v3/virtual-account-numbers";
  static const String vritualAccountCreate  = "https://sandboxapi.fincra.com/profile/virtual-accounts/requests/";
  static const String checkoutPayment  = "https://sandboxapi.fincra.com/checkout/payments";
}

Future getAuthHeader() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  // pref.getString("cookie")!.toString().replaceAll('\"', '');
  var gg ={
     HttpHeaders.contentTypeHeader: 'application/json',
     HttpHeaders.acceptHeader: 'application/json',

    // HttpHeaders.authorizationHeader:"FLWSECK_TEST-SANDBOXDEMOKEY-X"
    if(pref.getString("cookie") != null)
      HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
  };
  print(gg);
  return gg;
}
Future getAuthHeaderApi() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  // pref.getString("cookie")!.toString().replaceAll('\"', '');
  var gg ={
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    // FLWSECK_TEST-2e4497e1d44affec2b5bb40148e43193-X
     HttpHeaders.authorizationHeader:"FLWSECK_TEST-SANDBOXDEMOKEY-X"
    // if(pref.getString("cookie") != null)
    //   HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
  };
  print(gg);
  return gg;
}


// HttpHeaders.contentTypeHeader: 'application/json',
// HttpHeaders.acceptHeader: 'application/json',
//     HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',

showToast(message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppTheme.secondaryColor,
      textColor: Color(0xffffffff),
      fontSize: 14);
}