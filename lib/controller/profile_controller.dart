import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zip/controller/update_user.dart';

import '../models/model_create_card.dart';
import '../models/model_create_card_holder.dart';
import '../models/myprofile_model.dart';
import '../models/save_transastion_model.dart';
import '../repository/create_card_holder_repo.dart';
import '../repository/create_card_repo.dart';
import '../repository/myprofile_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';
import 'number_controller.dart';

class ProfileController extends GetxController {
  final numbercontroller = Get.put(numberController());
  final registorController = Get.put(registerController());
  String userId = "";
  TextEditingController fNameController = TextEditingController();
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
    myProfileRepo().then((value) {
      modal.value = value;
      if (value.status == true) {
        fNameController.text = modal.value.data!.user!.fname.toString();
        lNameController.text = modal.value.data!.user!.lname.toString();
        zipController.text = modal.value.data!.user!.zipTag.toString();
        dobController.text = modal.value.data!.user!.dob.toString();
        emailController.text = modal.value.data!.user!.email.toString();
        mobileController.text = modal.value.data!.user!.phone.toString();
        // registorController.molileController.text = modal.value.data!.user!.phone.toString();
        bvnController.text = modal.value.data!.user!.bvn.toString();
        addressController.text = modal.value.data!.user!.address!.streetName.toString();
        houseNumberController.text = modal.value.data!.user!.address!.houseNumber.toString();
        cityController.text = modal.value.data!.user!.address!.city.toString();
        postalCodeController.text = modal.value.data!.user!.address!.postalCode.toString();
        countryController.text = modal.value.data!.user!.address!.country.toString();
        stateController.text = modal.value.data!.user!.address!.state.toString();
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
    print(modal.value.data!.user!.phone.toString(),);
    await cardHolderRepo(
      selfie_image:  base64Image,
      email_address: emailController.text.trim(),
      address:  addressController.text.trim(),
      house_no:houseNumberController.text.trim(),
      city: cityController.text.trim(),
      phone:modal.value.data!.user!.phone.toString(),
      country: "Nigeria",
      postal_code:postalCodeController.text.trim(),
      id_type: "NIGERIAN_BVN_VERIFICATION",
      state: "Abia",
      // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
      bvn: bvnController.text.trim(),

      first_name:  modal.value.data!.user!.fname.toString(),
      last_name:  modal.value.data!.user!.lname.toString(),

    ).then((value) {
      cardHolder.value = value;
      if (value.status == true) {
        print("sdggfrdh");
        statusOfCardHolder.value = RxStatus.success();

        showToast(value.message.toString());

        create();
      }
      else {
        showToast(value.message.toString());
      }      // showToast(value.message.toString());
    });
  }
  Rx<ModelCreateCard> createCard = ModelCreateCard().obs;
  Rx<RxStatus> statusOfCreate = RxStatus.empty().obs;

  Future create() async {
    await createCardRepo(
        card_brand: "Visa",
        card_currency: "NGN",
        card_type: "Vritual",
        cardholder_id: cardHolder.value.data!.cardholderId.toString())
        .then((value) {
      createCard.value = value;
      if (value.status == true) {
        statusOfCreate.value = RxStatus.success();

        showToast(value.message.toString());
      }
      else{
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



  Rx<RxStatus> statusOfSave= RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;

  saveList1(context) {
    saveTransastionRepo(
        amount:amountController.text.trim(),
        about: noteController.text.trim(),
        user_id: modal.value.data!.user!.id.toString(),
        // complete_response: purchaseData.value.data!.toJson(),
        context: context,
        description:noteController.text.trim(),
        type: "cr"
    ).then((value) {
      log("response.body.....    ${value}");
      save.value = value;
      if (value.status == true) {
        Get.toNamed(MyRouters.bottomNavbar);
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
        amount:amountController.text.trim(),
        about: noteController.text.trim(),
        user_id: modal.value.data!.user!.id.toString(),
        send_type: "ziptozip",
        // complete_response: purchaseData.value.data!.toJson(),
        context: context,
        description:noteController.text.trim(),
        type: "cr"
    ).then((value) {
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
        user_id:userId ,
        amount:amountController.text.trim(),
        about: noteController.text.trim(),
        send_type: "ziptozip",
        // complete_response: purchaseData.value.data!.toJson(),
        context: context,
        description:noteController.text.trim(),
        type: "dr"
    ).then((value) {
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
