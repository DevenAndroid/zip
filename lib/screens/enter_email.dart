import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
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
                                Get.toNamed(MyRouters.mobileNumber);
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
                 CommonTextfield(obSecure: false, hintText: "",labelText: "Email",),
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
                    SizedBox(height:size.height*.35,),

                    InkWell(
                        onTap: (){
                          Get.toNamed(MyRouters.otpEmailScreen);
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
            )));
  }
}
