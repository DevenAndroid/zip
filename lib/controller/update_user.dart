import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zip/controller/profile_controller.dart';

import '../models/africa_verify_model.dart';
import '../models/create_virtual_account_model.dart';
import '../models/fetchVirtualAccount_model.dart';
import '../models/modelAfricaLive.dart';
import '../models/model_bank_details.dart';
import '../models/model_checkout.dart';
import '../models/model_create_card.dart';
import '../models/model_create_card_holder.dart';
import '../models/model_create_contact.dart';
import '../models/model_face_match.dart';
import '../models/model_get_live_image.dart';
import '../models/model_get_verify_africa.dart';
import '../models/model_update_address.dart';
import '../models/model_update_user.dart';
import '../models/model_verif_account.dart';
import '../models/request_money_mail_model.dart';
import '../models/save_freshwork_id_model.dart';
import '../models/save_transastion_model.dart';
import '../models/update_contact_model.dart';
import '../models/verify_africa.dart';
import '../repository/africaLive_repo.dart';
import '../repository/africa_face_match_repo.dart';
import '../repository/africa_verify_repo.dart';
import '../repository/create_card_holder_repo.dart';
import '../repository/create_card_repo.dart';
import '../repository/create_contact_repo.dart';
import '../repository/fetch_account_repo.dart';
import '../repository/get_africaDetails_repo.dart';
import '../repository/get_live_image_repo.dart';
import '../repository/model_checkout_repo.dart';
import '../repository/request_money_mail_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../repository/save_freshwork_repo.dart';
import '../repository/save_image_repo.dart';
import '../repository/update_address_repo.dart';
import '../repository/update_contact_repo.dart';
import '../repository/update_profile_repo.dart';
import '../repository/user_update_repo.dart';
import '../repository/verify_account_reop.dart';
import '../repository/verify_africa_b.dart';
import '../repository/vritual_account_repo.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../routers/my_routers.dart';
import 'loan_controller.dart';
import 'number_controller.dart';

class registerController extends GetxController {
  TextEditingController bankController = TextEditingController();
  TextEditingController variationAmountController = TextEditingController();
  TextEditingController bankController1 = TextEditingController();
  TextEditingController mobileNO = TextEditingController();
  TextEditingController amount = TextEditingController();
  final meterNo = TextEditingController();
  final provider = TextEditingController();
  final provider1 = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController idController1 = TextEditingController();
String targetImage= "";

  TextEditingController amount1Controller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController descriptionController1 = TextEditingController();
  TextEditingController sourceCurrencyController = TextEditingController();
  TextEditingController destinationCurrencyController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController phoneController1 = TextEditingController();
  TextEditingController amountController1 = TextEditingController();


  Rx<RxStatus> statusOfaddress = RxStatus.empty().obs;
  Rx<ModelUpdateAddress> userAdderss = ModelUpdateAddress().obs;
  final formKeyAddressField = GlobalKey<FormState>();
  Rx<ModelVerifyAfrica> modelVerifyAfrica = ModelVerifyAfrica().obs;


  Rx<RxStatus> statusOfSucess = RxStatus.empty().obs;
  TextEditingController emailNoController = TextEditingController();
  TextEditingController BVNController = TextEditingController();

  Rx<ModelAfricaLive> liveAfricaModel = ModelAfricaLive().obs;
  Rx<RxStatus> statusOfLiveAfrica = RxStatus.empty().obs;
  Rx<ModelLiveImage> modalLiveImage = ModelLiveImage().obs;
  Rx<RxStatus> statusOfLiveImage = RxStatus.empty().obs;
  liveImage(context) {
    getLiveImageRepo().then((value) async {
      modalLiveImage.value = value;
      if (value.status == true) {
        liveUserImage = modalLiveImage.value.data!.userImage.toString();
        // liveUserImage = modalLiveImage.value.data!.userImage.toString();
        log("Image::::::::::::::"+liveUserImage);
        liveAfricaDetails(context);
        //     (await networkImageToBase64( modal.value.data!.avatar.toString())) ?? "";
        // if(avtar.isNotEmpty){
        //   avtar = "data:image/${modal.value.data!.avatar.toString().split(".").last};base64,$avtar";
        // }
        // holder();
      } else {
        statusOfLiveImage.value = RxStatus.error();
      }

      print(value.message.toString());
    });
  }
  liveImage1(context) {
    getLiveImageRepo().then((value) async {
      modalLiveImage.value = value;
      if (value.status == true) {

        liveUserImage = modalLiveImage.value.data!.userImage.toString();
        profileController.liveUserImage1 = modalLiveImage.value.data!.userImage.toString();
        log("Image::::::::::::::"+liveUserImage);
        liveAfricaDetails1(context);
         //     (await networkImageToBase64( modal.value.data!.avatar.toString())) ?? "";
         // if(avtar.isNotEmpty){
         //   avtar = "data:image/${modal.value.data!.avatar.toString().split(".").last};base64,$avtar";
         // }
        // holder();
      } else {
        statusOfLiveImage.value = RxStatus.error();
      }

      print(value.message.toString());
    });
  }


