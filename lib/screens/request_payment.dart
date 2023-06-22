import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/screens/addapayer.dart';
import 'package:zip/widgets/common_colour.dart';


import '../widgets/common_textfield.dart';

class RequestPayment extends StatefulWidget {
  const RequestPayment({Key? key}) : super(key: key);

  @override
  State<RequestPayment> createState() => _RequestPaymentState();
}

class _RequestPaymentState extends State<RequestPayment> {
  bool isSwitched =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Payment request",
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20,top: 20,bottom: 10),
            child: InkWell(
              onTap: (){
                Get.to(AddAPayer());
              },
              child: Container(
                height: 25,
                width: 27,
                decoration: BoxDecoration(
                    color: Color(0x1a1d1d1d),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Icon(Icons.add),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 29, right: 29, bottom: 35,top: 36),
              child: CommonTextfield(
                prefix: Icon(Icons.search),
                obSecure: false,
                hintText: "Search by name or amount",
                labelText: "",
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Show pending requests",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Spacer(),

                CupertinoSwitch(
                  value: isSwitched,
                  activeColor: Color(0xffF0D75F),
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });

                  },
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(height: 16,),

            Container(
              height: 29,
              width: Get.width,
              color: Color(0x4fd9d9d9),
              child: Center(
                child: Text(
                  "24 Mar 2023",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),

           Padding(
             padding: const EdgeInsets.only(left: 30,right: 30,top: 21),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   "Raquel Smitham",
                   style: GoogleFonts.poppins(
                       color: const Color(0xFF1D1D1D),
                       fontSize: 13,
                       fontWeight: FontWeight.w400),
                 ),
                 Text(
                   "100.00 USD",
                   style: GoogleFonts.poppins(
                       color: const Color(0xFF1D1D1D),
                       fontSize: 13,
                       fontWeight: FontWeight.w400),
                 ),
               ],
             ),
           ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Align(
                alignment: Alignment.topLeft ,
                child: Text(
                  "Pending",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            SizedBox(height: 11,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Raquel Smitham",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "100.00 USD",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Align(
                alignment: Alignment.topLeft ,
                child: Text(
                  "Clear",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
