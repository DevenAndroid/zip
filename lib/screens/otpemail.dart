import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../models/model_userverify_otp.dart';
import '../models/model_verify_otp.dart';
import '../models/registor_model.dart';
import '../repository/mobile_no_otp_repo.dart';
import '../repository/userverify_otp_Repo.dart';
import '../repository/verify_otp_repo.dart';
import '../resourses/api_constant.dart';

class EmailOtpScreen extends StatefulWidget {
  const EmailOtpScreen({Key? key}) : super(key: key);

  @override
  State<EmailOtpScreen> createState() => _EmailOtpScreenState();
}

class _EmailOtpScreenState extends State<EmailOtpScreen> {
  // Rx<RxStatus> statusOfVerify = RxStatus.empty().obs;
  final formKey2 = GlobalKey<FormState>();
  // Rx<ModelVerifyOtp> verifyOtp = ModelVerifyOtp().obs;
  TextEditingController emailOtpController = TextEditingController();
  Rx<ModelCommonResponse> login = ModelCommonResponse().obs;
  Rx<RxStatus> statusOfuserVerifyOtp = RxStatus.empty().obs;

  Rx<UserVerifyOtpModel> userVerifyOtp = UserVerifyOtpModel().obs;

  var initStateBlank = Get.arguments[0];
  // VerifyOtp() {
  //   if (formKey2.currentState!.validate()) {
  //     verifyOtpRepo(
  //       refrence: "/${ Get.arguments[0]}/validate",
  //       otp: emailOtpController.text.trim(),
  //       context: context,
  //
  //     ).then((value) {
  //       verifyOtp.value = value;
  //       if (value.status == "success") {
  //         setState(() {
  //           Get.toNamed(MyRouters.bottomNavbar);
  //           statusOfVerify.value = RxStatus.success();
  //         });
  //
  //
  //         showToast(value.message.toString());
  //       } else {
  //         statusOfVerify.value = RxStatus.error();
  //         showToast(value.message.toString());
  //       }
  //     });
  //   }
  // }
  verifyOtpRepo() {
    if (formKey2.currentState!.validate()) {
      userVerifyOtpRepo(
        phone_email: initStateBlank,
        otp: emailOtpController.text.trim(),

      ).then((value) async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('cookie', value.authToken.toString());
        userVerifyOtp.value = value;
        if (value.status == true) {
          setState(() {
            Get.toNamed(MyRouters.selectableScreen);
            statusOfuserVerifyOtp.value = RxStatus.success();
          });


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
              key:formKey2 ,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text: "Please enter 6 digits code we sent to  ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: initStateBlank,
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFFB2802A),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonTextfield(

                          controller: emailOtpController,
                          keyboardType:
                          const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
                            FilteringTextInputFormatter.allow(
                                RegExp('[0-9]+')),
                          ],
                          onChanged: (value) =>
                          doubleVar = double.parse(value),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText:
                                'Please enter your otp '),
                            MinLengthValidator(6,
                                errorText:
                                'Please enter   6 digit otp'),
                            MaxLengthValidator(6,
                                errorText:
                                'Please enter 6 digit otp'),

                          ]),
                          obSecure: false,
                          hintText: "000-000",
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        InkWell(
                            onTap: () {
                              verifyOtpRepo();
                              // Get.toNamed(MyRouters.otpEmailScreen);
                            },
                            child: CustomOutlineButton(
                              title: "Tap to Verify",
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
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