  saveImage(context) async {
    // await image.rename(image.path.split(".").first+".jpg");
    liveImageRepo(
      fieldName1: 'user_image',
      context: context,
      file1: image,
    ).then((value) {
      if (value.status == true) {
        print(image);
        // accountVritual(context);
         liveImage(context);

      }
      showToast(value.message.toString());
    });
  }
  saveImage1(context) async {
    liveImageRepo(
      fieldName1: 'user_image',
      context: context,
      file1: image,
    ).then((value) {
      if (value.status == true) {
        liveImage1(context);

      }
      showToast(value.message.toString());
    });
  }
  liveAfricaDetails(context) {

    africaLiveRepo(
        verificationType:"PASSIVE-LIVELINESS-VERIFICATION",
        selfie:liveUserImage.toString(),
        context: context
    ).then((value) {

      liveAfricaModel.value = value;
      // if (value.description == "Success") {
        if (value.response!.popScore! < 60.00) {
          statusOfLiveAfrica.value = RxStatus.success();
          showToast(value.response!.popScore!.toString());
          liveAfricaMatch(context);

        }




        // showToast("LIVELINESS api hit::::"+value.response!.popScore.toString());

       else {
        statusOfLiveAfrica.value = RxStatus.error();
        showToast("your image is not live ");
      }
    }

    );

  }
  liveAfricaDetails1(context) {

    africaLiveRepo(
        verificationType:"PASSIVE-LIVELINESS-VERIFICATION",
        selfie:liveUserImage.toString(),
        context: context
    ).then((value) {

      liveAfricaModel.value = value;
      // if (value.description == "Success") {


        if (value.response!.popScore! < 60.00) {
          showToast(value.response!.popScore!.toString());
          statusOfLiveAfrica.value = RxStatus.success();
          liveAfricaMatch(context);

        }

        // showToast("LIVELINESS api hit::::"+value.response!.popScore.toString());

       else {
        statusOfLiveAfrica.value = RxStatus.error();
        showToast("your image is not live ");
      }
    }

    );

  }

  Rx<ModelAfricaVerify> africaVerify = ModelAfricaVerify().obs;
  Rx<RxStatus> statusOfVerify = RxStatus.empty().obs;
  verifyAfrica(context) {

    verificationAfricaRepo(
user_id: userId1.toString(),
        verificationStatus: africaFace.value.verificationStatus.toString(),
        context: context,

    ).then((value) {

      africaVerify.value = value;
      if (value.status == true) {
print("aasssddffgghhk"+verificationStatus.toString(),);

        statusOfVerify.value = RxStatus.success();
Get.toNamed(MyRouters.otpScreen);

        showToast(value.message.toString());
      } else {
        Get.toNamed(MyRouters.otpScreen);
        statusOfVerify.value = RxStatus.error();

        showToast(value.message.toString());
      }
    }

    );

  }

