import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/forgot_pass_model.dart';
import '../repository/forgot_pass_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_textfield.dart';
import 'email_login.dart';

class ForgotChangePassword extends StatefulWidget {
  const ForgotChangePassword({Key? key}) : super(key: key);

  @override
  State<ForgotChangePassword> createState() => _ForgotChangePasswordState();
}

class _ForgotChangePasswordState extends State<ForgotChangePassword> {
  Rx<RxStatus> statusOfUpdatePass = RxStatus.empty().obs;
  Rx<ForgotPassModel> updatePass = ForgotPassModel().obs;
  var initStateBlank = Get.arguments[0];

  updatePassword() {
    forgotPassRepo(
      context: context,
      email: initStateBlank.toString(),
      confirm_password: confirmPassController.text.trim(),
      password: newPassController.text.trim(),
    ).then((value) {
      updatePass.value = value;
      if (value.status == true) {
        // Get.back();
        Get.to(() => const EmailLoginScreen());
        statusOfUpdatePass.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfUpdatePass.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });

    // if(value.status=="success"){
    //   statusOfChooseBank.value.isSuccess;
    // }
    // Get.toNamed(MyRouters.bottomNavbar);
  }

  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final formKeyVerify = GlobalKey<FormState>();
  var obscureText4 = true;
  var obscureText3 = true;
  var obscureText5 = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          toolbarHeight: 80,
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
                key: formKeyVerify,
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Text(
                              "Update Password",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF1D1D1D),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          CommonTextfield(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscureText4 = !obscureText4;
                                  });
                                },
                                child: obscureText4
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Color(0xFF8487A1),
                                      )
                                    : const Icon(Icons.visibility,
                                        color: Color(0xFF8487A1))),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please enter your password'),
                              MinLengthValidator(8,
                                  errorText:
                                      'Password must be at least 8 characters, with 1 special character & 1 numerical'),
                              PatternValidator(
                                  r"(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
                                  errorText:
                                      "Password must be at least with 1 special character & 1 numerical"),
                            ]),
                            obSecure: obscureText4,
                            controller: newPassController,
                            labelText: "New Password",
                            hintText: 'New Password',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CommonTextfield(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscureText3 = !obscureText3;
                                  });
                                },
                                child: obscureText3
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Color(0xFF8487A1),
                                      )
                                    : const Icon(Icons.visibility,
                                        color: Color(0xFF8487A1))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.toString() == newPassController.text) {
                                return null;
                              }
                              return "Confirm password not matching with password";
                            },
                            controller: confirmPassController,
                            obSecure: obscureText3,
                            labelText: "Confirm Password",
                            hintText: 'Confirm Password',
                          ),
                          SizedBox(
                            height: size.height * .35,
                          ),
                          InkWell(
                            onTap: () {
                              updatePassword();
                              // updatePassword();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 10, right: 8),
                              child: CustomOutlineButton(
                                title: "Update",
                              ),
                            ),
                          ),
                        ])))));
  }
}
