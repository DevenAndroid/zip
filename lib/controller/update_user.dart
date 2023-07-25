

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/create_virtual_account_model.dart';
import '../models/fetchVirtualAccount_model.dart';
import '../models/model_checkout.dart';
import '../models/model_update_user.dart';
import '../models/model_verif_account.dart';
import '../models/verify_africa.dart';
import '../repository/fetch_account_repo.dart';
import '../repository/model_checkout_repo.dart';
import '../repository/user_update_repo.dart';
import '../repository/verify_account_reop.dart';
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
  TextEditingController amountController = TextEditingController();
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
        imageQuality: 50
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

    print(firstNameController.text.trim(),);
    print(dateOfBirthController.text.trim(),);
    print(lastNameController.text.trim(),);
    log(base64Image);
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
        channel:  "providus",
        accountType: "individual",
        context: context
    ).then((value) async {

      virtualAccount.value = value;
      if (value.success == true) {
        if (kDebugMode) {
          print(virtualAccount.value = value);
        }
        statusOfAccount.value = RxStatus.success();
        accountVritualVerify(context);
        // fetchVritualAccount(context);
        Get.toNamed(MyRouters.otpScreen,);
        showToast(value.message.toString());
        print(virtualAccount.value = value);
        SharedPreferences pref = await SharedPreferences.getInstance();

        pref.setString('business_id', virtualAccount.value.data!.sId.toString());
        // Get.toNamed(MyRouters.otpScreen,);

      }
      else {
        statusOfAccount.value = RxStatus.error();
      }
      // showToast(value.message.toString());
    });
  }
  Rx<FetchVirtualAccountModel> fetchAccount = FetchVirtualAccountModel().obs;
  Rx<RxStatus> statusOfFetchAccount= RxStatus.empty().obs;

  Future fetchVritualAccount() async {
    SharedPreferences pref =
    await SharedPreferences.getInstance();var id = pref.getString("business_id");
    log("aaaaaaaa---$id");
    await fetchAccountRepo(
        id:id.toString()

    ).then((value) {
      print(id);
      fetchAccount.value = value;
      if (value.success == true) {

        print(id);

        statusOfFetchAccount.value = RxStatus.success();
        // Get.toNamed(MyRouters.otpScreen,);
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }
  Rx<ModelCheckout> checkout = ModelCheckout().obs;
  Rx<RxStatus> statusOfCheckout= RxStatus.empty().obs;
  RxString link1 = "".obs;
  RxString code = "".obs;
  Future cashCheckout(context) async {
    await checkoutRepo(
        currency:fetchAccount.value.data!.currency.toString() ,
        email: fetchAccount.value.data!.kYCInformation!.email.toString() ,
        amount: amountController.text.trim(),
        name: "${fetchAccount.value.data!.kYCInformation!.firstName.toString() } "+" ${fetchAccount.value.data!.kYCInformation!.lastName.toString() }",
        // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
        context: context
    ).then((value) async {
      checkout.value = value;
       log(checkout.value.toString());
      if (value.status == true) {
        log("link1------${link1.value}");

        var httpClient = HttpClient();
        var request1 = await httpClient.getUrl(Uri.parse(value.data!.link));
        var response = await request1.close();
        var bytes = await consolidateHttpClientResponseBytes(response);
        String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File('$dir/${value.data!.link.split("/").last.replaceAll("%", " ")}');
      await file.writeAsBytes(bytes);
      // Share.shareFiles([file.path], text: 'Great picture');
      Share.share(value.data!.link);
        showToast(value.message.toString());
        statusOfCheckout.value = RxStatus.success();
        link1.value=value.data!.link;
        code.value=value.data!.payCode;
        Get.toNamed(MyRouters.paymentLink);

        showToast(value.message.toString());
      }
      else{
        showToast(value.message.toString());
        log("link1------${link1.value}");
      }
      // showToast(value.message.toString());
    });
  }

 Rx<ModelVerifyVritualAccount> verifyVritualAccount = ModelVerifyVritualAccount().obs;
 Rx<RxStatus> statusOfAccountVerify= RxStatus.empty().obs;
 Future accountVritualVerify(context) async {
   await verifyAccountRepo(
accountNumber: virtualAccount.value.data!.accountNumber.toString(),
       phone_email:virtualAccount.value.data!.kYCInformation!.email.toString(),
       accountType: virtualAccount.value.data!.accountType.toString(),
       accountInformation:virtualAccount.value.data!.accountInformation!.toJson(),
       business: virtualAccount.value.data!.business.toString(),
       currency: virtualAccount.value.data!.currency.toString(),
       KYCInformation: virtualAccount.value.data!.kYCInformation!.toJson(),
         business_id:  virtualAccount.value.data!.sId.toString(),
       // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
       context: context
   ).then((value) async {
     verifyVritualAccount.value = value;
     if (value.status == true) {

       statusOfAccountVerify.value = RxStatus.success();

       Get.toNamed(MyRouters.otpScreen,);
       showToast(value.message.toString());
     }
     // showToast(value.message.toString());
   });
 }
}
