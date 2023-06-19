import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_colour.dart';


import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';

class GeneratePaymentLink extends StatefulWidget {
  const GeneratePaymentLink({Key? key}) : super(key: key);

  @override
  State<GeneratePaymentLink> createState() => _GeneratePaymentLinkState();
}

class _GeneratePaymentLinkState extends State<GeneratePaymentLink> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Request a payment",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "Cancel",
              style: GoogleFonts.poppins(
                  color: const Color(0xFFF0D75F),
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 37,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "Amount Requested",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "100.00 USD",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35,right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payer Name",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Daniel",
                    style: GoogleFonts.poppins(
                        color: const Color(0x851D1D1D),
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35,right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payer Email",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Daniel@gmail.com",
                    style: GoogleFonts.poppins(
                        color: const Color(0x851D1D1D),
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35,right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment due date",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "30 Mar 2023",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFFF0D75F),
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "Add attachment",
                style: GoogleFonts.poppins(
                    color: const Color(0xFFF0D75F),
                    fontSize: 11,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "Description",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 32, right: 32, top: 20, bottom: 32),
              child: Text(
                "Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor. Cupiditate ut quae sit ipsam. Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor.",
                style: GoogleFonts.poppins(
                    color: const Color(0x871D1D1D),
                    fontSize: 9,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
              child: Text(
                "Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor. Cupiditate ut quae sit ipsam. Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor.",
                style: GoogleFonts.poppins(
                    color: const Color(0x871D1D1D),
                    fontSize: 9,
                    fontWeight: FontWeight.w300),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: CustomOutlineBoder(
                title: "Generate Payment Link",
                backgroundColor: Colors.white,
                textColor: AppTheme.buttonColor,
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 20 ,
            ),
            InkWell(
              onTap: () {

              },
              child: CustomOutlineButton(
                title: "Request Payment",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