  Rx<ModelAfricaFaceMatch> africaFace = ModelAfricaFaceMatch().obs;
  Rx<RxStatus> statusOfMatch = RxStatus.empty().obs;
  liveAfricaMatch(context) {

    africaFaceRepo(
        verificationType:"FACEMATCH-VERIFICATION",
        selfie:liveUserImage.toString(),
        // liveUserImage.toString(),
        context: context,
     // targetImage: "data:image/jpg;base64,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"
    targetImage: "data:image/jpg;base64,"+avtar.toString()
    ).then((value) {

      africaFace.value = value;

      if (value.response!.message == "Match") {
      print("FACEMATCH-VERIFICATION");
        statusOfMatch.value = RxStatus.success();

        accountVritual(context);
      showToast("FACEMATCH-VERIFICATION api hit::::");
        showToast(value.response!.message.toString());
      } else {
        verifyAfrica(context);
        statusOfMatch.value = RxStatus.error();

        showToast(value.description.toString());
      }
    }

    );

  }
  liveAfricaMatch1(context) {

    africaFaceRepo(
        verificationType:"FACEMATCH-VERIFICATION",
        selfie:liveUserImage.toString(),
        context: context,
      targetImage: "data:image/jpg;base64,"+avtar.toString()
    ).then((value) {

      africaFace.value = value;
      if (value.response!.message == "Match") {

print("FACEMATCH-VERIFICATION");
        statusOfMatch.value = RxStatus.success();
accountVritual(context);
showToast("FACEMATCH-VERIFICATION api hit::::");
        showToast(value.response!.message.toString());
      } else {
        statusOfMatch.value = RxStatus.error();

        showToast(value.description.toString());
      }
    }

    );

  }




  String userId = "";


