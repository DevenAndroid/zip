import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';
class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({Key? key}) : super(key: key);

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
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
    Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10),
      child: Row(
        children: [
          Text(
          "Welcome to Zip Daniel ",
          style: GoogleFonts.poppins(
          color: const Color(0xFF1D1D1D),
          fontSize: 22,
          fontWeight: FontWeight.w500),
          ),
          SvgPicture.asset('assets/images/Hand.svg',),
          Text(
            " !",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),

        ],
      ),
    ),
      SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10),
        child: Text(

          "When is your birthday? ",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 22,
              fontWeight: FontWeight.w500),
        ),
      ),
    SizedBox(height: 40,),
      CommonTextfield(obSecure: false, hintText: "15-09-2005"),
SizedBox(height: size.height*.5,),
        InkWell(
        onTap: (){
 Get.toNamed(MyRouters.tagScreen);
    },
        child: CustomOutlineButton(title: "Next",)),
        SizedBox(height: 20,),
        InkWell(
            onTap: (){
             Get.toNamed(MyRouters.tagScreen);
            },
            child: CustomOutlineBoder(title: "Skip", backgroundColor: Colors.white,textColor: AppTheme.buttonColor,onPressed: (){
              Get.toNamed(MyRouters.enterEmailScreen);
            },),

        )]

    ))));
  }
}
