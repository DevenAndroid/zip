import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../models/model_send_email.dart';
import '../repository/repo_send_email.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_button.dart';

class RequestAPaymentContiune extends StatefulWidget {
  const RequestAPaymentContiune({Key? key}) : super(key: key);

  @override
  State<RequestAPaymentContiune> createState() =>
      _RequestAPaymentContiuneState();
}

class _RequestAPaymentContiuneState extends State<RequestAPaymentContiune> {
  final profileController = Get.put(ProfileController());
  var initStateBlank = Get.arguments[0];
  var initStateBlank1 = Get.arguments[1];
  Rx<RxStatus> statusOfSendMail = RxStatus.empty().obs;
  Rx<ModelSendEmail> sendEmail = ModelSendEmail().obs;

  send() async {
    sendEmailRepo(
            amount: profileController.amountController.text.trim(),
            email: initStateBlank1,
            context: context)
        .then((value) {
      log("response.body.....    ${value}");
      sendEmail.value = value;
      if (value.status == true) {
        Get.toNamed(MyRouters.successRequestScreen);
        statusOfSendMail.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfSendMail.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }
            // showToast(value.message.toString());
            );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Request Money ",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 48,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/images/right.png',
                height: 121,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Request Money \$ " +
                  profileController.amountController.text.trim(),
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "From" + "  ${initStateBlank}",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: size.height * .45,
            ),
            InkWell(
              onTap: () async {
                send();
              },
              child: CustomOutlineButton(
                title: "Continue",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
