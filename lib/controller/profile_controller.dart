import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/screens/card_sucess.dart';

import '../models/current_balance_model.dart';
import '../models/fund_issuing_wallet.dart';
import '../models/get_card_balance_model.dart';
import '../models/model_conversion.dart';
import '../models/model_create_card.dart';
import '../models/model_create_card_holder.dart';
import '../models/model_create_payout.dart';
import '../models/model_delete_card.dart';
import '../models/model_freeze_card.dart';
import '../models/model_fund_card.dart';
import '../models/model_get_card.dart';
import '../models/model_get_card_details.dart';
import '../models/model_kay .dart';
import '../models/model_rate.dart';
import '../models/model_send_money.dart';
import '../models/model_unfrrze_card.dart';
import '../models/myprofile_model.dart';
import '../models/save_card_model.dart';
import '../models/save_transastion_model.dart';
import '../repository/add_fund_repo.dart';
import '../repository/card_details_repo.dart';
import '../repository/create_card_holder_repo.dart';
import '../repository/create_card_repo.dart';
import '../repository/delete_card_repo.dart';
import '../repository/freeze_card_repo.dart';
import '../repository/fund_issuing_wallet_repo.dart';
import '../repository/getBalanceRepo.dart';
import '../repository/get_card_repo.dart';
import '../repository/get_current_balance.dart';
import '../repository/myprofile_repo.dart';
import '../repository/rate_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../repository/save_card_repo.dart';
import '../repository/send_mail_repo.dart';
import '../repository/unfreez_card_repo.dart';
import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';
import 'bottomnavbar_controller.dart';
import 'number_controller.dart';

class ProfileController extends GetxController {
  final numbercontroller = Get.put(numberController());
  final bottomController = Get.put(BottomNavBarController());

  // final registorController = Get.put(registerController());
  bool isSwitched = false;
  String resulttext = "0";
  String divideText = "0";
  String fundText = "0";
  String multiplyText = "0";
  String result5 = '';
  String fxRate = '';

  //will print 466

  Rx<ModelConversion> modelConversion = ModelConversion().obs;
  Rx<RxStatus> statusOfConversion = RxStatus.empty().obs;

  Rx<ModelRate> modelRate = ModelRate().obs;
  Rx<RxStatus> statusOfRate = RxStatus.empty().obs;

  Future exchangeRate() async {
    await getRateRepo().then((value) {
      modelRate.value = value;
      if (value.status == "success") {
        double resultDivide =
            double.parse(modelRate.value.data!.nGNUSD.toString()) /
                double.parse("100");
        divideText = resultDivide.toStringAsPrecision(4);
        String firstNumberString = divideText.toString();
        String secondNumberString =
            currentBalanceModel.value.data!.fee!.fxRateFee.toString();

        // Check if both inputs are not empty
        if (firstNumberString.isNotEmpty && secondNumberString.isNotEmpty) {
          // Convert strings to integers
          // int firstNumber = int.parse(firstNumberString);
          // int secondNumber = int.parse(secondNumberString);
          double firstNumber = double.parse(firstNumberString);
          double secondNumber = double.parse(secondNumberString);
          // Perform addition
          double sum = firstNumber + secondNumber;
          // int sum = firstNumber + secondNumber;
          print(fxRate.toString());
          // Convert the result back to a string and update the UI

          fxRate = sum.toString();
          print(fxRate.toString());
        } else {
          // Handle the case when one or both of the inputs are empty
          fxRate = 'Please enter valid numbers';
        }

        statusOfRate.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
      }
    }
        // showToast(value.message.toString());
        );
  }

  TextEditingController fundAmountController = TextEditingController();

