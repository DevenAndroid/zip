

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/create_virtual_account_model.dart';
import '../models/model_update_user.dart';
import '../models/verify_africa.dart';
import '../repository/user_update_repo.dart';
import '../repository/verify_africa_b.dart';
import '../repository/vritual_account_repo.dart';
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
  String selectedValuem = "";
///api


  File image = File("");
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
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
      accountVritual(context);

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

  TextEditingController emailController = TextEditingController();
  TextEditingController molileController = TextEditingController();
  // Rx<ModelCreateVritualAccount> vritualAccount = ModelCreateVritualAccount().obs;
  Rx<CreateVirtualAccountModel> virtualAccount = CreateVirtualAccountModel().obs;
  Rx<RxStatus> statusOfAccount= RxStatus.empty().obs;
  Future accountVritual(context) async {
    await accountRepo(
        bvn:numbercontroller.isNumberBvn ? numbercontroller.numberBvn:numbercontroller.emailBvn,
email:emailController.text.trim() ,
phonenumber:molileController.text.trim() ,
        firstName:  firstNameController.text.trim(),
        lastName:  lastNameController.text.trim(),
        channel:  selectedValuem,
        accountType: "individual",
        context: context
    ).then((value) {
      virtualAccount.value = value;
      statusOfAccount.value = RxStatus.success();
      // accountVritualVerify(context);
      Get.toNamed(MyRouters.otpScreen,);
      showToast(value.message.toString());
print(virtualAccount.value = value);

      // Get.toNamed(MyRouters.otpScreen,);

    }
      // showToast(value.message.toString());
    );
  }





  // Rx<ModelVerifyVritualAccount> verifyVritualAccount = ModelVerifyVritualAccount().obs;
  // Rx<RxStatus> statusOfAccountVerify= RxStatus.empty().obs;
  // Future accountVritualVerify(context) async {
  //   await verifyAccountRepo(
  //    account_number: vritualAccount.value.data!.accountNumber.toString(),
  //       bank_name:  vritualAccount.value.data!.bankName.toString(),
  //       flw_ref: vritualAccount.value.data!.flwRef.toString(),
  //       frequency: vritualAccount.value.data!.frequency.toString(),
  //       order_ref: vritualAccount.value.data!.orderRef.toString(),
  //       phone_email:numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
  //       context: context
  //   ).then((value) {
  //     verifyVritualAccount.value = value;
  //     statusOfAccountVerify.value = RxStatus.success();
  //     Get.toNamed(MyRouters.otpScreen,);
  //     showToast(value.message.toString());
  //
  //
  //
  //   }
  //     // showToast(value.message.toString());
  //   );
  // }
}
