import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/update_user.dart';
class TagScreen extends StatefulWidget {
  const TagScreen({Key? key}) : super(key: key);

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  final registorController = Get.put(registerController());

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
      "Choose a @Zip Tag, your unique name for getting paid by anyone ",
      style: GoogleFonts.poppins(
      color: const Color(0xFF1D1D1D),
      fontSize: 22,
      fontWeight: FontWeight.w500),
      ),
    ),

    SizedBox(height: 40,),
      CommonTextfield(controller: registorController.zipController,obSecure: false, hintText: "@"),
      Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10),
        child: Text(
          "Please enter a tag",
          style: GoogleFonts.poppins(
              color: const Color(0xFFB6B6B6),
              fontSize: 15,
              fontWeight: FontWeight.w300),
        ),
      ),
      SizedBox(height: size.height*.52,),
      InkWell(
          onTap: (){
            Get.toNamed(MyRouters.addressScreen);
          },
          child: CustomOutlineButton(title: "Next",)),


    ]
    ))));
  }
}

