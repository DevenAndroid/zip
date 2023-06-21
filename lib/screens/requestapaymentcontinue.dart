import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../widgets/common_button.dart';

class RequestAPaymentContiune extends StatefulWidget {
  const RequestAPaymentContiune({Key? key}) : super(key: key);

  @override
  State<RequestAPaymentContiune> createState() => _RequestAPaymentContiuneState();
}

class _RequestAPaymentContiuneState extends State<RequestAPaymentContiune> {
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
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 48,),
          Image.asset(
            'assets/images/right.png',
            height: 121,
          ),
          Text(
            "You requested 100.00 USD",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          Text(
            "From Daneil",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: size.height * .5,
          ),
          InkWell(
            onTap: () {
Get.toNamed(MyRouters.sharePaymentLink);
            },
            child: CustomOutlineButton(
              title: "Next",
            ),
          ),
        ],
      ),
    );
  }
}
