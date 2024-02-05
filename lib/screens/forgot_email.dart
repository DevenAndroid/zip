import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../resourses/details.dart';

class ForgotEmailScreen extends StatefulWidget {
  const ForgotEmailScreen({Key? key}) : super(key: key);

  @override
  State<ForgotEmailScreen> createState() => _ForgotEmailScreenState();
}

class _ForgotEmailScreenState extends State<ForgotEmailScreen> {
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
                      } else if (details.emailForgotController.text
                              .contains('+') ||
                          details.emailForgotController.text.contains(' ')) {
                        return "Email is invalid";
                      } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(details.emailForgotController.text)) {
                        return null;
                      } else {
                        return 'Please type a valid email address';
                      }
                    },
                    controller: details.emailForgotController,
                    obSecure: false,
                    hintText: "pkp@gmail.com",
                    labelText: "Email",
                  ),
                  const SizedBox(
                    height: 15,
                  ),


                  const SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    height: size.height * .4,
                  ),

                  InkWell(
                      onTap: () {
                        if (formKeylogin.currentState!.validate()) {
                          details.forgot(context);
                        }

                      },
                      child: const CustomOutlineButton(
                        title: "Next",
                      )),
                  const SizedBox(
                    height: 15,
                  ),

                ]),
          ),
        )));
  }
}
