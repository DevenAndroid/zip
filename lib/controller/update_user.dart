

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/model_choose_bank.dart';
import '../models/model_update_user.dart';
import '../repository/choose_bank_repo.dart';
import '../repository/user_update_repo.dart';
import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';



class registerController extends GetxController {
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();
  Rx<RxStatus> statusOfUpdate = RxStatus.empty().obs;
  Rx<ModelUpdateUser> userUpdate = ModelUpdateUser().obs;
  RxString genderType = "".obs;

  updateUser() {
    userUpdateRepo(

        birth_place: regionController.text.trim(),
        dob: dateOfBirthController.text.trim(),
        fname:  firstNameController.text.trim(),
        lname:  lastNameController.text.trim(),
        nationality:  countryController.text.trim(),
        gender:  genderType.value,
        pin: otpcontroller.text.trim(),
        zip_tag: zipController.text.trim()+"@zip"


    ).then((value) {
      userUpdate.value = value;
      if (value.status == true) {
        Get.toNamed(MyRouters.bottomNavbar,);
        statusOfUpdate.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfUpdate.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }

    );

    // if(value.status=="success"){
    //   statusOfChooseBank.value.isSuccess;
    // }
    // Get.toNamed(MyRouters.bottomNavbar);


    @override
    void onInit() {
      // TODO: implement onInit
      super.onInit();
      updateUser();
    }
  }

}
