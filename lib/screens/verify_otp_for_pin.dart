import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:zip/repository/verify_otp_for_pin_repo.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_colour.dart';
import '../controller/update_user.dart';
import '../models/verify_otp_for_pin_modal.dart';
import '../resourses/api_constant.dart';

class VerifyOtpForPin extends StatefulWidget {
  const VerifyOtpForPin({Key? key}) : super(key: key);

  @override
  State<VerifyOtpForPin> createState() => _VerifyOtpForPinState();
}

class _VerifyOtpForPinState extends State<VerifyOtpForPin> {
  final formKeypin = GlobalKey<FormState>();
  Rx<RxStatus> statusOfverify = RxStatus.empty().obs;
  TextEditingController verifyotpController = TextEditingController();
  Rx<VerifyOtpForPinModal> verifyotp = VerifyOtpForPinModal().obs;

  VerifyOtp() {
    if (formKeypin.currentState!.validate()) {
      verifyOtpForPinRepo(
              context: context, otp: verifyotpController.text.trim())
          .then((value) {
        verifyotp.value = value;
        if (value.status == true) {
          Get.toNamed(MyRouters.changeZipPinScreen);
          statusOfverify.value = RxStatus.success();
          showToast(value.message.toString());
        } else {
          statusOfverify.value = RxStatus.error();
          showToast(value.message.toString());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          key: formKeypin,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "Verify your unique 4-digits pin!",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "Please enter your 4 digit otp correctly ",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Center(
                        child: Pinput(
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Enter 4 Digit Pin')
                          ]),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          controller: verifyotpController,
                          keyboardType: TextInputType.number,
                          length: 4,
                          defaultPinTheme: defaultPinTheme,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .6,
                    ),
                    InkWell(
                      onTap: () {
                        VerifyOtp();
                      },
                      child: CustomOutlineBoder(
                        title: "Update",
                        backgroundColor: Colors.white,
                        textColor: AppTheme.buttonColor,
                        onPressed: () {},
                      ),
                    )
                  ])),
        )));
  }
}
