import 'dart:io';
import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/common_colour.dart';




class ApiUrls {
  static const String apiBaseUrl = 'https://zipfintech.eoxyslive.com/api/';
  static const String otps = "${apiBaseUrl}otps";
  static const String applyLoan = "${apiBaseUrl}apply-loan";
  static const String saveCardInfo = "${apiBaseUrl}save-card-info";
  static const String verifyOtp = "${apiBaseUrl}otps/";
  static const String chooseBank = "https://sandboxapi.fincra.com/core/banks?";
  static const String registerUser = "${apiBaseUrl}register";
  static const String updatePassword = "${apiBaseUrl}update-password";
  static const String SettingApi = "${apiBaseUrl}settings";
  static const String faq = "${apiBaseUrl}faq";
  static const String verificationAfrica = "${apiBaseUrl}verification-africa";
  static const String verifyAfrica = "https://api.verified.africa/sfx-verify/v3/id-service/";
  static const String fetchAccount = "https://sandboxapi.fincra.com/profile/virtual-accounts/";
  static const String beneficiariesCreate  = "https://sandboxapi.fincra.com/profile/beneficiaries/business/";
  static const String payout  = "https://sandboxapi.fincra.com/disbursements/payouts";
  static const String plan  = "https://billing-staging.bytestacks.io/api/v1/bundles";
  static const String verifyMeter  = "https://billing-staging.bytestacks.io/api/v1/electricity/verify";
  static const String provider  = "https://billing-staging.bytestacks.io/api/v1/cable/providers";
  static const String purchase  = "https://billing-staging.bytestacks.io/api/v1/vend_airtime";
  static const String purchaseData  = "https://billing-staging.bytestacks.io/api/v1/vend_data";
  static const String buyCabeltv  = "https://billing-staging.bytestacks.io/api/v1/cable/subscribe";
  static const String createCard  = "https://issuecards.api.bridgecard.co/v1/issuing/sandbox/cards/create_card";
  static const String createCardHolder  = "https://issuecards.api.bridgecard.co/v1/issuing/sandbox/cardholder/register_cardholder_synchronously";
  static const String getCardDetails  = "https://issuecards-api-bridgecard-co.relay.evervault.com/v1/issuing/sandbox/cards/get_card_details?card_id=";
  static const String freezeCard  = "https://issuecards.api.bridgecard.co/v1/issuing/sandbox/cards/freeze_card?card_id=";
  static const String purchaseEnergy  = "https://billing-staging.bytestacks.io/api/v1/electricity/subscribe";
  static const String conversion  = "https://sandboxapi.fincra.com/quotes/generate";
  static const String resolve  = "https://sandboxapi.fincra.com/core/accounts/resolve";
  static const String getBeneficiaries  = "https://sandboxapi.fincra.com/profile/beneficiaries/business/";
  static const String getTelcos  = "https://billing-staging.bytestacks.io/api/v1/telcos";
  static const String biller  = "https://billing-staging.bytestacks.io/api/v1/electricity/billers";
  static const String cabelProviders  = "https://billing-staging.bytestacks.io/api/v1/cable/providers";
  static const String userVerifyOtp = "${apiBaseUrl}verify-otp";
  static const String updateDetails = "${apiBaseUrl}update-details";
  static const String verifyAccount = "${apiBaseUrl}virtual-account";
  static const String saveTransaction = "${apiBaseUrl}save-transaction";
  static const String loginUser = "${apiBaseUrl}login";
  static const String changeZipPin = "${apiBaseUrl}change-zip-pin";
  static const String saveBankDetails = "${apiBaseUrl}save-bank-details";
  static const String saveBenificary = "${apiBaseUrl}save-beneficiary";
  static const String transfreLimitGet = "${apiBaseUrl}transfer-limit";
  static const String getBenificaryList = "${apiBaseUrl}get-beneficiary";
  static const String transactionList = "${apiBaseUrl}transaction-list";
  static const String transactionReceive = "${apiBaseUrl}transaction-receive";
  static const String transactionSend = "${apiBaseUrl}transaction-send";
  static const String favouriteBeneficiary = "${apiBaseUrl}favourite-beneficiary";
  static const String currentBalance = "${apiBaseUrl}current-balance";
  static const String supportCategories = "${apiBaseUrl}support-categories";
  static const String userBankList = "${apiBaseUrl}user-bank-list";
  static const String myAddress = "${apiBaseUrl}my-address";
  static const String getCardInfo = "${apiBaseUrl}get-card-info";
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
  static const String search = "${apiBaseUrl}search?";
  static const String zipSearch = "${apiBaseUrl}zip-search?";
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