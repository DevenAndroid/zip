import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';
class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(

                        onTap: (){
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: AppTheme.primaryColor,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Please tell us your nationality and place of birth",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "This is needed for regulatory and feature customizations. ",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 40,),
                      CommonTextfield(obSecure: false, labelText: " Nationality Country", hintText: '',prefix:    Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: SvgPicture.asset('assets/images/address.svg',width: 20,height: 10,),
                      ),),
                      SizedBox(height: 15,),
                      CommonTextfield(obSecure: false, labelText: "City", hintText: '',),
                      SizedBox(height: 15,),
                      CommonTextfield(obSecure: false, labelText: " Country of Birth", hintText: '',prefix:    Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: SvgPicture.asset('assets/images/address.svg',width: 20,height: 10,),
                      ),),
                      SizedBox(height: 15,),
                      Text(
                        "What is your gender? ",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),

SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 20),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/boy.png',),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/girl.png',),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: size.height*.1,),
                      InkWell(
                          onTap: (){
                            Get.toNamed(MyRouters.otpScreen);
                          },
                          child: CustomOutlineButton(title: "Next",)),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(MyRouters.otpScreen);
                        },
                        child: CustomOutlineBoder(title: "Skip", backgroundColor: Colors.white,textColor: AppTheme.buttonColor,onPressed: (){
                          Get.toNamed(MyRouters.otpScreen);
                        },),

                      )]



                ))));
  }
}
