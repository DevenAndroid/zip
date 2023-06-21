import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/screens/request_payment.dart';
import 'package:zip/widgets/common_colour.dart';


import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class Transferlimit extends StatefulWidget {
  const Transferlimit({Key? key}) : super(key: key);

  @override
  State<Transferlimit> createState() => _TransferlimitState();
}

class _TransferlimitState extends State<Transferlimit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Transfer Limit",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: Color(0xffFAFAFA)),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/transferlimiticon.png',
                      height: 72,
                    ),
                    Text(
                      "\$10,000.00",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Current Daily Limit",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 11,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: CommonTextfield(
              obSecure: false,
              hintText: "20,000",
              labelText: "Set daily limit account",
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: CommonTextfield(
              obSecure: false,
              hintText: "1234",
              labelText: "Card number",
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: CommonTextfield(
              obSecure: false,
              suffixIcon: Icon(Icons.remove_red_eye),
              hintText: "....",
              labelText: "Card PIN",
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
              Get.to(RequestPayment());
            },
            child: CustomOutlineButton(
              title: "Done  ",
            ),
          ),
        ],
      ),
    );
  }
}
