
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/create_benificiary.dart';
import '../models/model_create_payout.dart';
import '../models/model_get_binificery.dart';
import '../repository/benificery_list _repo.dart';
import '../repository/create_benifiary_repo.dart';
import '../repository/payout_repo.dart';
import '../resourses/api_constant.dart';

class PayoutController extends GetxController {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController paymentDestinationController = TextEditingController();
  TextEditingController destinationAddressController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController1 = TextEditingController();
  Rx<CreateBenificiryModel> CreateBenificiry = CreateBenificiryModel().obs;
  Rx<RxStatus> statusOfBenificiry= RxStatus.empty().obs;
  Future CreateBenificery() async {
    await createBenificiryRepo(
      email: emailController1.text.trim(),
        currency: currencyController.text.trim(),
        accountHolderName:accountHolderNameController.text.trim() ,
        destinationAddress: destinationAddressController.text.trim() ,
        firstName:firstNameController.text.trim() ,
        lastName:lastNameController.text.trim() ,
        paymentDestination:"bank_account"  ,
        type:selectedValue  ,


      businessID: '64529bd2bfdf28e7c18aa9da'
    ).then((value) {
      CreateBenificiry.value = value;
      if (value.success == true) {
        statusOfBenificiry.value = RxStatus.success();

        Get.back();
        showToast(value.message.toString());
      }
      else{
        statusOfBenificiry.value = RxStatus.success();
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }









  Rx<RxStatus> statusOfList = RxStatus.empty().obs;
  Rx<GetBenificiryModel> addRecipitentsList = GetBenificiryModel().obs;

  getDataList() {
    getListRepo(
        businessID: "64529bd2bfdf28e7c18aa9da"
    ).then((value) {

      log("response.body.....    ${value}");
      addRecipitentsList.value = value;
      if (value.success == true) {
        statusOfList.value = RxStatus.success();
      } else {
        statusOfList.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }

  String selectedValue = "individual";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataList();
  }


}