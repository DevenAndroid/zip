import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinput/pinput.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/number_controller.dart';
import '../controller/update_user.dart';
import '../models/model_setting.dart';
import '../models/model_verify_africa.dart';
import '../models/verify_africa.dart';
import '../repository/setting_repo.dart';
import '../repository/verify_africa_b.dart';
import '../resourses/api_constant.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Rx<ModelVerifyAfrica> modelVerifyAfrica = ModelVerifyAfrica().obs;
  final formKeypin = GlobalKey<FormState>();
  final registorController = Get.put(registerController());
  File image = File("");

  Rx<ModelSetting> setting = ModelSetting().obs;
  Rx<RxStatus> statusOfSetting = RxStatus.empty().obs;

  Future getSetting() async {
    await settingRepo().then((value) {
      setting.value = value;
      if (value.status == true) {
        statusOfSetting.value = RxStatus.success();
      } else {
        statusOfSetting.value = RxStatus.error();
      }
    }
        // showToast(value.message.toString());
        );
  }
  Rx<RxStatus> statusOfSucess= RxStatus.empty().obs;
  Future verify() async {
    await verifyRepo(
      selfie: base64Image,
      // phone_email:  numbercontroller.isNumber ? numbercontroller.number:numbercontroller.email,
      lastName: registorController.lastNameController.text.trim(),
      firstName: registorController.firstNameController.text.trim(),
      searchParameter: numbercontroller.isNumberBvn
          ? numbercontroller.numberBvn
          : numbercontroller.emailBvn,
      dob: registorController.dateOfBirthController.text.trim(),
      apiKey: setting.value.data!.authKey.toString(),
      userid: setting.value.data!.userID.toString(),
    ).then((value) {
      statusOfSucess.value = RxStatus.success();
      showToast(value.response!.status);
      showToast(value.verificationStatus);
      modelVerifyAfrica.value = value;
      showToast(value.verificationStatus);
    }
        // showToast(value.message.toString());
        );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSetting();
  }

  String base64Image = "";

  final numbercontroller = Get.put(numberController());
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
      setState(() {
        List<int> imageBytes = imageTemporary.readAsBytesSync();
        print(imageBytes);
        base64Image = base64Encode(imageBytes);
        // "data:image/jpg;base64,"
        base64Image = "data:image/${image.path.split(".").last};base64,$base64Image";
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Field to pick img : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 56,
        height: 56,
        textStyle: const TextStyle(
          fontSize: 22,
          color: Color.fromRGBO(30, 60, 87, 1),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: AppTheme.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(10)));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: formKeypin,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "Create your unique 4-digits pin!",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppTheme.primaryColor)),
                      child: Center(
                        child: InkWell(
                            onTap: () => pickImage(),
                            // child: image.path != ""
                            //     ?
                            //
                            child: ClipOval(
                              child: Image.file(
                                image,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    Icon(Icons.person),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "Please remember this pin. It’ll be used to keep your account secure ",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Center(
                        child: Pinput(
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Ente r 4 Digit Pin')
                          ]),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          controller: registorController.otpcontroller,
                          keyboardType: TextInputType.number,
                          length: 4,
                          defaultPinTheme: defaultPinTheme,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .6,
                    ),
                    InkWell(
                      onTap: () {
                        verify();
                      },
                      child: CustomOutlineBoder(
                        title: "Next",
                        backgroundColor: Colors.white,
                        textColor: AppTheme.buttonColor,
                        onPressed: () {
                          Get.toNamed(MyRouters.otpScreen);
                        },
                      ),
                    )
                  ])),
        )));
  }
}
