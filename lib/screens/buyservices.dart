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
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Buy Airtime",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Enter a phone number buy Airtime",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 44,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                prefix: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/nigeria.png',
                    height: 20,
                  ),
                ),
                obSecure: false,
                hintText: "Nigeria",
                labelText: "Country",
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
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
              child: const CustomOutlineButton(
                title: "Contacts",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(const PayBillsServices());
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
