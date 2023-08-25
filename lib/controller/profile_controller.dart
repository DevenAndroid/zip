import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/controller/update_user.dart';

import '../models/current_balance_repo.dart';
import '../models/model_create_card.dart';
import '../models/model_create_card_holder.dart';
import '../models/model_freeze_card.dart';
import '../models/model_get_card.dart';
import '../models/model_get_card_details.dart';
import '../models/myprofile_model.dart';
import '../models/save_card_model.dart';
import '../models/save_transastion_model.dart';
import '../repository/card_details_repo.dart';
import '../repository/create_card_holder_repo.dart';
import '../repository/create_card_repo.dart';
import '../repository/freeze_card_repo.dart';
import '../repository/get_card_repo.dart';
import '../repository/get_current_balance.dart';
import '../repository/myprofile_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../repository/save_card_repo.dart';
import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';
import 'number_controller.dart';

class ProfileController extends GetxController {
  final numbercontroller = Get.put(numberController());
  final registorController = Get.put(registerController());
  String userId = "";
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
      bvn: bvnController.text.trim(),
      // bvnController.text.trim(),

      first_name: modal.value.data!.user!.fname.toString(),
      last_name: modal.value.data!.user!.lname.toString(),
    ).then((value) {
      if (value.status == "success") {
        cardHolder.value = value;
        // print("sdggfrdh");

        statusOfCardHolder.value = RxStatus.success();
        log("anjalim");
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
            card_currency: "NGN",
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

  final TextEditingController amountController = TextEditingController();
  final TextEditingController amountController1 = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  Rx<RxStatus> statusOfSave = RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;

  saveList1(context) {
    saveTransastionRepo(
            amount: amountController.text.trim(),
            about: noteController.text.trim(),
            user_id: modal.value.data!.user!.id.toString(),
            // complete_response: purchaseData.value.data!.toJson(),
            context: context,
            description: noteController.text.trim(),
            type: "dr")
        .then((value) {
      log("response.body.....    ${value}");
      save.value = value;
      if (value.status == true) {
        Get.offAllNamed(MyRouters.bottomNavbar);
        statusOfSave.value = RxStatus.success();
      } else {
        statusOfSave.value = RxStatus.error();
      }
    }
            // showToast(value.message.toString());
            );
  }

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
        saveList2(context);
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
            user_id: userId,
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
        Get.toNamed(MyRouters.bottomNavbar);
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

        // saveCardDetails();
      } else {
        statusOfCard.value = RxStatus.error();
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
    freezeCardRepo(card_id: cardId.value.toString()
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
