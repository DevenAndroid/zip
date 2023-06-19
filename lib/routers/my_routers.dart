import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zip/screens/birthday_screen.dart';
import 'package:zip/screens/bottom_nav_screens/choose_bank.dart';
import 'package:zip/screens/bottom_nav_screens/send_cash1.dart';
import 'package:zip/screens/bottom_nav_screens/dashboard_screen.dart';
import 'package:zip/screens/bottom_nav_screens/profile_screen.dart';
import 'package:zip/screens/bottom_nav_screens/send_cash2.dart';
import 'package:zip/screens/bottom_nav_screens/wallet_screen.dart';
import 'package:zip/screens/bottomnav_bar.dart';
import 'package:zip/screens/confirm_bank.dart';
import 'package:zip/screens/country_page.dart';

import 'package:zip/screens/enterMobileno.dart';
import 'package:zip/screens/enter_email.dart';
import 'package:zip/screens/exchange_screen.dart';
import 'package:zip/screens/faq_screen.dart';
import 'package:zip/screens/onboarding.dart';
import 'package:zip/screens/otp_screen.dart';
import 'package:zip/screens/otpemail.dart';
import 'package:zip/screens/otpmobile.dart';
import 'package:zip/screens/regestration_address.dart';
import 'package:zip/screens/regestration_extra_details.dart';
import 'package:zip/screens/regestration_selectable.dart';
import 'package:zip/screens/resgestration_name.dart';
import 'package:zip/screens/select_payment.dart';
import 'package:zip/screens/sucess.dart';
import 'package:zip/screens/transaction1_page.dart';
import 'package:zip/screens/transaction_history.dart';
import 'package:zip/screens/your_balance_screen.dart';
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
  static var fAQScreens = "/fAQScreen";
  static var yourBalanceScreen = "/yourBalanceScreen";
  static var selectMethod = "/selectMethod";
  static var confirmBankScreen = "/confirmBankScreen";
  static var successScreen = "/successScreen";
  static var sendCash1 = "/sendCash1";
  static var walletScreen = "/walletScreen";
  static var profileScreen = "/profileScreen";
  static var bottomNavbar = "/bottomNavbar";
  static var sendCash2 = "/sendCash2";
  static var chooseBank = "/chooseBank";

  static var route = [
    GetPage(name: '/', page: () =>  const Splash()),
  GetPage(name: '/oBScreen', page: () =>  const OBScreen()),
  GetPage(name: '/sendCash1', page: () =>  const SendCash1()),
  GetPage(name: '/sendCash2', page: () =>  const SendCash2()),
  GetPage(name: '/chooseBank', page: () =>  const ChooseBank()),
  GetPage(name: '/bottomNavbar', page: () =>  const BottomNavbar()),
  GetPage(name: '/walletScreen', page: () =>  const WalletScreen()),
  GetPage(name: '/profileScreen', page: () =>  const ProfileScreen()),
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
    GetPage(name: '/fAQScreen', page: () =>   const FAQScreen()),
    GetPage(name: '/yourBalanceScreen', page: () =>   const YourBalanceScreen()),
    GetPage(name: '/selectMethod', page: () =>   const SelectMethod()),
    GetPage(name: '/confirmBankScreen', page: () =>   const ConfirmBank()),
    GetPage(name: '/successScreen', page: () =>   const SuccessScreen()),
  ];
}