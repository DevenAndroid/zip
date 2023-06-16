import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/screens/mycard.dart';

import '../resources.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class AddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Card",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 37, right: 37),
            child: Text(
              'To add your card as payment method please complete this deposit of NGN 10',
              style: GoogleFonts.poppins(
                  color: Color(0xff1D1D1D),
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(29),
            child: Container(
              height: 71,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(color: Color(0xff1D1D1D))),
              child: Padding(
                padding: const EdgeInsets.only(left: 23, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/walletlogo.png",
                      height: 45,
                      width: 44,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'joanneDaniel@gmail.com',
                          style: GoogleFonts.poppins(
                              color: Color(0xff1D1D1D),
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 25,
                          width: 110,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xffF0D75F))),
                            onPressed: () {},
                            child: Text(
                              "Pay NGN 10",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFFffffff),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Text(
            "Enter your card details to pay",
            style: GoogleFonts.poppins(
                color: const Color(0xFF2E2E2E),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 29, right: 29),
            child: CommonTextfield(
              obSecure: false,
              hintText: "0000 0000 0000 0000 0000",
              labelText: "CARD NUMBER",
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 29, right: 29),
            child: Row(
              children: [
                Expanded(
                    child: CommonTextfield(
                  obSecure: false,
                  hintText: "MM/YY",
                  labelText: "CARD EXPIRY",
                )),
                Expanded(
                    child: CommonTextfield(
                  obSecure: false,
                  hintText: "123",
                  labelText: "CVV",
                )),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .3,
          ),
          InkWell(
            onTap: () {
              Get.to(MyCard());
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
