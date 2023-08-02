import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/myprofile_model.dart';
import '../models/save_transastion_model.dart';
import '../repository/myprofile_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../routers/my_routers.dart';

class ProfileController extends GetxController {
  String userId = "";
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
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
        statusOfProfile.value = RxStatus.success();
      } else {
        statusOfProfile.value = RxStatus.error();
      }

      print(value.message.toString());
    });
  }

  ///////update profile





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
