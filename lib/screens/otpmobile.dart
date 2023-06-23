import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../models/model_verify_otp.dart';
import '../models/registor_model.dart';
import '../repository/verify_otp_repo.dart';
import '../resourses/api_constant.dart';
class MobileOtpScreen extends StatefulWidget {
  const MobileOtpScreen({Key? key}) : super(key: key);

  @override
  State<MobileOtpScreen> createState() => _MobileOtpScreenState();
}

class _MobileOtpScreenState extends State<MobileOtpScreen> {
  Rx<RxStatus> statusOfVerify = RxStatus.empty().obs;

  Rx<ModelVerifyOtp> verifyOtp = ModelVerifyOtp().obs;
  TextEditingController mobileOtpController = TextEditingController();
  Rx<ModelCommonResponse> login = ModelCommonResponse().obs;

  var initStateBlank = Get.arguments[0];
  VerifyOtp() {
    verifyOtpRepo(
      refrence:  "/${ Get.arguments[0]}/validate",
        otp:mobileOtpController.text.trim() ,
        context: context,


    ).then((value) {
      verifyOtp.value = value;
    Get.toNamed(MyRouters.bottomNavbar);


       showToast(value.message.toString());
    });
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

                      CommonTextfield(controller: mobileOtpController,obSecure: false, hintText: "000-000",),
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
                            VerifyOtp();
                            // Get.toNamed(MyRouters.selectableScreen);
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

                    ]))));
  }
}

