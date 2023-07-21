import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zip/screens/birthday_screen.dart';
import 'package:zip/screens/bottom_nav_screens/choose_bank.dart';
import 'package:zip/screens/bottom_nav_screens/send_cash1.dart';
import 'package:zip/screens/bottom_nav_screens/dashboard_screen.dart';

import 'package:zip/screens/bottom_nav_screens/send_cash2.dart';

import 'package:zip/screens/bottomnav_bar.dart';
import 'package:zip/screens/change_zip_pin.dart';
import 'package:zip/screens/confirm_bank.dart';
import 'package:zip/screens/country_page.dart';


import 'package:zip/screens/enterMobileno.dart';
import 'package:zip/screens/enter_email.dart';
import 'package:zip/screens/exchange_screen.dart';
import 'package:zip/screens/faq_screen.dart';
import 'package:zip/screens/login_screen.dart';

import 'package:zip/screens/otp_screen.dart';
import 'package:zip/screens/otpemail.dart';
import 'package:zip/screens/otpmobile.dart';
import 'package:zip/screens/regestration_address.dart';
import 'package:zip/screens/regestration_extra_details.dart';
import 'package:zip/screens/regestration_selectable.dart';
import 'package:zip/screens/resgestration_name.dart';
import 'package:zip/screens/select_payment.dart';
import 'package:zip/screens/send_otp_for_pin.dart';
import 'package:zip/screens/sucess.dart';
import 'package:zip/screens/transaction1_page.dart';
import 'package:zip/screens/transaction_history.dart';
import 'package:zip/screens/update_profile_screen.dart';
import 'package:zip/screens/verify_otp_for_pin.dart';
import 'package:zip/screens/your_balance_screen.dart';
import 'package:zip/screens/zipTag)_screen.dart';

import 'package:get/get.dart';
import 'package:zip/screens/accountsinbank.dart';
import 'package:zip/screens/add_card.dart';
import 'package:zip/screens/addapayer.dart';
import 'package:zip/screens/addrecipients.dart';
import 'package:zip/screens/addrecipientstart.dart';
import 'package:zip/screens/buyservices.dart';
import 'package:zip/screens/createrecipients.dart';
import 'package:zip/screens/generatepaymentlink.dart';
import 'package:zip/screens/mycard.dart';
import 'package:zip/screens/paybillsservices.dart';
import 'package:zip/screens/paynowbalance.dart';
import 'package:zip/screens/request_payment.dart';
import 'package:zip/screens/requestapaymentcontinue.dart';
import 'package:zip/screens/sendcash.dart';
import 'package:zip/screens/sendcashyourbalance.dart';
import 'package:zip/screens/setting.dart';
import 'package:zip/screens/sharepaymentlink.dart';
import 'package:zip/screens/transfer_limit.dart';
import 'package:zip/screens/wallet_screen.dart';
import 'package:zip/screens/yourrecipient.dart';

import '../main.dart';
import '../screens/Cardlimit.dart';
import '../screens/addfundsinbank.dart';
import '../screens/contact_us_screen.dart';
import '../screens/create_account.dart';
import '../screens/create_benificery_screen.dart';
import '../screens/currenty.dart';
import '../screens/eligible_screen.dart';
import '../screens/email_login.dart';

import '../screens/limit_screen.dart';
import '../screens/loan_list.dart';
import '../screens/loan_screen.dart';
import '../screens/notification_screeb.dart';
import '../screens/onboardingScreen.dart';
import '../screens/paymentlink.dart';
import '../screens/profile_screen.dart';

import '../screens/question_screen.dart';
import '../screens/regular_bank_transfer.dart';
import '../screens/security_otp.dart';
import '../screens/sendMoney.dart';
import '../screens/supportscreen.dart';
import '../screens/update_password.dart';
import '../screens/verify_africa_ui.dart';



import '../splash1.dart';

class MyRouters{
  static var splash = "/splash";
  static var onBoardingScreen = "/onBoardingScreen";
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
  static var accountsInBank = "/accountsInBank";
  static var payNowBalance = "/payNowBalance";
  static var sendCash = "/sendCash";
  static var addRecipients = "/addRecipients";
  static var createRecipients = "/createRecipients";
  static var addRecipientsStart = "/addRecipientsStart";
  static var sendCashYourBalance = "/sendCashYourBalance";
  static var yourRecipient = "/yourRecipient";
  static var paymentLink = "/paymentLink";
  static var requestAPaymentContiune = "/requestAPaymentContiune";
  static var sharePaymentLink = "/sharePaymentLink";
  static var loginScreen = "/loginScreen";
  static var emailLoginScreen = "/emailLoginScreen";

  static var verifyAfricaScreen = "/verifyAfricaScreen";

