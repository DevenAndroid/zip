import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zip/routers/my_routers.dart';
import 'package:zip/screens/forgot_otp.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../models/login_model.dart';
import '../models/model_userverify_otp.dart';
import '../models/model_verify_otp.dart';
import '../models/registor_model.dart';
import '../repository/login_repo.dart';
import '../repository/mobile_no_otp_repo.dart';
import '../repository/userverify_otp_Repo.dart';
import '../repository/verify_otp_repo.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';

class ForgotEmailScreen extends StatefulWidget {
  const ForgotEmailScreen({Key? key}) : super(key: key);

  @override
  State<ForgotEmailScreen> createState() => _ForgotEmailScreenState();
}

class _ForgotEmailScreenState extends State<ForgotEmailScreen> {

  // Rx<ModelCommonResponse> login = ModelCommonResponse().obs;
  // Rx<RxStatus> statusOfuserVerifyOtp = RxStatus.empty().obs;
  //
  // Rx<UserVerifyOtpModel> userVerifyOtp = UserVerifyOtpModel().obs;
  //
  // var initStateBlank = Get.arguments[0];
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
  // verifyOtpRepo() {
  //   if (formKey2.currentState!.validate()) {
  //     userVerifyOtpRepo(
  //       phone_email: initStateBlank,
  //       otp: emailOtpController.text.trim(),
  //       context: context,
  //
  //     ).then((value) {
  //       userVerifyOtp.value = value;
  //       if (value.status == "success") {
  //         setState(() {
  //           Get.toNamed(MyRouters.bottomNavbar);
  //           statusOfuserVerifyOtp.value = RxStatus.success();
  //         });
  //
  //
  //         showToast(value.message.toString());
  //       } else {
  //         statusOfuserVerifyOtp.value = RxStatus.error();
  //         showToast(value.message.toString());
  //       }
  //     });
  //   }
  // }
  final formKeylogin = GlobalKey<FormState>();
  var obscureText1 = true;
  final details = Get.put(DetailsController());

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
              key:formKeylogin ,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: Text(
                          "Enter your email to forgot password",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 19,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      const SizedBox(
                        height: 23,
                      ),
                      CommonTextfield(
                        validator: (value) {
                          if (details.emailForgotController.text.isEmpty) {
                            return "Please enter your email";
                          } else if (details.emailForgotController.text.contains('+') || details.emailForgotController.text.contains(' ')) {
                            return "Email is invalid";
                          } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(details.emailForgotController.text)) {
                            return null;
                          } else {
                            return 'Please type a valid email address';
                          }
                        },
                        controller: details.emailForgotController,obSecure: false, hintText: "pkp@gmail.com",labelText: "Email",),
                      SizedBox(height: 15,),

                      // CommonTextfield(
                      //   suffixIcon: GestureDetector(
                      //       onTap: () {
                      //         setState(() {
                      //           obscureText1 =
                      //           !obscureText1;
                      //         });
                      //       },
                      //       child: obscureText1
                      //           ? const Icon(
                      //         Icons.visibility_off,
                      //         color: Color(0xFF8487A1),
                      //       )
                      //           : const Icon(
                      //           Icons.visibility,
                      //           color: Color(
                      //               0xFF8487A1))),
                      //
                      //   validator: MultiValidator([
                      //     RequiredValidator(
                      //         errorText: 'Please enter your password'),
                      //     MinLengthValidator(8,
                      //         errorText: 'Password must be at least 8 characters, with 1 special character & 1 numerical'),
                      //     PatternValidator(
                      //         r"(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
                      //         errorText: "Password must be at least with 1 special character & 1 numerical"),
                      //   ]),controller: details.passwordController,obSecure: obscureText1, labelText: "Password", hintText: 'Password',),
                      SizedBox(height: 15,),


                      SizedBox(height:size.height*.4,),

                      InkWell(
                          onTap: (){
      if (formKeylogin.currentState!.validate()) {
        details.forgot(context);
      }
                            // emailRegister();
                            // emailLogin();
                            //
                            // Get.to(()=>ForgotScreenOtp());
                          },
                          child: CustomOutlineButton(title: "Next",)),
                      SizedBox(height: 15,),
                      // InkWell(
                      //   onTap: (){
                      //     if (formKeylogin.currentState!.validate()) {
                      //       Get.toNamed(MyRouters.loginScreen);
                      //     }
                      //   },
                      //   child: CustomOutlineBoder(title: "Use Mobile Number", backgroundColor: Colors.white,textColor: AppTheme.buttonColor,onPressed: (){
                      //     Get.toNamed(MyRouters.loginScreen);
                      //   },),
                      // ),


                    ]),
              ),
            )));
  }
}
