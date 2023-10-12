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
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zip/controller/profile_controller.dart';

import '../models/create_virtual_account_model.dart';
import '../models/fetchVirtualAccount_model.dart';
import '../models/model_checkout.dart';
import '../models/model_create_card.dart';
import '../models/model_create_card_holder.dart';
import '../models/model_update_address.dart';
import '../models/model_update_user.dart';
import '../models/model_verif_account.dart';
import '../models/save_transastion_model.dart';
import '../models/verify_africa.dart';
import '../repository/create_card_holder_repo.dart';
import '../repository/create_card_repo.dart';
import '../repository/fetch_account_repo.dart';
import '../repository/model_checkout_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../repository/update_address_repo.dart';
import '../repository/user_update_repo.dart';
import '../repository/verify_account_reop.dart';
import '../repository/verify_africa_b.dart';
import '../repository/vritual_account_repo.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../routers/my_routers.dart';
import 'number_controller.dart';

class registerController extends GetxController {
  final bankController = TextEditingController();
  final bankController1 = TextEditingController();
  final mobileNO = TextEditingController();
  final amount = TextEditingController();
  final meterNo = TextEditingController();
  final provider = TextEditingController();
  final idController = TextEditingController();
  final idController1 = TextEditingController();


  TextEditingController amount1Controller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController descriptionController1 = TextEditingController();
  TextEditingController sourceCurrencyController = TextEditingController();
  TextEditingController destinationCurrencyController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();




  TextEditingController phoneController1 = TextEditingController();
  TextEditingController amountController1 = TextEditingController();


  TextEditingController streetController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();
  // TextEditingController additionalController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  Rx<RxStatus> statusOfaddress = RxStatus.empty().obs;
  Rx<ModelUpdateAddress> userAdderss = ModelUpdateAddress().obs;
  final formKeyAddressField = GlobalKey<FormState>();

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

  TextEditingController AddmobileController = TextEditingController();
  TextEditingController AddNameController = TextEditingController();
  TextEditingController AddEmailController = TextEditingController();


  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController countryController1 = TextEditingController();
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
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 50);

      if (image == null) return;
      if (image.path.toString().contains(".png")) {
        showToast("dsfdsf");
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
      statusOfSucess.value = RxStatus.success();

      showToast(value.message.toString());

      modelVerifyAfrica.value = value;
      accountVritual(context);
    }
            // showToast(value.message.toString());
            );
  }

  String base64Image = "";

  final numbercontroller = Get.put(numberController());
  Rx<ModelVerifyAfrica> modelVerifyAfrica = ModelVerifyAfrica().obs;
  Rx<RxStatus> statusOfSucess = RxStatus.empty().obs;

  Future holder(context) async {
    print("sdggfrdh");
    await cardHolderRepo(
      selfie_image: base64Image,
      email_address: emailController.text.trim(),
      address: cityController.text.trim(),
      house_no: houseNoController.text.trim(),
      city: cityController.text.trim(),
      phone: molileController.text.trim(),
      country: countryController.text.trim(),
      postal_code: postalCodeController.text.trim(),
      id_type: "NIGERIAN_BVN_VERIFICATION",
      state: stateController.text.trim(),
      // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
      bvn: numbercontroller.isNumberBvn
          ? numbercontroller.numberBvn
          : numbercontroller.emailBvn,

      first_name: firstNameController.text.trim(),
      last_name: lastNameController.text.trim(),
      context: context,
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
            email: emailController.text.trim(),
            phonenumber: molileController.text.trim(),
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
            channel: "providus",
            accountType: "individual",
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
          MyRouters.otpScreen,
        );
        showToast(value.message.toString());
        SharedPreferences pref = await SharedPreferences.getInstance();

        pref.setString(
            'business_id', virtualAccount.value.data!.sId.toString());
        // Get.toNamed(MyRouters.otpScreen,);
      } else {
        statusOfAccount.value = RxStatus.error();
      }
      // showToast(value.message.toString());
    });
  }

  Rx<FetchVirtualAccountModel> fetchAccount = FetchVirtualAccountModel().obs;
  Rx<RxStatus> statusOfFetchAccount = RxStatus.empty().obs;
  final details = Get.put(DetailsController());
  Future fetchVritualAccount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("business_id");
    log("aaaaaaaa---$id");
    await fetchAccountRepo(id: id.toString()).then((value) {
      fetchAccount.value = value;
      if (value.success == true) {
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
            amount: amountController.text.trim(),
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
  Future cashCheckout1(context) async {
    await checkoutRepo(
            currency: fetchAccount.value.data!.currency.toString(),
            email: fetchAccount.value.data!.kYCInformation!.email.toString(),
            amount: amountController.text.trim(),
            name: "${fetchAccount.value.data!.kYCInformation!.firstName.toString()} " +
                " ${fetchAccount.value.data!.kYCInformation!.lastName.toString()}",
            // numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
            context: context)
        .then((value) async {
      checkout.value = value;
      log(checkout.value.toString());
      if (value.status == true) {

        Share.share(value.data!.link);
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

  Rx<ModelVerifyVritualAccount> verifyVritualAccount =
      ModelVerifyVritualAccount().obs;
  Rx<RxStatus> statusOfAccountVerify = RxStatus.empty().obs;

  Future accountVritualVerify(context) async {
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

        Get.toNamed(
          MyRouters.otpScreen,
        );
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }
}
