import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/screens/mycard.dart';
import 'package:zip/widgets/common_colour.dart';

import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class AddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Add Card",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 71,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(color: Color(0xff1D1D1D))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
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
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [

                                      Color(0xFFF0D75F),
                                      Color(0xFFB2802A),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter
                                ),
                                borderRadius: BorderRadius.circular(7),
                              ),

                              height: 25,
                              width: 110,
                              child: Center(
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
              SizedBox(height: 10,),
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
                padding: const EdgeInsets.only(left: 6, right: 6),
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
                padding: const EdgeInsets.only(left: 6, right: 6),
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
                  title: "Pay NGN 10",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
