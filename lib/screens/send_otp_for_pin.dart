import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/resourses/api_constant.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';

import '../repository/send_otp_for_pin_repo.dart';


class SendOtpForPin extends StatefulWidget {
  const SendOtpForPin({Key? key}) : super(key: key);

  @override
  State<SendOtpForPin> createState() => _SendOtpForPinState();
}

class _SendOtpForPinState extends State<SendOtpForPin> {
  TextEditingController oldZipController = TextEditingController();
  TextEditingController newZipController = TextEditingController();


  Rx<RxStatus> statusOfZipTag = RxStatus.empty().obs;

  final formKeyTag = GlobalKey<FormState>();
  String? gender;

  sendotpforpin() {
      sendOtpForPinRepo(
          context: context,
          type: gender.toString()
      ).then((value) {
        if (value.status == true) {
          Get.toNamed(MyRouters.verifyOtpForPinScreen);
           showToast(value.message.toString());

        } else {
          showToast(value.message.toString());
        }
      }
      );
  }

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
              key: formKeyTag,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Text(
                            "Select Type For chnage your Pin ",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        RadioListTile(
                          title: Text("Email"),
                          value: "email",
                          groupValue: gender,
                          onChanged: (value){
                            setState(() {
                              gender = value;
                              print(gender);
                            });
                          },
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        RadioListTile(
                          title: Text("Phone"),
                          value: "phone",
                          groupValue: gender,
                          onChanged: (value){
                            setState(() {
                              gender = value;
                              print(gender);
                            });
                          },
                        ),
                        SizedBox(
                          height: size.height * .52,
                        ),
                        InkWell(
                            onTap: () {
                              sendotpforpin();

                            },
                            child: const CustomOutlineButton(
                              title: "Update",
                            )),
                      ])),
            )));
  }
}
