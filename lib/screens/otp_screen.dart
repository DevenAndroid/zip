
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_colour.dart';
class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey99 = GlobalKey<FormState>();
  TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme =  PinTheme(
        width: 56,
        height: 56,
        textStyle: const TextStyle(
          fontSize: 22,
          color: Color.fromRGBO(30, 60, 87, 1),
        ),
        decoration: BoxDecoration(
            border: Border.all(color:AppTheme.primaryColor,width: 1.5),
          borderRadius: BorderRadius.circular(10)
            

        ));
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
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

    Text(
    "Create your unique 4-digits pin!",
    style: GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 22,
    fontWeight: FontWeight.w500),
    ),
    SizedBox(height: 10,),
    Text(
    "Please remember this pin. It’ll be used to keep your account secure ",
    style: GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 15,
    fontWeight: FontWeight.w400),
    ),
    SizedBox(height: 40,),

      Center(
        child: Form(
          key: formKey99,
          child:  Pinput(
            controller: otpcontroller,
            keyboardType: TextInputType.number,
            length: 4,
            defaultPinTheme: defaultPinTheme,
          ),
        ),
      ),
      SizedBox(height: size.height*.6,),
      InkWell(
        onTap: (){
       Get.toNamed(MyRouters.transactionsFirst );
        },
        child: CustomOutlineBoder(title: "Skip", backgroundColor: Colors.white,textColor: AppTheme.buttonColor,onPressed: (){
          Get.toNamed(MyRouters.otpScreen);
        },),

      )]
    ))));
  }
}