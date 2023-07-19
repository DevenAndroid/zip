import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/screens/requestapaymentconfirm.dart';

import '../controller/update_user.dart';
import '../widgets/common_button.dart';

class RequestAPayment extends StatefulWidget {
  const RequestAPayment({Key? key}) : super(key: key);

  @override
  State<RequestAPayment> createState() => _RequestAPaymentState();
}

class _RequestAPaymentState extends State<RequestAPayment> {
  final register = Get.put(registerController());
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
        leading: InkWell(
          onTap: (){Get.back();},
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 27,),
            Text(
              "Enter amount to request from Daneil",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 30,),
            Container(
              height: 28,
              width: 38,
              decoration: BoxDecoration(
                  color: Color(0x1a1d1d1d),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child:  Center(
                  child: Text(
                    "USD",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ) ,
              ),
            ),
            Text(
              "0.00",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 70,
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70,right: 70),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
            Text(
              "0.00 - 0.00",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: size.height * .5,
            ),
            InkWell(
              onTap: () {
              Get.to(RequestApaymentConfirm());
              },
              child: CustomOutlineButton(
                title: "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
