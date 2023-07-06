import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routers/my_routers.dart';
import '../widgets/common_colour.dart';
class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
        "Support",
        style: GoogleFonts.poppins(
        color: const Color(0xFF1D1D1D),
    fontSize: 20,
    fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    leading: InkWell(
    onTap: (){
    Get.back();
    },
    child: Icon(
    Icons.arrow_back_rounded,
    color: AppTheme.primaryColor,
    ),
    ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
      children: [
        SizedBox(height: 15,),
        Text(
          "FAQ",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 15,),
        SizedBox(height: 15,),
        InkWell(
          onTap: (){
            Get.toNamed(MyRouters.contuctUsScreen);
          },
          child: Text(
            "Contact US",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 15,),
        SizedBox(height: 15,),
        Text(
          "Chat With Us ",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 15,),
      ],
      ),
    ),
    );
  }
}
