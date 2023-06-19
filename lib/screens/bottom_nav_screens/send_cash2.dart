import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

class SendCash2 extends StatefulWidget {

  const SendCash2({Key? key}) : super(key: key);

  @override
  State<SendCash2> createState() => _SendCash2State();
}

class _SendCash2State extends State<SendCash2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,


          leading:   InkWell(

            onTap: (){
              Get.back();
            },

            child: const Icon(
              Icons.arrow_back_rounded,
              // color: AppTheme.primaryColor,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Account details",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),


        ),
        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: InkWell(
              onTap: () {
Get.toNamed(MyRouters.chooseBank);
              },
              child: const CustomOutlineButton(
                title: "Continue",
              )),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            SvgPicture.asset('assets/images/mark.svg'),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Beneficiaries',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF1D1D1D)),
                                  ),
                                ),
                                Text(
                                  'Send to already saved channels',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: 20,),

                      CommonTextfield(
                        onTap: (){
                          Get.toNamed(MyRouters.chooseBank);
                        },
                        suffixIcon: Icon(Icons.keyboard_arrow_down),
                        readOnly: true,
                        obSecure: false,
                        hintText: "AG mortgage bank",

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CommonTextfield(
                        obSecure: false,
                        hintText: "",
                        labelText: "Mobile Number",
                      ),
                      SizedBox(height: 20,),

                      CommonTextfield(
                        obSecure: false,
                        hintText: "",
                        labelText: "Mobile Number",
                      ),
                      SizedBox(height: 20,),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Row(

    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Save as Beneficiary',
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF1D1D1D)),
        ),),
    Icon(Icons.circle,color: Colors.black,)
    ],
  ),
)
                    ]
                )))
    );
  }
}
