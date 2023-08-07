
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:zip/controller/update_user.dart';
import 'package:zip/routers/my_routers.dart';

import '../models/create_benificiary.dart';
import '../models/model_create_payout.dart';
import '../models/model_get_binificery.dart';
import '../models/model_save_bank_detilks.dart';
import '../repository/benificery_list _repo.dart';
import '../repository/create_b_repo.dart';
import '../repository/create_benifiary_repo.dart';
import '../repository/payout_repo.dart';
import '../repository/save_bank_details_repo.dart';
import '../resourses/api_constant.dart';

class PayoutController extends GetxController {
  final controller = Get.put(registerController());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController paymentDestinationController = TextEditingController();
  TextEditingController destinationAddressController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController1 = TextEditingController();
  Rx<CreateBenificiryModel> CreateBenificiry = CreateBenificiryModel().obs;
  Rx<CreateBenificiryModel> CreateBenificiry1 = CreateBenificiryModel().obs;
  Rx<RxStatus> statusOfBenificiry= RxStatus.empty().obs;
  TextEditingController accountName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController Amount = TextEditingController();
  TextEditingController accountNo = TextEditingController();
  TextEditingController meterNo = TextEditingController();
  Future CreateBenificery() async {
    await createBenificiryRepo(
        name:controller.bankController.text.trim() ,
        destinationAddress: accountNo.text.trim(),
        firstName:accountName.text.trim() ,
        accountHolderName: accountName.text.trim(),



      businessID: '64529bd2bfdf28e7c18aa9da'
    ).then((value) {
      CreateBenificiry.value = value;
      if (value.success == true) {
        statusOfBenificiry.value = RxStatus.success();

        Get.back();
        Get.back();
        Get.back();
        showToast(value.message.toString());
        getDataList();

      }
      else{
        statusOfBenificiry.value = RxStatus.success();
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }
  Future save(context) async {
    print("ifhuifhifhiuhfd");
    await createBRepo(
        name:controller.bankController1.text.trim() ,
        destinationAddress: accountNo.text.trim(),
        firstName:accountName.text.trim() ,
        accountHolderName: accountName.text.trim(),



        businessID: '64529bd2bfdf28e7c18aa9da'
    ).then((value) {
      CreateBenificiry1.value = value;
      if (value.success == true) {

        print("ifhuifhifhrfvrfvrfvrfvrfvrfvrfvrfvrfvrfvrfvrfvrfvrfvrfvrfvrfvrfvtiuhfd");
        saveDetails(context);
        statusOfBenificiry.value = RxStatus.success();



        showToast(value.message.toString());

      }
      else{
        statusOfBenificiry.value = RxStatus.success();
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }




  Rx<ModelSaveBankDetails> saveBankDetails = ModelSaveBankDetails().obs;
  Rx<RxStatus> statusOfSaveDetails= RxStatus.empty().obs;

  Future saveDetails(context) async {
    await saveBankRepo(
        bank_name: controller.bankController1.text.trim() ,
        destinationAddress: accountNo.text.trim(),
        firstName:accountName.text.trim() ,
     context: context,



    ).then((value) {
      saveBankDetails.value = value;
      if (value.status == true) {
        statusOfSaveDetails.value = RxStatus.success();

        Get.toNamed(MyRouters.sendCashYourBalance);


        showToast(value.message.toString());

      }
      else{
        statusOfSaveDetails.value = RxStatus.success();
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