import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';
class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
                          "What is your residential address?",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 40,),
                      CommonTextfield(obSecure: false, hintText: "Start typing your address",prefix: Icon(Icons.search),suffixIcon:    Padding(
                        padding: const EdgeInsets.only(right: 9.0),
                        child: SvgPicture.asset('assets/images/address.svg',width: 20,height: 10,),
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: Text(
                          "Don’t know your address?",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFFB6B6B6),
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(height: size.height*.6,),
                      InkWell(
                          onTap: (){
                            Get.toNamed(MyRouters.extraDetailsScreen);
                          },
                          child: CustomOutlineButton(title: "Use my phone location instead",)),

                    ]
                ))));
  }
}
