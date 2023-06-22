
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../widgets/common_button.dart';

class RequestApaymentConfirm extends StatefulWidget {
  const RequestApaymentConfirm({Key? key}) : super(key: key);

  @override
  State<RequestApaymentConfirm> createState() => _RequestApaymentConfirmState();
}

class _RequestApaymentConfirmState extends State<RequestApaymentConfirm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Request a payment",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        leading: InkWell(
          onTap: (){Get.back();},
          child: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20,top: 20),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 37),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "0/250",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.only(left: 35,right: 35),
              child: Text(
                "Add a description for your payer of the services or goods provided",
                style: GoogleFonts.poppins(
                    color: const Color(0x3D1D1D1D),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: size.height * .6,
            ),
            InkWell(
              onTap: () {
Get.toNamed(MyRouters.paymentLink);
              },
              child: CustomOutlineButton(
                title: "Confirm",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
