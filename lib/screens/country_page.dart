import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/update_user.dart';
class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final registorController = Get.put(registerController());
  final formcountrypage = GlobalKey<FormState>();
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
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),


          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Form(
              key: formcountrypage,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10),
                          child: Text(
                            "Please tell us your nationality and place of birth",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10),
                          child: Text(
                            "This is needed for regulatory and feature customizations. ",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(height: 40,),
                        CommonTextfield(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Enter Nationality Country')
                          ]),

                          controller: registorController.countryController,obSecure: false, labelText: " Nationality Country", hintText: '',
                          //   prefix:    Padding(
                          //   padding: const EdgeInsets.only(left: 12.0),
                          //   child: SvgPicture.asset('assets/images/address.svg',width: 20,height: 10,),
                          // ),
                        ),
                        SizedBox(height: 15,),
                        CommonTextfield(
                          validator: MultiValidator(
                              [RequiredValidator(errorText: 'Enter City')]),
                          controller: registorController.regionController,obSecure: false, labelText: "City", hintText: '',),
                        SizedBox(height: 15,),
                        CommonTextfield(
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Enter Country of Birth')
                          ]),
                          obSecure: false, labelText: " Country of Birth", hintText: ' ',
                          //   prefix:    Padding(
                          //
                          //   padding: const EdgeInsets.only(left: 12.0),
                          //   child: SvgPicture.asset('assets/images/address.svg',width: 20,height: 10,),
                          // ),

                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10),
                          child: Text(
                            "What is your gender? ",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),

                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      print(registorController.genderType.value);
                                      registorController.genderType.value="male" ;
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(width: 2,color: registorController.genderType.value=="male"?  AppTheme.primaryColor:Colors.transparent)
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/images/boy.png',),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Male",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),

                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      print(registorController.genderType.value);
                                      registorController.genderType.value="female" ;
                                      setState(() {

                                      });
                                      // color: registorController.genderType.value=="female"?  AppTheme.primaryColor:Colors.transparent
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
borderRadius: BorderRadius.circular(10),
                                          border: Border.all(width: 2,color: registorController.genderType.value=="female"?  AppTheme.primaryColor:Colors.transparent)
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/images/girl.png',),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Female",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: size.height*.1,),
                        InkWell(
                            onTap: (){
      if (formcountrypage.currentState!.validate()) {
        Get.toNamed(MyRouters.otpScreen);
      }
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



                  )),
            )));
  }
}