  updateUserAddress(context) {
    updateAddressRepo(
      street_name: streetController.text.trim(),
      context: context,
      // additional: additionalController.text.trim(),
      city: cityController.text.trim(),
      country: countryController.text.trim(),
      house_number: houseNoController.text.trim(),
      postal_code: postalCodeController.text.trim(),
      state: stateController.text.trim(),
    ).then((value) {
      userAdderss.value = value;
      if (value.status == true) {
        Get.toNamed(MyRouters.countryScreen);
        statusOfaddress.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfaddress.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }




  Rx<RxStatus> statusOfContact = RxStatus.empty().obs;
  Rx<ModelCreateContact> createContact = ModelCreateContact().obs;
  contactCreate(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var uniqueIdentifier= pref.getString("uniqueIdentifier");
    showToast("Contact api before");
    createContactRepo(
      emails: emailController.text.trim() ,
      first_name: firstNameController.text.trim(),
      last_name: lastNameController.text.trim(),
      mobile_number:molileController .text.trim(),
      cf_product_type: "New Customer",
      cf_customer_id: uniqueIdentifier,
      last_source: "in-App",

      context: context,
    ).then((value) {
// print("uniqueIdentifier:::::::::::::::;"+uniqueIdentifier!);
      showToast("Contact api after");
      createContact.value = value;
      print("email:::::::::"+emailController.text.toString());
      contactIdSave(context);

      statusOfContact.value = RxStatus.success();
       showToast("Contact created sucessfully  ");

    });
  }
  contactCreate1(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var uniqueIdentifier= pref.getString("uniqueIdentifier");
    showToast("Contact api before");
    createContactRepo(
      emails:emailController.text.trim() ,
      first_name: firstNameController.text.trim(),
      last_name: lastNameController.text.trim(),
      mobile_number:molileController .text.trim(),
      cf_product_type: "New Customer",
      cf_customer_id: uniqueIdentifier,
      last_source: "in-App",

      context: context,
    ).then((value) {
      showToast("Contact api after");
      createContact.value = value;
      print("email:::::::::"+emailController.text.toString());
      contactIdSave1(context);

      statusOfContact.value = RxStatus.success();
        showToast("Contact Created Sucessfully ");

    });
  }
  Rx<RxStatus> statusOfId = RxStatus.empty().obs;
  Rx<SaveFreshworkModel> saveId = SaveFreshworkModel().obs;
  contactIdSave1(context) {
    saveIdRepo(
      freshwork_id: createContact.value.contact!.id.toString()
    ).then((value) {
      saveId.value = value;
      Get.toNamed(
        MyRouters.otpScreen,
      );
      statusOfContact.value = RxStatus.success();
      showToast("Contact save Sucessfully ");

    });
  }
  contactIdSave(context) {
    saveIdRepo(
      freshwork_id: createContact.value.contact!.id.toString()
    ).then((value) {
      saveId.value = value;
      verifyAfrica(context);
      statusOfContact.value = RxStatus.success();
      showToast("Contact save Sucessfully ");

    });
  }
  final loanController = Get.put(LoanController());
  Rx<RxStatus> statusOfUpdateContact = RxStatus.empty().obs;
  Rx<ModelUpdateContact> updateContact = ModelUpdateContact().obs;
  contactUpdate(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var uniqueIdentifier= pref.getString("uniqueIdentifier");
    updateContactRepo(
      cf_customer_id: uniqueIdentifier,
      mobile_number:profileController.mobileController.text.trim(),
      cf_product_type: "Loan Application",
      id:profileController.saveIdController.text.trim(),

      context: context,
    ).then((value) {
      updateContact.value = value;
      print( "ID:::::::::::::::::"+profileController.saveIdController.text.trim(),);
      loanController.loan(context);
      // Get.toNamed(
      //   MyRouters.birthdayScreen,
      // );
      statusOfUpdateContact.value = RxStatus.success();
      // showToast("Contact update Sucessfully ");

    });
  }

  contactUpdateCard(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var uniqueIdentifier= pref.getString("uniqueIdentifier");
    updateContactRepo(
      cf_customer_id: uniqueIdentifier,
      mobile_number:profileController.mobileController.text.trim(),
      cf_product_type: "Virtual Card",
      id: profileController.saveIdController.text.trim(),

      context: context,

    ).then((value) {

      updateContact.value = value;
      print( profileController.saveIdController.text.trim(),);
      profileController. holder();
      // Get.toNamed(
      //   MyRouters.birthdayScreen,
      // );
      statusOfUpdateContact.value = RxStatus.success();
      // showToast("Contact update Sucessfully ");

    });
  }

  TextEditingController AddmobileController = TextEditingController();
  TextEditingController AddNameController = TextEditingController();
  TextEditingController AddEmailController = TextEditingController();



    TextEditingController otpcontroller = TextEditingController();
  TextEditingController amountController = TextEditingController();
  Rx<RxStatus> statusOfUpdate = RxStatus.empty().obs;
  Rx<ModelUpdateUser> userUpdate = ModelUpdateUser().obs;
  RxString genderType = "".obs;
  String selectedValuem = "";

  Future<String?> networkImageToBase64(String imageUrl) async {
    http.Response response = await http.get(Uri.parse(imageUrl));
    final bytes = response.bodyBytes;
    return (bytes != null ? base64Encode(bytes) : null);
  }



  ///api
  ///
  ///

  File image = File("");

  Future pickImage() async {
    var maxFileSizeInBytes = 2 * 1048576;
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 10,);

      if (image == null) return;
      if (image.path.toString().contains(".png")) {
        // showToast("dsfdsf");
        return;
      }

      final imageTemporary = File(image.path);

      List<int> imageBytes = imageTemporary.readAsBytesSync();
      base64Image = base64Encode(imageBytes);
      // "data:image/jpg;base64,"
      base64Image =
          "data:image/${image.path.split(".").last};base64,$base64Image";
      this.image = imageTemporary;
    } on PlatformException catch (e) {}
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
  Rx<ModelCreateCardHolder> cardHolder = ModelCreateCardHolder().obs;
  Rx<RxStatus> statusOfCardHolder = RxStatus.empty().obs;

  Future verify(context) async {
    log(base64Image);
    await verifyRepo(
            selfie: base64Image,
            phone_email: numbercontroller.isNumber
                ? numbercontroller.number
                : numbercontroller.email,
            bvn: numbercontroller.isNumberBvn
                ? numbercontroller.numberBvn
                : numbercontroller.emailBvn,
            dob: dateOfBirthController.text.trim(),
            fname: firstNameController.text.trim(),
            lname: lastNameController.text.trim(),
            context: context)
        .then((value) {
      if (value.status == true) {
        statusOfSucess.value = RxStatus.success();
        liveAfricaDetails(context);
        showToast(value.message.toString());

        modelVerifyAfrica.value = value;



      }
      else{

        liveAfricaDetails(context);
        // showToast("not verify plz verify again ");
      }
      // showToast(value.message.toString());
    }    );
  }
  Future verify1(context) async {


    log(base64Image);
    await verifyRepo(
            selfie: base64Image,
            phone_email: numbercontroller.isNumber
                ? numbercontroller.number
                : numbercontroller.email,
            bvn: numbercontroller.isNumberBvn
                ? numbercontroller.numberBvn
                : numbercontroller.emailBvn,
            dob: dateOfBirthController.text.trim(),
            fname: firstNameController.text.trim(),
            lname: lastNameController.text.trim(),
            context: context)
        .then((value) {
      if (value.status == true) {
        statusOfSucess.value = RxStatus.success();

        showToast(value.message.toString());
        liveAfricaDetails(context);
        modelVerifyAfrica.value = value;
        accountVritual1(context);
      }
      else{
        liveAfricaDetails(context);
        // showToast("not verify plz verify again ");
        // showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    }  );
  }

  String base64Image = "";
  String base64Image1 = "data:image/jpg;base64,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";

  final numbercontroller = Get.put(numberController());












  Future holder() async {
    print("sdggfrdh");
    await cardHolderRepo(
      // selfie_image:image.toString(),
      email_address: emailController.text.trim(),
      address: cityController.text.trim(),
      house_no: houseNoController.text.trim(),
      city: cityController.text.trim(),
      phone: molileController.text.trim(),
      country: countryController.text.trim(),
      postal_code: postalCodeController.text.trim(),
      id_type: "NIGERIAN_BVN_VERIFICATION",
      user_id:   userId1.toString(),
      state: stateController.text.trim(),
      // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
      bvn: numbercontroller.isNumberBvn
          ? numbercontroller.numberBvn
          : numbercontroller.emailBvn,

      first_name: firstNameController.text.trim(),
      last_name: lastNameController.text.trim(),

    ).then((value) {
      cardHolder.value = value;
      if (value.status == "success") {
        print("sdggfrdh");
        statusOfCardHolder.value = RxStatus.success();

        showToast(value.message.toString());

        // create(context);
      }
      else {
        showToast(value.message.toString());
      }      // showToast(value.message.toString());
    });
  }

  Rx<ModelCreateCard> createCard = ModelCreateCard().obs;
  Rx<RxStatus> statusOfCreate = RxStatus.empty().obs;

  Future create(context) async {
    await createCardRepo(
            card_brand: "Visa",
            card_currency: "NGN",
            card_type: "Vritual",
            cardholder_id: cardHolder.value.data!.cardholderId.toString(),
    context: context,
    )
        .then((value) {
      createCard.value = value;
      if (value.status == "success") {
        statusOfCreate.value = RxStatus.success();

        showToast(value.message.toString());
      }
      else{
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }



/////////////////////////////////
  String userId1 = "";
  String liveUserImage = "";
  String verificationStatus = "";
  String avtar = "";
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController countryController1 = TextEditingController();
  TextEditingController regionController = TextEditingController();

  TextEditingController streetController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController nationalController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  /////////////////////////////////




  Rx<ModelGetAfrica> modal = ModelGetAfrica().obs;
  Rx<RxStatus> statusOfAfricaDetails = RxStatus.empty().obs;
  getData() {
    getAfricaApiRepo(Id: userId1.toString()).then((value) async {
      modal.value = value;
      if (value.status == true) {
        firstNameController.text = modal.value.data!.firstName.toString();
        lastNameController.text = modal.value.data!.lastName.toString();
        dateOfBirthController.text = modal.value.data!.dob.toString();
        molileController.text = modal.value.data!.phone.toString();
        countryController.text = modal.value.data!.country.toString();
        nationalController.text = modal.value.data!.nationality.toString();
        streetController.text = modal.value.data!.stateOfResidence.toString();
        stateController.text = modal.value.data!.stateOfOrigin.toString();
        cityController.text = modal.value.data!.lgaOfResidence.toString();
        firstNameController.text = modal.value.data!.firstName.toString();
        regionController.text = modal.value.data!.lgaOfOrigin.toString();
        avtar = modal.value.data!.avatar.toString();
        //     (await networkImageToBase64( modal.value.data!.avatar.toString())) ?? "";
        // if(avtar.isNotEmpty){
        //   avtar = "data:image/${modal.value.data!.avatar.toString().split(".").last};base64,$avtar";
        // }
        // holder();
      } else {
        statusOfAfricaDetails.value = RxStatus.error();
      }

      print(value.message.toString());
    });
  }


  updateUser(context) {
    userUpdateRepo(
            birth_place: regionController.text.trim(),
            dob: dateOfBirthController.text.trim(),
            fname: firstNameController.text.trim(),
            lname: lastNameController.text.trim(),
            nationality: countryController1.text.trim(),
            gender: genderType.value,
            pin: otpcontroller.text.trim(),
            zip_tag: zipController.text.trim() + "@zip")
        .then((value) {
      userUpdate.value = value;
      if (value.status == true) {
        Get.offAllNamed(
          MyRouters.bottomNavbar,
        );
        statusOfUpdate.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfUpdate.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });

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
  loginOtp(context) {
    userUpdateRepo(
            birth_place: regionController.text.trim(),
            dob: dateOfBirthController.text.trim(),
            fname: firstNameController.text.trim(),
            lname: lastNameController.text.trim(),
            nationality: countryController1.text.trim(),
            gender: genderType.value,
            pin: otpcontroller.text.trim(),
            zip_tag: zipController.text.trim() + "@zip")
        .then((value) {
      userUpdate.value = value;
      if (value.status == true) {
        Get.offAllNamed(
          MyRouters.bottomNavbar,
        );
        statusOfUpdate.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfUpdate.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });

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
  Rx<CreateVirtualAccountModel> virtualAccount =
      CreateVirtualAccountModel().obs;
  Rx<RxStatus> statusOfAccount = RxStatus.empty().obs;

  Future accountVritual(context) async {
    await accountRepo(
            bvn: numbercontroller.isNumberBvn
                ? numbercontroller.numberBvn
                : numbercontroller.emailBvn,
            phonenumber: molileController.text.trim(),
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
         dateOfBirth: dateOfBirthController.text.trim(),
            context: context)
        .then((value) async {
      virtualAccount.value = value;
      if (value.success == true) {
        if (kDebugMode) {
          print(virtualAccount.value = value);
        }
        statusOfAccount.value = RxStatus.success();
        contactCreate(context);
        // fetchVritualAccount(context);

        showToast(value.message.toString());
        SharedPreferences pref = await SharedPreferences.getInstance();

        pref.setString(
            'business_id', virtualAccount.value.data!.sId.toString());
        // Get.toNamed(MyRouters.otpScreen,);
      } else {
        statusOfAccount.value = RxStatus.error();
        showToast(value.message.toString());
      }
      //
    });
  }
  Future accountVritual1(context) async {
    await accountRepo(
            bvn: numbercontroller.isNumberBvn
                ? numbercontroller.numberBvn
                : numbercontroller.emailBvn,
            phonenumber: molileController.text.trim(),
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
        dateOfBirth: dateOfBirthController.text.trim(),

            context: context)
        .then((value) async {
      virtualAccount.value = value;
      if (value.success == true) {
        if (kDebugMode) {
          print(virtualAccount.value = value);
        }
        statusOfAccount.value = RxStatus.success();
        accountVritualVerify(context);
        // fetchVritualAccount(context);
        Get.toNamed(
          MyRouters.bottomNavbar,
        );
        showToast(value.message.toString());
        SharedPreferences pref = await SharedPreferences.getInstance();

        pref.setString(
            'business_id', virtualAccount.value.data!.sId.toString());
        // Get.toNamed(MyRouters.otpScreen,);
      } else {
        statusOfAccount.value = RxStatus.error();
        showToast(value.message.toString());
      }
      //
    });
  }

  Rx<ModelBankDetails> fetchAccount = ModelBankDetails().obs;
  Rx<RxStatus> statusOfFetchAccount = RxStatus.empty().obs;
  final details = Get.put(DetailsController());
  Future fetchVritualAccount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("business_id");
    log("aaaaaaaa---$id");
    await fetchAccountRepo().then((value) {
      fetchAccount.value = value;
      if (value.status == true) {
        statusOfFetchAccount.value = RxStatus.success();
        // Get.toNamed(MyRouters.otpScreen,);
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }


  _makingPhoneCall(call) async {
    var url = Uri.parse(call);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  Rx<ModelCheckout> checkout = ModelCheckout().obs;
  Rx<RxStatus> statusOfCheckout = RxStatus.empty().obs;
  RxString link1 = "".obs;
  RxString code = "".obs;
  Rx<RxStatus> statusOfSave= RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;
  final profileController = Get.put(ProfileController());
  Future saveList(context)async {
    print( profileController.modal.value.data!.user!.id.toString(),);
    await saveTransastionRepo(
        user_id: profileController.modal.value.data!.user!.id.toString(),
        amount:amountController.text.trim(),
        about: "Payment Link",
        // complete_response: purchaseData.value.data!.toJson(),
        context: context,
        description:"Add money",
        type: "cr"
    ).then((value) {
      log("response.body.....    ${value}");
      save.value = value;
      if (value.status == true) {
        statusOfSave.value = RxStatus.success();
        cashCheckout(context);
      } else {
        statusOfSave.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }
  Future cashCheckout(context) async {
    await checkoutRepo(
            currency: fetchAccount.value.data!.currency.toString(),
            email: fetchAccount.value.data!.kYCInformation!.email.toString(),
            amount: amountController.text.trim().toString(),
            key: "link",
        phoneNumber: fetchAccount.value.data!.kYCInformation!.phoneNumber.toString(),
            name: "${fetchAccount.value.data!.kYCInformation!.firstName.toString()} " +
                " ${fetchAccount.value.data!.kYCInformation!.lastName.toString()}",
            // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
            context: context)
        .then((value) async {
      checkout.value = value;
      log(checkout.value.toString());
      if (value.status == true) {
        final Uri url = Uri.parse(value.data!.link);
        if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
          throw Exception(value.data!.link);
        }

        // _makingPhoneCall(value.data!.link);
        // var url= value.data!.link;
        // if (await canLaunchUrl(Uri.parse(url))) {
        //   await launchUrl(url, );
        // } else {
        //   throw 'Could not launch $url';
        // }
        //
        // _makingPhoneCall(value.data!.link.toString());
        // var url = Uri.parse( value.data!.link.toString());
        // if (await canLaunchUrl(url)) {
        // await launchUrl(url);
        // } else {
        // throw 'Could not launch $url';
        // }

        //
        //   var httpClient = HttpClient();
        //   var request1 = await httpClient.getUrl(Uri.parse(value.data!.link));
        //   var response = await request1.close();
        //   var bytes = await consolidateHttpClientResponseBytes(response);
        //   String dir = (await getApplicationDocumentsDirectory()).path;
        // File file = File('$dir/${value.data!.link.split("/").last.replaceAll("%", " ")}');
        // await file.writeAsBytes(bytes);
        // // Share.shareFiles([file.path], text: 'Great picture');
        // Share.share(value.data!.link);
        showToast(value.message.toString());
        statusOfCheckout.value = RxStatus.success();
        link1.value = value.data!.link;
        code.value = value.data!.payCode;
        // Get.toNamed(MyRouters.paymentLink);

        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
        log("link1------${link1.value}");
      }
      // showToast(value.message.toString());
    });
  }
  // Future cashCheckout2(context) async {
  //   await checkoutRepo(
  //           currency: "NGN",
  //           key: "link",
  //           email: "john.doe@example.com",
  //           amount:"1000",
  //           name: " John Doe",
  //           // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
  //           context: context)
  //       .then((value) async {
  //     checkout.value = value;
  //     log(checkout.value.toString());
  //     if (value.status == true) {
  //       final Uri url = Uri.parse(value.data!.link);
  //       if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
  //         throw Exception(value.data!.link);
  //       }
  //
  //       // _makingPhoneCall(value.data!.link);
  //       // var url= value.data!.link;
  //       // if (await canLaunchUrl(Uri.parse(url))) {
  //       //   await launchUrl(url, );
  //       // } else {
  //       //   throw 'Could not launch $url';
  //       // }
  //       //
  //       // _makingPhoneCall(value.data!.link.toString());
  //       // var url = Uri.parse( value.data!.link.toString());
  //       // if (await canLaunchUrl(url)) {
  //       // await launchUrl(url);
  //       // } else {
  //       // throw 'Could not launch $url';
  //       // }
  //
  //       //
  //       //   var httpClient = HttpClient();
  //       //   var request1 = await httpClient.getUrl(Uri.parse(value.data!.link));
  //       //   var response = await request1.close();
  //       //   var bytes = await consolidateHttpClientResponseBytes(response);
  //       //   String dir = (await getApplicationDocumentsDirectory()).path;
  //       // File file = File('$dir/${value.data!.link.split("/").last.replaceAll("%", " ")}');
  //       // await file.writeAsBytes(bytes);
  //       // // Share.shareFiles([file.path], text: 'Great picture');
  //       // Share.share(value.data!.link);
  //       showToast(value.message.toString());
  //       statusOfCheckout.value = RxStatus.success();
  //       link1.value = value.data!.link;
  //       code.value = value.data!.payCode;
  //       // Get.toNamed(MyRouters.paymentLink);
  //
  //       showToast(value.message.toString());
  //     } else {
  //       showToast(value.message.toString());
  //       log("link1------${link1.value}");
  //     }
  //     // showToast(value.message.toString());
  //   });
  // }


  Rx<RxStatus> statusOfSaveMail= RxStatus.empty().obs;
  Rx<RequestMoneyMail> saveMail = RequestMoneyMail().obs;
  Future saveEmails()async {
    print( profileController.modal.value.data!.user!.id.toString(),);
    await requestMailRepo(
        by_requested_id: profileController.modal.value.data!.user!.id.toString(),
        amount:amountController.text.trim(),
        phone: fetchAccount.value.data!.kYCInformation!.phoneNumber.toString(),
        email: AddEmailController.text.trim(),
        requested_id: AddNameController.text.trim(),
        generate_link:link1.value.toString() ,

        type: "request Payment"
    ).then((value) {
      log("response.body.....    ${value}");
      saveMail.value = value;
      if (value.status == true) {
        statusOfSave.value = RxStatus.success();
        // Share.share(link1.value.toString());
      } else {
        statusOfSave.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }



  Future cashCheckout1(context) async {
    await checkoutRepo(
            currency: fetchAccount.value.data!.currency.toString(),
            email: fetchAccount.value.data!.kYCInformation!.email.toString(),
            phoneNumber:AddmobileController.text.toString(),
            key: "link",
            amount: amountController.text.trim(),
            name: "${fetchAccount.value.data!.kYCInformation!.firstName.toString()} " +
                " ${fetchAccount.value.data!.kYCInformation!.lastName.toString()}",
            // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
            context: context)
        .then((value) async {
      checkout.value = value;
      log(checkout.value.toString());
      if (value.status == true) {
        link1.value = value.data!.link;
        saveEmails();


        Share.share(value.data!.link);

        showToast(value.message.toString());
        statusOfCheckout.value = RxStatus.success();
        link1.value = value.data!.link;
        code.value = value.data!.payCode;
        // Get.toNamed(MyRouters.paymentLink);

        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
        log("link1------${link1.value}");
      }
      // showToast(value.message.toString());
    });
  }

  Rx<ModelVerifyVritualAccount> verifyVritualAccount =
      ModelVerifyVritualAccount().obs;
  Rx<RxStatus> statusOfAccountVerify = RxStatus.empty().obs;

  Future accountVritualVerify(context) async {
    showToast("Fincra  api before");
    await verifyAccountRepo(
            accountNumber: virtualAccount.value.data!.accountNumber.toString(),
            phone_email:
                virtualAccount.value.data!.kYCInformation!.email.toString(),
            accountType: virtualAccount.value.data!.accountType.toString(),
            accountInformation:
                virtualAccount.value.data!.accountInformation!.toJson(),
            business: virtualAccount.value.data!.business.toString(),
            currency: virtualAccount.value.data!.currency.toString(),
            KYCInformation: virtualAccount.value.data!.kYCInformation!.toJson(),
            business_id: virtualAccount.value.data!.sId.toString(),
            // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
            context: context)
        .then((value) async {
      verifyVritualAccount.value = value;
      if (value.status == true) {
        statusOfAccountVerify.value = RxStatus.success();
        contactCreate(context);

        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }
}
