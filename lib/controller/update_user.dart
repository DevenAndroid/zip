

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/model_choose_bank.dart';
import '../models/model_setting.dart';
import '../models/model_update_user.dart';
import '../models/verify_africa.dart';
import '../repository/choose_bank_repo.dart';
import '../repository/setting_repo.dart';
import '../repository/user_update_repo.dart';
import '../repository/verify_africa_b.dart';
import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';
import 'number_controller.dart';



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


  File image = File("");
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (image == null) return;
      if (image.path.toString().contains(".png")) {
        showToast("dsfdsf");
        return;
      }

      print(base64Image);
      final imageTemporary = File(image.path);

        List<int> imageBytes = imageTemporary.readAsBytesSync();
        print(imageBytes);
        base64Image = base64Encode(imageBytes);
        // "data:image/jpg;base64,"
        base64Image = "data:image/${image.path.split(".").last};base64,$base64Image";
        this.image = imageTemporary;

    } on PlatformException catch (e) {
      print('Field to pick img : $e');
    }
  }


  // Rx<ModelSetting> setting = ModelSetting().obs;
  // Rx<RxStatus> statusOfSetting = RxStatus.empty().obs;

  // Future getSetting() async {
  //   await settingRepo().then((value) {
  //     setting.value = value;
  //     if (value.status == true) {
  //       statusOfSetting.value = RxStatus.success();
  //     } else {
  //       statusOfSetting.value = RxStatus.error();
  //     }
  //   }
  //     // showToast(value.message.toString());
  //   );
  // }
  String base64Image = "";

  final numbercontroller = Get.put(numberController());
  Rx<ModelVerifyAfrica> modelVerifyAfrica = ModelVerifyAfrica().obs;
  Rx<RxStatus> statusOfSucess= RxStatus.empty().obs;
  Future verify(context) async {
    await verifyRepo(
        selfie: base64Image,
        phone_email:  numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
        bvn:  numbercontroller.isNumberBvn ? numbercontroller.numberBvn:numbercontroller.emailBvn,
        dob: dateOfBirthController.text.trim(),
        fname:  firstNameController.text.trim(),
        lname:  lastNameController.text.trim(),

        context: context
    ).then((value) {
      statusOfSucess.value = RxStatus.success();

showToast(value.message.toString());

      modelVerifyAfrica.value = value;
      Get.toNamed(MyRouters.otpScreen,);

    }
      // showToast(value.message.toString());
    );
  }
  updateUser(context) {
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

    }
  }

}
