import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zip/routers/my_routers.dart';
import 'package:zip/screens/forgot_email.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';
import '../resourses/details.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {

  final formKeylogin = GlobalKey<FormState>();
  var obscureText1 = true;
  final details = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
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
          key: formKeylogin,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
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
                        onTap: () {
                          Get.toNamed(MyRouters.loginScreen);
                        },
                        child: CustomOutlineBoder(
                          title: "Phone",
                          backgroundColor: Colors.white,
                          textColor: AppTheme.buttonColor,
                          onPressed: () {
                            Get.toNamed(MyRouters.mobileNumber);
                          },
                        ),
                      )),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () {},
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
                      if (details.emailNoController.text.isEmpty) {
                        return "Please enter your email";
                      } else if (details.emailNoController.text.contains('+') ||
                          details.emailNoController.text.contains(' ')) {
                        return "Email is invalid";
                      } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(details.emailNoController.text)) {
                        return null;
                      } else {
                        return 'Please type a valid email address';
                      }
                    },
                    controller: details.emailNoController,
                    obSecure: false,
                    hintText: "pkp@gmail.com",
                    labelText: "Email",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CommonTextfield(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText1 = !obscureText1;
                          });
                        },
                        child: obscureText1
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
                    controller: details.passwordController,
                    obSecure: obscureText1,
                    labelText: "Password",
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        // Get.toNamed(MyRouters.forgotEmail);
                        Get.to(() => ForgotEmailScreen());
                      },
                      child: Text(
                        "Forgot Password",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .3,
                  ),
                  InkWell(
                      onTap: () {
                        details.Email(context);
                        // emailRegister();
                        // emailLogin();
                        //
                      },
                      child: CustomOutlineButton(
                        title: "Next",
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      if (formKeylogin.currentState!.validate()) {
                        Get.toNamed(MyRouters.loginScreen);
                      }
                    },
                    child: CustomOutlineBoder(
                      title: "Use Mobile Number",
                      backgroundColor: Colors.white,
                      textColor: AppTheme.buttonColor,
                      onPressed: () {
                        Get.toNamed(MyRouters.loginScreen);
                      },
                    ),
                  ),
                ]),
          ),
        )));
  }
}