  saveListFund(context) async {
    saveTransastionRepo(
            amount: fundAmountController.text.toString(),
            about: "Fund To Account ",
            user_id: modal.value.data!.user!.id.toString(),
            sender_id: modal.value.data!.user!.id.toString(),
            // complete_response: purchaseData.value.data!.toJson(),
            context: context,
            description: "Fund To Card ",
            type: "dr")
        .then((value) {
      log("response.body.....    $value");
      save.value = value;
      if (value.status == true) {
        Get.back();
        statusOfSave.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfSave.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }
            // showToast(value.message.toString());
            );
  }

  String userId = "";
  final formKeyFund = GlobalKey<FormState>();
  final formKeyFund1 = GlobalKey<FormState>();
  TextEditingController amount1Controller = TextEditingController();
  TextEditingController refrenceController = TextEditingController();
  Rx<ModelFundCard> addFundCard = ModelFundCard().obs;
  Rx<RxStatus> statusOfFund = RxStatus.empty().obs;

  addFund(context) {
    addFundRepo(
      card_id: card.value.data!.cardId.toString(),
      currency: "USD",
      amount: multiplyText.toString(),
      context: context,
      transaction_reference: card.value.data!.cardId.toString() +
          DateTime.now().millisecondsSinceEpoch.toString(),
    ).then((value) {
      addFundCard.value = value;
      if (value.status == "success") {
        log("CardId${cardId.value}");
        statusOfFund.value = RxStatus.success();

        saveListFund(context);
        getCurrentBalance();
        showToast(value.message.toString());
      } else {
        showToast("insufficient funds");
      }
      // showToast(value.message.toString());
    });
  }

  Rx<ModelFundIssuingWallet> fundIssuingWallet = ModelFundIssuingWallet().obs;
  Rx<RxStatus> statusOfFundIssuingWallet = RxStatus.empty().obs;
  TextEditingController amountController2 = TextEditingController();

  Future fundIssuing(context) async {
    if (formKeyFund1.currentState!.validate()) {
      await fundIssueRepo(
        amount: "3000000000000000000000000",
        context: context,
      ).then((value) {
        fundIssuingWallet.value = value;
        if (value.status == "success") {
          log("CardId${cardId.value}");
          statusOfFundIssuingWallet.value = RxStatus.success();
          Get.back();
          getCurrentBalance();
          showToast(value.message.toString());
        } else {
          showToast(value.message.toString());
        }
        // showToast(value.message.toString());
      });
    }
  }

  // final registorController = Get.put(registerController());

  TextEditingController phone2Controller = TextEditingController();
  TextEditingController description2Controller = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController phone1Controller = TextEditingController();

  TextEditingController ziptag1Controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController airtimeController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController bvnController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController uniqueIdController = TextEditingController();
  TextEditingController saveIdController = TextEditingController();
  Rx<ProfileModel> modal = ProfileModel().obs;
  Rx<RxStatus> statusOfProfile = RxStatus.empty().obs;

  getData() {
    myProfileRepo().then((value) async {
      modal.value = value;
      if (value.status == true) {
        SharedPreferences pref = await SharedPreferences.getInstance();

        pref.setString(
            'uniqueIdentifier', modal.value.data!.user!.uniqueId.toString());
        fNameController.text = modal.value.data!.user!.fname.toString();
        lNameController.text = modal.value.data!.user!.lname.toString();
        zipController.text = modal.value.data!.user!.zipTag.toString();
        dobController.text = modal.value.data!.user!.dob.toString();
        emailController.text = modal.value.data!.user!.email.toString();
        mobileController.text = modal.value.data!.user!.phone.toString();
        uniqueIdController.text = modal.value.data!.user!.uniqueId.toString();
        saveIdController.text = modal.value.data!.user!.freshworkId.toString();
        // registorController.molileController.text = modal.value.data!.user!.phone.toString();
        bvnController.text = modal.value.data!.user!.bvn.toString();
        addressController.text =
            modal.value.data!.user!.address!.streetName.toString();
        houseNumberController.text =
            modal.value.data!.user!.address!.houseNumber.toString();
        cityController.text = modal.value.data!.user!.address!.city.toString();
        postalCodeController.text =
            modal.value.data!.user!.address!.postalCode.toString();
        countryController.text =
            modal.value.data!.user!.address!.country.toString();
        stateController.text =
            modal.value.data!.user!.address!.state.toString();
        statusOfProfile.value = RxStatus.success();

        // holder();
      } else {
        statusOfProfile.value = RxStatus.error();
      }
    });
  }

  String base64Image = "";
  String liveUserImage1 = "";

  ///////update profile
  holder() {
    cardHolderRepo(
      // selfie_image: liveUserImage1.toString(),
      user_id: modal.value.data!.user!.id.toString(),
      card_brand: "Visa",
      card_currency: "USD",
      card_type: "virtual",
      email_address: emailController.text.trim(),
      address: addressController.text.trim(),
      house_no: houseNumberController.text.trim(),
      city: cityController.text.trim(),
      phone: modal.value.data!.user!.phone.toString(),
      country: "Nigeria",
      postal_code: postalCodeController.text.trim(),
      id_type: "NIGERIAN_BVN_VERIFICATION",
      state: "Abia",
      // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
      bvn: bvnController.text.trim(),
      // bvnController.text.trim(),
      // bvnController.text.trim(),

      first_name: modal.value.data!.user!.fname.toString(),
      last_name: modal.value.data!.user!.lname.toString(),
    ).then((value) {
      if (value.status == "success") {
        cardHolder.value = value;
        // Get.toNamed(MyRouters.cardSuccessScreen);
        // print("sdggfrdh");
        // create(context);

        statusOfCardHolder.value = RxStatus.success();
        log("anjalim");
        log(cardId.toString());

        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
      } // showToast(value.message.toString());
    });
  }

  holder3() {
    cardHolderRepo(
      // selfie_image: liveUserImage1.toString(),
      user_id: modal.value.data!.user!.id.toString(),
      card_brand: "Visa",
      card_currency: "USD",
      card_type: "virtual",
      email_address: emailController.text.trim(),
      address: addressController.text.trim(),
      house_no: houseNumberController.text.trim(),
      city: cityController.text.trim(),
      phone: modal.value.data!.user!.phone.toString(),
      country: "Nigeria",
      postal_code: postalCodeController.text.trim(),
      id_type: "NIGERIAN_BVN_VERIFICATION",
      state: "Abia",
      // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
      bvn: bvnController.text.trim(),
      // bvnController.text.trim(),
      // bvnController.text.trim(),

      first_name: modal.value.data!.user!.fname.toString(),
      last_name: modal.value.data!.user!.lname.toString(),
    ).then((value) {
      if (value.status == "success") {
        cardHolder.value = value;
        // Get.toNamed(MyRouters.cardSuccessScreen);
        // print("sdggfrdh");
        // create(context);

        statusOfCardHolder.value = RxStatus.success();
        log("anjalim");
        log(cardId.toString());

        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
      } // showToast(value.message.toString());
    });
  }

  holder1() {
    cardHolderRepo(
// selfie_image: liveUserImage1.toString(),
      card_brand: "MasterCard",
      card_currency: "USD",
      card_type: "virtual",
      user_id: modal.value.data!.user!.id.toString(),
      email_address: emailController.text.trim(),
      address: addressController.text.trim(),
      house_no: houseNumberController.text.trim(),
      city: cityController.text.trim(),
      phone: modal.value.data!.user!.phone.toString(),
      country: "Nigeria",
      postal_code: postalCodeController.text.trim(),
      id_type: "NIGERIAN_BVN_VERIFICATION",
      state: "Abia",
      // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
      bvn: bvnController.text.trim(),
      // bvnController.text.trim(),
      // bvnController.text.trim(),

      first_name: modal.value.data!.user!.fname.toString(),
      last_name: modal.value.data!.user!.lname.toString(),
    ).then((value) {
      if (value.status == "success") {
        cardHolder.value = value;
        // print("sdggfrdh");
        // create1();

        statusOfCardHolder.value = RxStatus.success();
        log("anjalim");
        log(cardId.toString());

        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
      } // showToast(value.message.toString());
    });
  }

  Rx<ModelCreateCard> createCard = ModelCreateCard().obs;
  Rx<RxStatus> statusOfCreate = RxStatus.empty().obs;

  Future create(context) async {
    await createCardRepo(
      card_brand: "Visa",
      card_currency: "USD",
      card_type: "virtual",
      context: context,
      // cardholder_id: cardHolder.value.data!.cardholderId.toString()
    ).then((value) {
      createCard.value = value;
      // Get.to(()=>CardSuccessScreen());

      if (value.status == "success") {
        cardId.value = value.data!.cardId.toString();
        log("CardId${cardId.value}");
        statusOfCreate.value = RxStatus.success();
        cardId.value = value.data!.cardId.toString();

        getCardDetails();
        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }

  Future create3() async {
    await createCardRepo(
            card_brand: "Visa",
            card_currency: "USD",
            card_type: "virtual",
            cardholder_id: card.value.data!.cardHolderId.toString())
        .then((value) {
      createCard.value = value;
      if (value.status == "success") {
        cardId.value = value.data!.cardId.toString();
        log("CardId${cardId.value}");
        statusOfCreate.value = RxStatus.success();
        cardId.value = value.data!.cardId.toString();

        getCardDetails();
        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }

  Future create1(context) async {
    await createCardRepo(
            card_brand: "Mastercard",
            card_currency: "USD",
            card_type: "virtual",
            context: context
            // cardholder_id: cardHolder.value.data!.cardholderId.toString()
            )
        .then((value) {
      createCard.value = value;
      // Get.to(()=>CardSuccessScreen());
      if (value.status == "success") {
        // Get.to(()=>CardSuccessScreen());
        cardId.value = value.data!.cardId.toString();
        log("CardId${cardId.value}");
        statusOfCreate.value = RxStatus.success();
        cardId.value = value.data!.cardId.toString();

        getCardDetails();
        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }

  Future create4(context) async {
    await createCardRepo(
      card_brand: "Mastercard",
      card_currency: "USD",
      card_type: "virtual",
      cardholder_id: card.value.data!.cardHolderId.toString(),
      context: context,
    ).then((value) {
      createCard.value = value;
      if (value.status == "success") {
        cardId.value = value.data!.cardId.toString();
        log("CardId${cardId.value}");
        statusOfCreate.value = RxStatus.success();
        cardId.value = value.data!.cardId.toString();

        getCardDetails();
        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }

  Rx<ModelCreateCardHolder> cardHolder = ModelCreateCardHolder().obs;
  Rx<RxStatus> statusOfCardHolder = RxStatus.empty().obs;

  //////PAyment

  Rx<RxStatus> statusOfSave = RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;

  final TextEditingController amountController = TextEditingController();
  final TextEditingController amountController1 = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();

  TextEditingController requestPhoneController = TextEditingController();
  TextEditingController requestZiptag1Controller = TextEditingController();
  TextEditingController requestemailController = TextEditingController();
  TextEditingController requestNameController = TextEditingController();
  TextEditingController zipUserController = TextEditingController();
  Rx<RxStatus> statusOfSendMail = RxStatus.empty().obs;
  Rx<ModelSendMail> sendMail = ModelSendMail().obs;

  send(context) async {
    sendMailRepo(
            context: context,
            amount: amountController.text.trim(),
            zip_user_id: userId.toString(),
            type: "request")
        .then((value) {
      log("response.body.....    $value");
      sendMail.value = value;
      if (value.status == true) {
        Get.offAllNamed(MyRouters.bottomNavbar);
        statusOfSendMail.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfSendMail.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }
            // showToast(value.message.toString());
            );
  }

  send1(context) async {
    sendMailRepo(
            context: context,
            amount: amountController.text.trim(),
            zip_user_id: userId.toString(),
            type: "send")
        .then((value) {
      log("response.body.....    $value");
      sendMail.value = value;
      if (value.status == true) {
        Get.offAllNamed(MyRouters.bottomNavbar);
        statusOfSendMail.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfSendMail.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }
            // showToast(value.message.toString());
            );
  }

  saveList3(context) async {
    saveTransastionRepo(
            amount: amountController.text.trim(),
            about: "Withdrawl Cash",
            user_id: modal.value.data!.user!.id.toString(),
            sender_id: modal.value.data!.user!.id.toString(),

            // complete_response: purchaseData.value.data!.toJson(),
            context: context,
            description: noteController.text.trim(),
            type: "dr")
        .then((value) {
      log("response.body.....    $value");
      save.value = value;
      if (value.status == true) {
        Get.toNamed(MyRouters.bottomNavbar);
        statusOfSave.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfSave.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }
            // showToast(value.message.toString());
            );
  }

  saveList1(context) async {
    saveTransastionRepo(
            amount: amountController.text.trim(),
            about: "Request cash",
            user_id: modal.value.data!.user!.id.toString(),
            sender_id: modal.value.data!.user!.id.toString(),

            // complete_response: purchaseData.value.data!.toJson(),
            context: context,
            description: noteController.text.trim(),
            type: "dr")
        .then((value) {
      log("response.body.....    $value");
      save.value = value;
      if (value.status == true) {
        Get.toNamed(MyRouters.bottomNavbar);
        statusOfSave.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfSave.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }
            // showToast(value.message.toString());
            );
  }

  // saveList3(context) async {
  //   saveTransastionRepo(
  //       amount: amountController.text.trim(),
  //       about: noteController.text.trim(),
  //       user_id: modal.value.data!.user!.id.toString(),
  //       // complete_response: purchaseData.value.data!.toJson(),
  //       context: context,
  //       description: noteController.text.trim(),
  //       type: "dr")
  //       .then((value) {
  //     log("response.body.....    ${value}");
  //     save.value = value;
  //     if (value.status == true) {
  //       Get.offAllNamed(MyRouters.bottomNavbar);
  //       statusOfSave.value = RxStatus.success();
  //     } else {
  //       statusOfSave.value = RxStatus.error();
  //     }
  //   }
  //     // showToast(value.message.toString());
  //   );
  // }

  saveList(context) {
    saveTransastionRepo(
            amount: amountController.text.trim(),
            about: noteController.text.trim(),
            user_id: userId.toString(),
            send_type: "ziptozip",
            receiver_id: userId.toString(),
            // complete_response: purchaseData.value.data!.toJson(),
            context: context,
            description: noteController.text.trim(),
            type: "cr")
        .then((value) {
      log("response.body.....    $value");
      save.value = value;
      if (value.status == true) {
        // saveList2(context);
        send(context);
        statusOfSave.value = RxStatus.success();
      } else {
        statusOfSave.value = RxStatus.error();
      }
    }
            // showToast(value.message.toString());
            );
  }

  Rx<RxStatus> statusOfpayout = RxStatus.empty().obs;
  Rx<ModelPayout> payout = ModelPayout().obs;

//    pay(context) {
//      payoutRepo(
//          amount:amountController.text.trim(),
//          context: context,
//          accountHolderName:data.accountHolderName.toString() ,
//          accountNumber:data.destinationAddress.toString(),
//          destinationCurrency:"NGN",
// // destinationCurrencyController.text.trim() ,
//          sourceCurrency: "NGN",
//          // sourceCurrencyController.text.trim(),
//          description: noteController.text.trim(),
//          // email:data.email.toString(),
//          firstName:data.firstName.toString() ,
//          // lastName:data.lastName.toString() ,
//          paymentDestination:"bank_account" ,
//          type:"individual" ,
//          business:  '64529bd2bfdf28e7c18aa9da'
//      ).then((value) {
//        payout.value = value;
//        if (value.success == true) {
//          statusOfpayout.value = RxStatus.success();
//          saveList();
//          Get.toNamed(MyRouters.successRechargeScreen);
//          // Get.back();
//          showToast(value.message.toString());
//        }
//        else{
//          statusOfpayout.value = RxStatus.success();
//          showToast(value.message.toString());
//        }
//        // showToast(value.message.toString());
//      });
//    }
  saveList2(context) {
    saveTransastionRepo(
            user_id: modal.value.data!.user!.id.toString(),
            amount: amountController.text.trim(),
            about: noteController.text.trim(),
            send_type: "ziptozip",
            sender_id: modal.value.data!.user!.id.toString(),
            // complete_response: purchaseData.value.data!.toJson(),
            context: context,
            description: noteController.text.trim(),
            type: "dr")
        .then((value) {
      log("response.body.....    $value");
      save.value = value;
      if (value.status == true) {
        saveList5(context);
        // send1();

        statusOfSave.value = RxStatus.success();
      } else {
        statusOfSave.value = RxStatus.error();
      }
    }
            // showToast(value.message.toString());
            );
  }

  saveList5(context) {
    saveTransastionRepo(
            amount: amountController.text.trim(),
            about: noteController.text.trim(),
            user_id: userId.toString(),
            send_type: "ziptozip",
            receiver_id: userId.toString(),
            // complete_response: purchaseData.value.data!.toJson(),
            context: context,
            description: noteController.text.trim(),
            type: "cr")
        .then((value) {
      log("response.body.....    $value");
      save.value = value;
      if (value.status == true) {
        // saveList2(context);
        // send();
        send1(context);
        statusOfSave.value = RxStatus.success();
      } else {
        statusOfSave.value = RxStatus.error();
      }
    }
            // showToast(value.message.toString());
            );
  }

  Rx<CurrentBalanceModel> currentBalanceModel = CurrentBalanceModel().obs;
  Rx<RxStatus> statusOfCurrentBalance = RxStatus.empty().obs;

  getCurrentBalance() {
    getCurrentBalanceRepo(
            // cardId.value
            // createCard.value.data!.cardId.toString()
            )
        .then((value) {
      if (value.status == true) {
        statusOfCurrentBalance.value = RxStatus.success();
        // Get.toNamed(MyRouters.cardDetails);
        // holder();
        currentBalanceModel.value = value;
      } else {
        statusOfCurrentBalance.value = RxStatus.error();
      }
    });
  }

  Rx<ModelGetCardDetails> cardDetails = ModelGetCardDetails().obs;
  Rx<RxStatus> statusOfCardDetails = RxStatus.empty().obs;
  RxString cardId = "".obs;

  getCardDetails() {
    getCardDetailsRepo(card_id: cardId.value.toString()
            // cardId.value
            // createCard.value.data!.cardId.toString()
            )
        .then((value) {
      if (value.status == "success") {
        statusOfCardDetails.value = RxStatus.success();
        // saveCardDetails();
        // Get.toNamed(MyRouters.cardDetails);
        // holder();
        cardDetails.value = value;
        cardHolderController.text =
            cardDetails.value.data!.cardholderId.toString();

        saveCardDetails();
      } else {
        statusOfCardDetails.value = RxStatus.error();
      }
    });
  }

  Rx<ModelGetCard> card = ModelGetCard().obs;
  Rx<RxStatus> statusOfCard = RxStatus.empty().obs;

  Future getCard() async {
    await getCardRepo().then((value) {
      if (value.status == true) {
        statusOfCard.value = RxStatus.success();
        // saveCardDetails();
        // Get.toNamed(MyRouters.cardDetails);
        // holder();
        card.value = value;
        getBalance();
        // saveCardDetails();
      } else {
        statusOfCard.value = RxStatus.error();
      }
    });
  }

  Rx<GetCardBalanceModel> cardBalance = GetCardBalanceModel().obs;
  Rx<RxStatus> statusOfCardBalance = RxStatus.empty().obs;

  Future getBalance() async {
    await getCardBalanceRepo(card_id: card.value.data!.cardId.toString())
        .then((value) {
      if (value.status == "success") {
        statusOfCardBalance.value = RxStatus.success();
        // saveCardDetails();
        // Get.toNamed(MyRouters.cardDetails);

        cardBalance.value = value;
        double resultFund =
            double.parse(cardBalance.value.data!.balance.toString()) /
                double.parse("100").round();
        fundText = resultFund.toDouble().toString();
        showToast(value.message.toString());

        // saveCardDetails();
      } else {
        statusOfCardBalance.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }

  Rx<ModelSaveCard> saveDetails = ModelSaveCard().obs;
  Rx<RxStatus> statusOfSaveDetails = RxStatus.empty().obs;

  saveCardDetails() {
    saveCardRepo(
      card_id: cardDetails.value.data!.cardId.toString(),
      card_holder_id: cardDetails.value.data!.cardholderId.toString(),
      card_currency: cardDetails.value.data!.cardCurrency.toString(),
      brand: cardDetails.value.data!.brand.toString(),
      card_name: cardDetails.value.data!.cardName.toString(),
      card_number: cardDetails.value.data!.cardNumber.toString(),
      cvv: cardDetails.value.data!.cvv.toString(),
      expiry_month: cardDetails.value.data!.expiryMonth.toString(),
      expiry_year: cardDetails.value.data!.expiryYear.toString(),
      last_4: cardDetails.value.data!.last4.toString(),

      // cardId.value
      // createCard.value.data!.cardId.toString()
    ).then((value) {
      if (value.status == true) {
        statusOfSaveDetails.value = RxStatus.success();
        Get.to(() => CardSuccessScreen());
        // Get.toNamed(MyRouters.myCard);
        // holder();
        saveDetails.value = value;
      } else {
        statusOfSaveDetails.value = RxStatus.error();
      }
    });
  }

  Rx<ModelFreezeCard> cardFreeze = ModelFreezeCard().obs;
  Rx<RxStatus> statusOfCardfreeze = RxStatus.empty().obs;

  frozenCard() {
    freezeCardRepo(card_id: card.value.data!.cardId.toString()
            // cardId.value
            // createCard.value.data!.cardId.toString()
            )
        .then((value) {
      if (value.status == "success") {
        statusOfCardfreeze.value = RxStatus.success();
        Get.back();
        showToast(value.message.toString());
        // Get.toNamed(MyRouters.cardDetails);
        // holder();
        cardFreeze.value = value;
      } else {
        statusOfCardfreeze.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }

  Rx<ModelUnfreezCard> cardUnFreeze = ModelUnfreezCard().obs;
  Rx<RxStatus> statusOfCardUnfreeze = RxStatus.empty().obs;

  unFrozenCard() {
    UnFreezeCardRepo(card_id: card.value.data!.cardId.toString()
            // cardId.value
            // createCard.value.data!.cardId.toString()
            )
        .then((value) {
      if (value.status == "success") {
        statusOfCardUnfreeze.value = RxStatus.success();
        Get.back();
        showToast(value.message.toString());
        // Get.toNamed(MyRouters.cardDetails);
        // holder();
        cardUnFreeze.value = value;
      } else {
        statusOfCardUnfreeze.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }

  Rx<ModelKey> appKeyModel = ModelKey().obs;
  Rx<RxStatus> statusOfKey = RxStatus.empty().obs;

  Rx<ModelDeleteCard> cardDelete = ModelDeleteCard().obs;
  Rx<RxStatus> statusOfCardDelete = RxStatus.empty().obs;

  delete() {
    deleteCardRepo(card_id: card.value.data!.cardId.toString()).then((value) {
      if (value.status == "success") {
        statusOfCardDelete.value = RxStatus.success();
        Get.back();
        showToast(value.message.toString());
        bottomController.pageIndex.value = 0;
        card.value.data = null;

        // Get.toNamed(MyRouters.walletScreen);
        // holder();
        cardDelete.value = value;
      } else {
        statusOfCardDelete.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
