import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/screens/paybillsservices.dart';
import 'package:zip/widgets/common_colour.dart';


import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class BuyServices extends StatefulWidget {
  @override
  State<BuyServices> createState() => _BuyServicesState();
}

class _BuyServicesState extends State<BuyServices> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buy Airtime",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_rounded,
          color: AppTheme.primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Enter a phone number buy Airtime",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 44,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CommonTextfield(
                prefix: Image.asset('assets/images/nigeria.png',height: 20,),
                obSecure: false,
                hintText: "Nigeria",
                labelText: "Country",
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CommonTextfield(
                obSecure: false,
                hintText: "+234 xxxxxxxxxx",
                labelText: "Enter Phone Number",
              ),
            ),
            SizedBox(
              height: size.height * .4,
            ),
            InkWell(
              onTap: () {},
              child: CustomOutlineButton(
                title: "Contacts",
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: () {
                Get.to(PayBillsServices());
              },
              child: CustomOutlineBoder(
                title: "Next",
                backgroundColor: Colors.white,
                textColor: AppTheme.buttonColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
