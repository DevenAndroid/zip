import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/myprofile_model.dart';
import '../repository/myprofile_repo.dart';

class ProfileController extends GetxController {
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
