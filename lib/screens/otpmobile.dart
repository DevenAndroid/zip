import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../models/model_userverify_otp.dart';
import '../models/model_verify_otp.dart';
import '../models/registor_model.dart';
import '../repository/userverify_otp_Repo.dart';
import '../repository/verify_otp_repo.dart';
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


   var initStateBlank = Get.arguments[0];
  final formKey1 = GlobalKey<FormState>();
  // VerifyOtp() {
  //   if (formKey1.currentState!.validate()) {
  //     verifyOtpRepo(
  //       refrence: "/${ Get.arguments[0]}/validate",
  //       otp: mobileOtpController.text.trim(),
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

  // VerifyOtp() {
  //   if (formKey1.currentState!.validate()) {
  //     verifyOtpRepo(
  //       refrence: "/${ Get.arguments[0]}/validate",
  //       otp: mobileOtpController.text.trim(),
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
    if (formKey1.currentState!.validate()) {
      userVerifyOtpRepo(
        phone_email: initStateBlank,
        otp: mobileOtpController.text.trim(),


      ).then((value) {
        userVerifyOtp.value = value;
        if (value.status == true) {

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
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading:   InkWell(

            onTap: (){
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),),
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
  child:   Row(children: [

    Expanded(

      child: RichText(

        text: TextSpan(

          text:  "Please enter 6 digits code we sent to",

          style: GoogleFonts.poppins(

                color: const Color(0xFF1D1D1D),

                fontSize: 18,

                fontWeight: FontWeight.w500),

          children:  <TextSpan>[

              TextSpan(text:  " +234 xxxxxxxxxxx",

                style: GoogleFonts.poppins(

                    color: const Color(0xFFB2802A),

                    fontSize: 16,

                    fontWeight: FontWeight.w500),

              ),



          ],

        ),

      ),

    )

  ],),
),

                        const SizedBox(
                          height: 20,
                        ),

                        CommonTextfield(
                          keyboardType:
                          const TextInputType.numberWithOptions(
                              decimal: true),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Please enter your otp'),
                          ]),
                          controller: mobileOtpController,obSecure: false, hintText: "000-000",),
                        SizedBox(height: 15,),
                        Center(
                          child: Text(
                            "Or",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(height: 15,),
                        InkWell(
                            onTap: (){
                              verifyOtpRepo();
                              // VerifyOtp();
                              //  Get.toNamed(MyRouters.profileScreen);
                            },
                            child: CustomOutlineButton(title: "Tap to verify using USSD",)),
                        SizedBox(height: 15,),
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

                        SizedBox(height: size.height*0.44,),

                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: CustomOutlineBoder(title: "Go Back", backgroundColor: Colors.white,textColor: AppTheme.buttonColor,onPressed: (){
                            Get.back();
                          },),
                        ),

                      ])),
            )));
  }
}

