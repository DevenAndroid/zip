import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';
class ExtraDetailsScreen extends StatefulWidget {
  const ExtraDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ExtraDetailsScreen> createState() => _ExtraDetailsScreenState();
}

class _ExtraDetailsScreenState extends State<ExtraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:   InkWell(

            onTap: (){
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),

          ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0,right: 10),
            child: InkWell(
              onTap: (){
                Get.toNamed(MyRouters.countryScreen);
              },
              child: Text(
                "Skip",
                style: GoogleFonts.poppins(
                    color: const Color(0xFFF0D75F),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],

        ),
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
                          "Please add any extra details to complete this  ",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 40,),
                      CommonTextfield(obSecure: false, labelText: "Street Name", hintText: '',),
                      SizedBox(height: 15,),
                      CommonTextfield(obSecure: false, labelText: "House Number", hintText: '',),
                      SizedBox(height: 15,),
                      CommonTextfield(obSecure: false, labelText: "Additional", hintText: '',),
                      SizedBox(height: 15,),
                      CommonTextfield(obSecure: false, labelText: "Postal Code", hintText: '',),
                      SizedBox(height: 15,),
                      CommonTextfield(obSecure: false, labelText: "Region/state", hintText: '',),
                      SizedBox(height: 15,),
                      CommonTextfield(obSecure: false, labelText: "City", hintText: '',),
                      SizedBox(height: 15,),
                      CommonTextfield(obSecure: false, labelText: "Country", hintText: '',),
                      SizedBox(height: size.height*.1,),
                      InkWell(
                          onTap: (){
                            Get.toNamed(MyRouters.countryScreen);
                          },
                          child: CustomOutlineButton(title: "Next",)),

                    ]
                ))));
  }
}

