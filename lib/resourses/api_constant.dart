import 'dart:io';
import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/common_colour.dart';

class ApiUrls {
  static const String apiBaseUrl = 'http://178.128.83.16/api/';

  // static const String apiBaseUrl = 'https://zipfintech.eoxyslive.com/api/';
  // static const String apiBaseUrl = 'http://178.128.83.16/api/';
  static const String otps = "${apiBaseUrl}otps";
  static const String forgotEmail = "${apiBaseUrl}forgot-password";
  static const String resetPassword = "${apiBaseUrl}reset-password";
  static const String bridgeCard = "${apiBaseUrl}bridge-card";
  static const String applyLoan = "${apiBaseUrl}apply-loan";
  static const String saveCardInfo = "${apiBaseUrl}save-card-info";
  static const String seveRequestMail = "${apiBaseUrl}send-email-globle";
  static const String saveFreshwork = "${apiBaseUrl}freshwork";
  static const String verifyOtp = "${apiBaseUrl}otps/";
  static const String chooseBank = "https://api.fincra.com/core/banks?";
  static const String registerUser = "${apiBaseUrl}register";
  static const String updatePassword = "${apiBaseUrl}update-password";
  static const String SettingApi = "${apiBaseUrl}settings";
  static const String faq = "${apiBaseUrl}faq";
  static const String verificationAfrica = "${apiBaseUrl}verification-africa";
  static const String verifyAfrica =
      "https://api.verified.africa/sfx-verify/v3/id-service/";
  static const String fetchAccount =
      "https://api.fincra.com/profile/virtual-accounts/";
  static const String beneficiariesCreate =
      "https://api.fincra.com/profile/beneficiaries/business/";
  static const String addFundCard =
      "https://issuecards.api.bridgecard.co/v1/issuing/sandbox/cards/fund_card";
  static const String addFundIssuesWallet =
      "https://issuecards.api.bridgecard.co/v1/issuing/sandbox/cards/fund_issuing_wallet";
  static const String createContact =
      "https://zipinternationallimited-team.myfreshworks.com/crm/sales/api/contacts";
  static const String payout = "https://api.fincra.com/disbursements/payouts";
  static const String plan =
      "https://billing-staging.bytestacks.io/api/v1/bundles";
  static const String verifyMeter =
      "https://billing-staging.bytestacks.io/api/v1/electricity/verify";
  static const String provider =
      "https://billing-staging.bytestacks.io/api/v1/cable/providers";
  static const String purchase =
      "https://billing-staging.bytestacks.io/api/v1/vend_airtime";
  static const String purchaseData =
      "https://billing-staging.bytestacks.io/api/v1/vend_data";
  static const String buyCabeltv =
      "https://billing-staging.bytestacks.io/api/v1/cable/subscribe";
  static const String createCard =
      "https://issuecards.api.bridgecard.co/v1/issuing/sandbox/cards/create_card";
  static const String createCardHolder =
      "https://issuecards.api.bridgecard.co/v1/issuing/sandbox/cardholder/register_cardholder_synchronously";
  static const String getCardDetails =
      "https://issuecards-api-bridgecard-co.relay.evervault.com/v1/issuing/sandbox/cards/get_card_details?card_id=";
  static const String getCardBalance =
      "https://issuecards.api.bridgecard.co/v1/issuing/sandbox/cards/get_card_balance?card_id=";
  static const String getRate =
      "https://issuecards.api.bridgecard.co/v1/issuing/cards/fx-rate";
  static const String freezeCard =
      "https://issuecards.api.bridgecard.co/v1/issuing/sandbox/cards/freeze_card?card_id=";
  static const String deleteCard =
      "https://issuecards.api.bridgecard.co/v1/issuing/sandbox/cards/delete_card/44faae6059834696b2ad9eecc94ca955";
  static const String UnfreezeCard =
      "https://issuecards.api.bridgecard.co/v1/issuing/sandbox/cards/unfreeze_card?card_id=";
  static const String privicyPolicy = "${apiBaseUrl}pages?slug=";
  static const String purchaseEnergy =
      "https://billing-staging.bytestacks.io/api/v1/electricity/subscribe";
  static const String conversion = "https://api.fincra.com/quotes/generate";
  static const String resolve = "https://api.fincra.com/core/accounts/resolve";
  static const String getBeneficiaries =
      "https://api.fincra.com/profile/beneficiaries/business/";
  static const String getTelcos =
      "https://billing-staging.bytestacks.io/api/v1/telcos";
  static const String biller =
      "https://billing-staging.bytestacks.io/api/v1/electricity/billers";
  static const String cabelProviders =
      "https://billing-staging.bytestacks.io/api/v1/cable/providers";
  static const String liveDetailsAfrica =
      "https://api.verified.africa/sfx-verify/v3/id-service/";
  static const String liveAfrica =
      "https://api.verified.africa/sfx-verify/v3/id-service/";
  static const String faceMatchAfrica =
      "https://api.verified.africa/sfx-verify/v3/id-service/";
  static const String userVerifyOtp = "${apiBaseUrl}verify-otp";
  static const String otpUsers = "${apiBaseUrl}resend-otp";
  static const String updateDetails = "${apiBaseUrl}update-details";
  static const String requestmail = "${apiBaseUrl}request-money-mail";
  static const String sendEmail = "${apiBaseUrl}send-email";
  static const String verifyAccount = "${apiBaseUrl}virtual-account";
  static const String saveTransaction = "${apiBaseUrl}save-transaction";
  static const String loginUser = "${apiBaseUrl}login";
  static const String africaVerificationUser =
      "${apiBaseUrl}africa-verification-user";
  static const String changeZipPin = "${apiBaseUrl}change-zip-pin";
  static const String saveBankDetails = "${apiBaseUrl}save-bank-details";
  static const String saveBenificary = "${apiBaseUrl}save-beneficiary";
  static const String transfreLimitGet = "${apiBaseUrl}transfer-limit";
  static const String getBenificaryList = "${apiBaseUrl}get-beneficiary";
  static const String transactionList = "${apiBaseUrl}transaction-list";
  static const String currencylist =
      "https://abokifx.com/api/v1/rates/movement";
  static const String transactionReceive = "${apiBaseUrl}transaction-receive";
  static const String buyAirtimeList = "${apiBaseUrl}buy-airtime-list";
  static const String buyDataList = "${apiBaseUrl}buy-data-list";
  static const String buycabletvList = "${apiBaseUrl}buy-cabletv-list";
  static const String buyElectricityList = "${apiBaseUrl}buy-electricity-list";
  static const String transactionSend = "${apiBaseUrl}transaction-send";
  static const String favouriteBeneficiary =
      "${apiBaseUrl}favourite-beneficiary";
  static const String currentBalance = "${apiBaseUrl}current-balance";
  static const String supportCategories = "${apiBaseUrl}support-categories";
  static const String getAfricaUser =
      "${apiBaseUrl}get-africa-verification-user?user_id=";
  static const String userBankList = "${apiBaseUrl}user-bank-list";
  static const String myAddress = "${apiBaseUrl}my-address";
  static const String getLiveImage = "${apiBaseUrl}get-live-image";
  static const String appKey = "${apiBaseUrl}key-list";
  static const String getCardInfo = "${apiBaseUrl}get-card-info";
  static const String logout = "${apiBaseUrl}logout";
  static const String deleteAccount = "${apiBaseUrl}delete-account";
  static const String transfreLimitPost = "${apiBaseUrl}transfer-limit";
  static const String verifyPinSecurity = "${apiBaseUrl}verify-pin-security";
  static const String submitQuery = "${apiBaseUrl}submit-query";
  static const String myProfile = "${apiBaseUrl}my-profile";
  static const String updateProfile = "${apiBaseUrl}update-profile";
  static const String liveImage = "${apiBaseUrl}live-image";
  static const String updateSetting = "${apiBaseUrl}update-settings";
  static const String notificationSettings =
      "${apiBaseUrl}notification-settings";
  static const String userSetting = "${apiBaseUrl}user-settings";
  static const String userAddress = "${apiBaseUrl}add-user-address";
  static const String search = "${apiBaseUrl}search?";
  static const String zipSearch = "${apiBaseUrl}zip-search?";
  static const String zipTag = "${apiBaseUrl}check-zip-tag";
  static const String sendOtpForPin = "${apiBaseUrl}send-otp-for-pin";
  static const String verifyOtpForPin = "${apiBaseUrl}verify-otp-for-pin";
  static const String bankDetails = "${apiBaseUrl}get-bank-details";

  // static const String benificeryList  = "https://api.flutterwave.com/v3/beneficiaries";
  // static const String vritualAccount  = "https://api.flutterwave.com/v3/virtual-account-numbers";
  static const String vritualAccountCreate =
      "https://api.fincra.com/profile/virtual-accounts/requests";
  static const String checkoutPayment =
      "https://api.fincra.com/checkout/payments";
  static const String common = "http://178.128.83.16/api/link-generation";
  static const String serviceCommon =
      "http://178.128.83.16/api/vtpass-services";
}

Future getAuthHeader() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  // pref.getString("cookie")!.toString().replaceAll('\"', '');
  var gg = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',

    // HttpHeaders.authorizationHeader:"FLWSECK_TEST-SANDBOXDEMOKEY-X"
    if (pref.getString("cookie") != null)
      HttpHeaders.authorizationHeader:
          'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
  };
  print(gg);
  return gg;
}

Future getAuthHeaderApi() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  // pref.getString("cookie")!.toString().replaceAll('\"', '');
  var gg = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    // FLWSECK_TEST-2e4497e1d44affec2b5bb40148e43193-X
    HttpHeaders.authorizationHeader: "FLWSECK_TEST-SANDBOXDEMOKEY-X"
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
