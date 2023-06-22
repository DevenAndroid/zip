import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';
class YourBalanceScreen extends StatefulWidget {
  const YourBalanceScreen({Key? key}) : super(key: key);

  @override
  State<YourBalanceScreen> createState() => _YourBalanceScreenState();
}

class _YourBalanceScreenState extends State<YourBalanceScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
    title: Text(
    "Your Balance",
    style: GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 20,
    fontWeight: FontWeight.w500),
    ),

    centerTitle: true,
    ),
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Center(
        child: Text(
          "\$276.00",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10),
        child: Text(

          "Cash out to your preferred payment method",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
      SizedBox(height: 18,),
CommonTextfield(obSecure: false, hintText: "",labelText: "Enter amount",),
SizedBox(height: 8,),
      Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10),
        child: Text(
          "This transection is free",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 13,
              fontWeight: FontWeight.w300),
        ),
      ),

      SizedBox(height: size.height*.55,),
      InkWell(
          onTap: (){
            Get.toNamed(MyRouters.selectMethod);
          },
          child: CustomOutlineButton(title: "Send",)),


   ]))));
  }
}

