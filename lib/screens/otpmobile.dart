import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';
class MobileOtpScreen extends StatefulWidget {
  const MobileOtpScreen({Key? key}) : super(key: key);

  @override
  State<MobileOtpScreen> createState() => _MobileOtpScreenState();
}

class _MobileOtpScreenState extends State<MobileOtpScreen> {
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
                        child: Text(
                          "Please enter 6 digits code we sent to",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: Text(
                          "+234 xxxxxxxxxxx",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFFB2802A),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      CommonTextfield(obSecure: false, hintText: "000-000",),
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
                            Get.toNamed(MyRouters.selectableScreen);
                          },
                          child: CustomOutlineButton(title: "Tap to verify using USSD",)),
                      SizedBox(height: 15,),
                      Text(
                        "This is free and will verify instantly",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
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

