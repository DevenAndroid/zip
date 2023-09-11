import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/controller/update_user.dart';

import '../models/current_balance_repo.dart';
import '../models/fund_issuing_wallet.dart';
import '../models/get_card_balance_model.dart';
import '../models/model_conversion.dart';
import '../models/model_create_card.dart';
import '../models/model_create_card_holder.dart';
import '../models/model_freeze_card.dart';
import '../models/model_fund_card.dart';
import '../models/model_get_card.dart';
import '../models/model_get_card_details.dart';
import '../models/model_rate.dart';
import '../models/model_send_money.dart';
import '../models/myprofile_model.dart';
import '../models/save_card_model.dart';
import '../models/save_transastion_model.dart';
import '../repository/add_fund_repo.dart';
import '../repository/card_details_repo.dart';
import '../repository/create_card_holder_repo.dart';
import '../repository/create_card_repo.dart';
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
import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';
import 'number_controller.dart';

class ProfileController extends GetxController {
  final numbercontroller = Get.put(numberController());
  // final registorController = Get.put(registerController());

  String resulttext = "0";
  Rx<ModelConversion> modelConversion = ModelConversion().obs;
  Rx<RxStatus> statusOfConversion = RxStatus.empty().obs;

  Rx<ModelRate> modelRate = ModelRate().obs;
  Rx<RxStatus> statusOfRate= RxStatus.empty().obs;
  Future  exchangeRate() async {
    await getRateRepo()
        .then((value) {
      modelRate.value = value;
      if (value.status == "success") {
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
        amount: fundAmountController.text.trim(),
        about: "Fund To Account ",
        user_id:  modal.value.data!.user!.id.toString(),
        // complete_response: purchaseData.value.data!.toJson(),
        context: context,
        description: "Fund To account ",
        type: "dr")
        .then((value) {
      log("response.body.....    ${value}");
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

  Future addFund(context) async {

    await addFundRepo(
      card_id:  card.value.data!.cardId.toString(),
    currency: "USD",
      amount: resulttext.toString(),
      context: context,
      transaction_reference:  card.value.data!.cardId.toString()+DateTime.now().millisecondsSinceEpoch.toString(),
    ).then((value) {
      addFundCard.value = value;
      if (value.status == "success") {
        log("CardId${cardId.value}");
        statusOfFund.value = RxStatus.success();

        saveListFund(context);
        getCurrentBalance();
        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());

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

        amount: amountController2.text.trim(),
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
    }}


  TextEditingController phone2Controller = TextEditingController();
  TextEditingController description2Controller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phone1Controller = TextEditingController();

  TextEditingController ziptag1Controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController airtimeController = TextEditingController();
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
  Rx<ProfileModel> modal = ProfileModel().obs;
  Rx<RxStatus> statusOfProfile = RxStatus.empty().obs;
  getData() {
    myProfileRepo().then((value) async {
      modal.value = value;
      if (value.status == true) {
        SharedPreferences pref = await SharedPreferences.getInstance();

        pref.setString('uniqueIdentifier',  modal.value.data!.user!.uniqueId.toString());
        fNameController.text = modal.value.data!.user!.fname.toString();
        lNameController.text = modal.value.data!.user!.lname.toString();
        zipController.text = modal.value.data!.user!.zipTag.toString();
        dobController.text = modal.value.data!.user!.dob.toString();
        emailController.text = modal.value.data!.user!.email.toString();
        mobileController.text = modal.value.data!.user!.phone.toString();
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

      print(value.message.toString());
    });
  }

  String base64Image = "";
  ///////update profile
  Future holder() async {
    print("sdggfrdh");
    print(
      modal.value.data!.user!.phone.toString(),
    );
    await cardHolderRepo(
      selfie_image: base64Image,
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
      bvn:bvnController.text.trim(),
      // bvnController.text.trim(),
      // bvnController.text.trim(),

      first_name: modal.value.data!.user!.fname.toString(),
      last_name: modal.value.data!.user!.lname.toString(),
    ).then((value) {
      if (value.status == "success") {
        cardHolder.value = value;
        // print("sdggfrdh");

        statusOfCardHolder.value = RxStatus.success();
        log("anjalim");
        log(cardId.toString());
        create();
        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
      } // showToast(value.message.toString());
    });
  }

  Rx<ModelCreateCard> createCard = ModelCreateCard().obs;
  Rx<RxStatus> statusOfCreate = RxStatus.empty().obs;

  Future create() async {
    await createCardRepo(
            card_brand: "Visa",
            card_currency: "USD",
            card_type: "virtual",
            cardholder_id: cardHolder.value.data!.cardholderId.toString())
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

  Rx<ModelCreateCardHolder> cardHolder = ModelCreateCardHolder().obs;
  Rx<RxStatus> statusOfCardHolder = RxStatus.empty().obs;

  //////PAyment

  Rx<RxStatus> statusOfSave = RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;



  final TextEditingController amountController = TextEditingController();
  final TextEditingController amountController1 = TextEditingController();
  final TextEditingController noteController = TextEditingController();


  TextEditingController requestPhoneController = TextEditingController();
  TextEditingController requestZiptag1Controller = TextEditingController();
  TextEditingController requestemailController = TextEditingController();
  TextEditingController requestNameController = TextEditingController();
  TextEditingController zipUserController = TextEditingController();
  Rx<RxStatus> statusOfSendMail = RxStatus.empty().obs;
  Rx<ModelSendMail> sendMail = ModelSendMail().obs;

  send() async {
    sendMailRepo(
        amount: amountController.text.trim(),
zip_user_id: userId.toString(),
        type: "request")
        .then((value) {
      log("response.body.....    ${value}");
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
  send1() async {
    sendMailRepo(
        amount: amountController.text.trim(),
zip_user_id:userId.toString(),
        type: "send")
        .then((value) {
      log("response.body.....    ${value}");
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




  saveList1(context) async {
    saveTransastionRepo(
        amount: amountController.text.trim(),
        about: noteController.text.trim(),
        user_id:  modal.value.data!.user!.id.toString(),
        // complete_response: purchaseData.value.data!.toJson(),
        context: context,
        description: noteController.text.trim(),
        type: "dr")
        .then((value) {
      log("response.body.....    ${value}");
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
            user_id: modal.value.data!.user!.id.toString(),
            send_type: "ziptozip",
            // complete_response: purchaseData.value.data!.toJson(),
            context: context,
            description: noteController.text.trim(),
            type: "cr")
        .then((value) {
      log("response.body.....    ${value}");
      save.value = value;
      if (value.status == true) {
        // saveList2(context);
       send();
        statusOfSave.value = RxStatus.success();
      } else {
        statusOfSave.value = RxStatus.error();
      }
    }
            // showToast(value.message.toString());
            );
  }

   saveList2(context) {
     saveTransastionRepo(
             user_id: modal.value.data!.user!.id.toString(),
             amount: amountController.text.trim(),
             about: noteController.text.trim(),
             send_type: "ziptozip",
             // complete_response: purchaseData.value.data!.toJson(),
             context: context,
             description: noteController.text.trim(),
             type: "dr")
         .then((value) {
       log("response.body.....    ${value}");
       save.value = value;
       if (value.status == true) {
         print(userId);
        send1();
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

      print(value.message.toString());
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

         saveCardDetails();
      } else {
        statusOfCardDetails.value = RxStatus.error();
      }

      print(value.message.toString());
    });
  }

  Rx<ModelGetCard> card = ModelGetCard().obs;
  Rx<RxStatus> statusOfCard = RxStatus.empty().obs;

    Future getCard() async {
    await getCardRepo()
        .then((value) {
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

      print(value.message.toString());
    });
  }

  Rx<GetCardBalanceModel> cardBalance = GetCardBalanceModel().obs;
  Rx<RxStatus> statusOfCardBalance = RxStatus.empty().obs;

  Future getBalance() async {
    await getCardBalanceRepo(
      card_id:  card.value.data!.cardId.toString()
    )
        .then((value) {
      if (value.status == "success") {
        statusOfCardBalance.value = RxStatus.success();
        // saveCardDetails();
        // Get.toNamed(MyRouters.cardDetails);
        // holder();
        cardBalance.value = value;
        showToast(value.message.toString());

        // saveCardDetails();
      } else {
        statusOfCardBalance.value = RxStatus.error();
        showToast(value.message.toString());
      }

      print(value.message.toString());
    });
  }
  Rx<ModelSaveCard> saveDetails = ModelSaveCard().obs;
  Rx<RxStatus> statusOfSaveDetails = RxStatus.empty().obs;

saveCardDetails() {
  saveCardRepo(card_id:cardDetails.value.data!.cardId.toString(),

     card_currency:  cardDetails.value.data!.cardCurrency.toString(),
    brand:  cardDetails.value.data!.brand.toString(),
    card_name:  cardDetails.value.data!.cardName.toString(),
    card_number: cardDetails.value.data!.cardNumber.toString(),
    cvv: cardDetails.value.data!.cvv.toString(),
    expiry_month:   cardDetails.value.data!.expiryMonth.toString(),
    expiry_year:   cardDetails.value.data!.expiryYear.toString(),
    last_4:    cardDetails.value.data!.last4.toString(),

    // cardId.value
    // createCard.value.data!.cardId.toString()
  )
      .then((value) {
    if (value.status == true) {
      statusOfSaveDetails.value = RxStatus.success();
      // Get.toNamed(MyRouters.cardDetails);
      // holder();
      saveDetails.value = value;
    } else {
      statusOfSaveDetails.value = RxStatus.error();
    }

    print(value.message.toString());
  });
}



  Rx<ModelFreezeCard> cardFreeze = ModelFreezeCard().obs;
  Rx<RxStatus> statusOfCardfreeze = RxStatus.empty().obs;

  frozenCard() {
    freezeCardRepo(card_id:  card.value.data!.cardId.toString()
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

      print(value.message.toString());
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
