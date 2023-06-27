import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../models/modal_registor.dart';
import '../models/registor_model.dart';
import '../repository/mobile_no_otp_repo.dart';
import '../repository/registor_repo.dart';
import '../resourses/api_constant.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {

  // var initStateBlank = Get.arguments[0];
  // Rx<RxStatus> statusOfLogin = RxStatus.empty().obs;
  //
  // Rx<ModelCommonResponse> login = ModelCommonResponse().obs;
  Rx<RxStatus> statusOfemailregister = RxStatus.empty().obs;

  Rx<RegisterModel> emailregister = RegisterModel().obs;

  TextEditingController emailNoController = TextEditingController();
  TextEditingController BVNController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey5 = GlobalKey<FormState>();
  emailRegister() {
    if (formKey5.currentState!.validate()) {

      registerRepo(
          context: context,
          password:passwordController.text.trim(),
          bvn: BVNController.text.trim(),
          password_confirmation: confirmPasswordController.text.trim(),
          phone_email:emailNoController.text.trim(),
          type: "email"
      ).then((value) {
        emailregister.value = value;
        if (value.status == true) {
          Get.toNamed(MyRouters.mobileOtpScreen,arguments: [emailNoController.text]);
          statusOfemailregister.value = RxStatus.success();
          showToast(value.message.toString());
        } else {
          statusOfemailregister.value = RxStatus.error();
          showToast(value.message.toString());
        }
      }

      );
    }
  }

  // emailLogin() {
  //   if (formKey3.currentState!.validate()) {
  //     loginUserRepo(
  //       name: Get.arguments[0],
  //       context: context,
  //       phone: "08130000000",
  //       email: emailNoController.text.trim(),
  //     ).then((value) {
  //       login.value = value;
  //       Get.toNamed(MyRouters.otpEmailScreen,
  //           arguments: [value.data![0].reference.toString()]);
  //       // Get.toNamed(MyRouters.otpEmailScreen);
  //
  //
  //       showToast(value.message.toString());
  //       showToast(value.data![0].otp.toString());
  //     });
  //   }
  // }


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
              key:formKey5 ,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: Text(
                          "Enter your email to continue",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: CustomOutlineBoder(
                                  title: "Phone",
                                  backgroundColor: Colors.white,
                                  textColor: AppTheme.buttonColor,onPressed: (){
                                  Get.toNamed(MyRouters.mobileNumber);
                                },),
                              )),

                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: InkWell(
                                onTap: () {

                                },
                                child: const CustomOutlineButton(
                                  title: "Email",
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      CommonTextfield(
                        validator: (value) {
                          if (emailNoController.text.isEmpty) {
                            return "Please enter your email";
                          } else if (emailNoController.text.contains('+') || emailNoController.text.contains(' ')) {
                            return "Email is invalid";
                          } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(emailNoController.text)) {
                            return null;
                          } else {
                            return 'Please type a valid email address';
                          }
                        },
                        controller: emailNoController,obSecure: false, hintText: "pkp@gmail.com",labelText: "Email",),
                      SizedBox(height: 15,),
                      CommonTextfield(
                        validator: MultiValidator([
                        RequiredValidator(
                            errorText:
                            'Please enter your BVN number '),]),controller: BVNController,obSecure: false, labelText: "BVN Number", hintText: 'BVN Number',),
                      SizedBox(height: 15,),
                      CommonTextfield(
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter your password'),
                          MinLengthValidator(8,
                              errorText: 'Password must be at least 8 characters, with 1 special character & 1 numerical'),
                          PatternValidator(
                              r"(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
                              errorText: "Password must be at least with 1 special character & 1 numerical"),
                        ]),
                        obSecure: false,
                    controller: passwordController, labelText: "Password", hintText: 'Password',),
                      SizedBox(height: 15,),
                      CommonTextfield(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.toString() ==
                                passwordController.text) {
                              return null;
                            }
                            return "Confirm password not matching with password";
                          },controller: confirmPasswordController,obSecure: false, labelText: "Confirm Password", hintText: 'Confirm Password',),
                      SizedBox(height: 25,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: Text(
                          "By opening an account, you agree to our",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: Text(
                          "Terms of Use",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFFB5832C),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height:size.height*.1,),

                      InkWell(
                          onTap: (){
                            emailRegister();
                            // emailLogin();
                            //
                          },
                          child: CustomOutlineButton(title: "Next",)),
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(MyRouters.mobileNumber);
                        },
                        child: CustomOutlineBoder(title: "Use Mobile Number", backgroundColor: Colors.white,textColor: AppTheme.buttonColor,onPressed: (){
                          Get.toNamed(MyRouters.mobileNumber);
                        },),
                      ),


                    ]),
              ),
            )));
  }
}