  static var profileUpdateScreen = "/profileUpdateScreen";
  static var changeZipPinScreen = "/changeZipPinScreen";
  static var sendOtpForPinScreen = "/sendOtpForPinScreen";
  static var verifyOtpForPinScreen = "/verifyOtpForPinScreen";
  static var updatePassword = "/updatePassword";
  static var notificationScreen = "/notificationScreen";
  static var securityOtpScreen = "/securityOtpScreen";
  static var supportScreen = "/supportScreen";
  static var contuctUsScreen = "/contuctUsScreen";
  static var currencyConvert = "/currencyConvert";
  static var limitScreen = "/limitScreen";
  static var cardLimitScreen = "/cardLimitScreen";
  static var virtualAccount = "/virtualAccount";
  static var sendCashReciptant = "/sendCashReciptant";
  static var regularTransfer = "/regularTransfer";
  static var loanScreen = "/loanScreen";
  static var loanList = "/loanList";
  static var questionsScreen = "/questionsScreen";
  static var eligibleScreen = "/eligibleScreen";
  static var verifyPaymentLink = "/verifyPaymentLink";
  static var createBenificeryScreen = "/createBenificeryScreen";




  static var route = [
    GetPage(name: '/', page: () =>  Splash()),



    GetPage(name: '/onBoardingScreen', page: () =>   const OnBoardingScreen()),
    GetPage(name: '/verifyPaymentLink', page: () =>   const VerifyPaymentLink()),
    GetPage(name: '/createBenificeryScreen', page: () =>   const CreateBenificeryScreen()),
    GetPage(name: '/sendCashReciptant', page: () =>   const SendCashReciptant()),
    GetPage(name: '/regularTransfer', page: () =>   const RegularTransfer()),
    GetPage(name: '/eligibleScreen', page: () =>   const EligibleScreen()),
    GetPage(name: '/currencyConvert', page: () =>   const CurrencyConvert()),
    GetPage(name: '/questionsScreen', page: () =>   const QuestionsScreen()),
    GetPage(name: '/virtualAccount', page: () =>   const VirtualAccount()),
    GetPage(name: '/limitScreen', page: () =>   const LimitScreen()),
    GetPage(name: '/loanList', page: () =>   const LoanList()),
    GetPage(name: '/cardLimitScreen', page: () =>   const CardLimitScreen()),
    GetPage(name: '/notificationScreen', page: () =>   const NotificationScreen()),
    GetPage(name: '/requestAPaymentContiune', page: () =>   const RequestAPaymentContiune()),
    GetPage(name: '/sendCash1', page: () =>  const SendCash1()),
    GetPage(name: '/sharePaymentLink', page: () =>  const SharePaymentLink()),
    GetPage(name: '/verifyAfricaScreen', page: () =>  const VerifyAfricaScreen()),
    GetPage(name: '/sendCash2', page: () =>  const SendCash2()),
    GetPage(name: '/chooseBank', page: () =>  const ChooseBank()),
    GetPage(name: '/bottomNavbar', page: () =>  const BottomNavbar()),
    GetPage(name: '/walletScreen', page: () =>   WalletScreen()),
    GetPage(name: '/profileScreen', page: () =>  const ProfileScreen()),
    GetPage(name: '/contuctUsScreen', page: () =>  const ContuctUsScreen()),
    GetPage(name: '/supportScreen', page: () =>  const SupportScreen()),
    GetPage(name: '/dashBoard', page: () =>  const DashBoard()),

    GetPage(name: '/mobileNumber', page: () =>  const MobileNumberScreen()),
    GetPage(name: '/updatePassword', page: () =>  const UpdatePassword()),
    GetPage(name: '/updatePassword', page: () =>  const UpdatePassword()),


    GetPage(name: '/selectableScreen', page: () =>  const SelectableScreen()),
    GetPage(name: '/userScreen', page: () =>   const UserScreen()),
    GetPage(name: '/birthdayScreen', page: () =>   const BirthdayScreen()),
    GetPage(name: '/loanScreen', page: () =>   const LoanScreen()),
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
    GetPage(name: '/enterEmailScreen', page: () =>   const EmailScreen()),
    GetPage(name: '/otpEmailScreen', page: () =>   const EmailOtpScreen()),
    GetPage(name: '/mobileOtpScreen', page: () =>   const MobileOtpScreen()),
    GetPage(name: "/walletScreen", page: ()=>  WalletScreen()),
    GetPage(name: "/addCard", page: ()=>  AddCard()),
    GetPage(name: "/myCard", page: ()=>  MyCard()),
    GetPage(name: "/buyServices", page: ()=>  BuyServices()),
    GetPage(name: "/payBillsServices", page: ()=>  const PayBillsServices()),
    GetPage(name: "/paymentLink", page: ()=>  const GeneratePaymentLink()),
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
    GetPage(name: "/transferLimit", page: ()=>  const TransferLimit()),
    GetPage(name: "/loginScreen", page: ()=>  const LoginScreen()),
    GetPage(name: "/emailLoginScreen", page: ()=>  const EmailLoginScreen()),
    GetPage(name: "/profileUpdateScreen", page: ()=>  const UpdateProfile()),
    GetPage(name: "/changeZipPinScreen", page: ()=>  const ChangeZipPin()),
    GetPage(name: "/sendOtpForPinScreen", page: ()=>  const SendOtpForPin()),
    GetPage(name: "/verifyOtpForPinScreen", page: ()=>  const VerifyOtpForPin()),
    GetPage(name: "/securityOtpScreen", page: ()=>  const SecurityOtpScreen()),


  ];
}