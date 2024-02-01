import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/number_controller.dart';
import '../models/model_userverify_otp.dart';
import '../models/registor_model.dart';
import '../repository/userverify_otp_Repo.dart';
import '../resourses/api_constant.dart';

class MobileOtpScreen extends StatefulWidget {
  const MobileOtpScreen({Key? key}) : super(key: key);

  @override
  State<MobileOtpScreen> createState() => _MobileOtpScreenState();
}

class _MobileOtpScreenState extends State<MobileOtpScreen> {
  // Rx<RxStatus> statusOfVerify = RxStatus.empty().obs;
  //
  // Rx<ModelVerifyOtp> verifyOtp = ModelVerifyOtp().obs;
  Rx<RxStatus> statusOfuserVerifyOtp = RxStatus.empty().obs;

  Rx<UserVerifyOtpModel> userVerifyOtp = UserVerifyOtpModel().obs;
  TextEditingController mobileOtpController = TextEditingController();
  Rx<ModelCommonResponse> login = ModelCommonResponse().obs;
  final numbercontroller = Get.put(numberController());

  var initStateBlank = Get.arguments;
  final formKey1 = GlobalKey<FormState>();

  verifyOtpRepo() {
    if (formKey1.currentState!.validate()) {
      userVerifyOtpRepo(
        phone_email: initStateBlank,
        otp: mobileOtpController.text.trim(),
      ).then((value) async {
        userVerifyOtp.value = value;
        if (value.status == true) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('cookie', value.authToken.toString());
          Get.toNamed(MyRouters.selectableScreen);
          statusOfuserVerifyOtp.value = RxStatus.success();

          showToast(value.message.toString());
        } else {
          statusOfuserVerifyOtp.value = RxStatus.error();
          showToast(value.message.toString());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
    double doubleVar;
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
          key: formKey1,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Please enter the 6 digits code we sent to email & number",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Center(
                        child: Pinput(
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Enter 6 Digit Pin')
                          ]),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          controller: mobileOtpController,
                          keyboardType: TextInputType.number,
                          length: 6,
                          defaultPinTheme: defaultPinTheme,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                        onTap: () {
                          verifyOtpRepo();

                          // VerifyOtp();
                          //  Get.toNamed(MyRouters.profileScreen);
                        },
                        child: const CustomOutlineButton(
                          title: "Verify ",
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "This is free and will verify instantly",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.44,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: CustomOutlineBoder(
                        title: "Go Back",
                        backgroundColor: Colors.white,
                        textColor: AppTheme.buttonColor,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ])),
        )));
  }
}
