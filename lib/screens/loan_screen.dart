
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
class LoanScreen extends StatefulWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SingleChildScrollView(
              child: Stack(children:[ Image.asset('assets/images/banner.png'),
                Positioned(
                  top: 30,
                  left: 15,
                  child: InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,

                      ),
                      child: Icon(Icons.arrow_back)
                    ),
                  ),
                ),

              ]),
            ),



            Padding(
              padding: const EdgeInsets.only(top: 10,left: 18.0),
              child: Text(
                "Get a loan that treats you right",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
            ),
SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 13.0,right: 13),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),

                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.secondaryColor,

                            ),
                            child:Icon(Icons.check,color: Colors.white,size: 20,)
                          ),
                          SizedBox(width: 15,),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              "Apply in a few taps",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF1D1D1D),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),

                            ),
                          )


                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SvgPicture.asset('assets/images/clock.svg',color: AppTheme.secondaryColor,),
                          // Container(
                          //   padding: EdgeInsets.all(3),
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     color: AppTheme.secondaryColor,
                          //
                          //   ),
                          //   child:Icon(Icons.clock,color: Colors.white,)
                          // ),
                          SizedBox(width: 15,),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              "Monday in minutes. if eligible",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF1D1D1D),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),

                            ),
                          )


                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.secondaryColor,

                            ),
                            child: Text("\$",
                              style: GoogleFonts.poppins(
                                  color:  Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),),
                          ),
                          SizedBox(width: 15,),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              "Pay extra and early. fee-free",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF1D1D1D),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),

                            ),
                          ),


                        ],
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "  Learn more",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFFBA8C31),
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),


              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 13.0,right: 13),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),

                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Text(
                            "Representative APR  ",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF575757),
                                fontSize: 17,
                                fontWeight: FontWeight.w600),

                          ),
SvgPicture.asset('assets/images/icon.svg')

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Text(
                            "\$10,000-\$25,000",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF575757),
                                fontSize: 17,
                                fontWeight: FontWeight.w600),

                          ),
                      Spacer(),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 13,vertical: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppTheme.secondaryColor,

                              ),
                              child:Text(" 13.8% ",
                                style: GoogleFonts.poppins(
                                    color:  Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),)
                          ),

                        ],
                      ),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Text(
                            "\$10,000-\$25,000",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF575757),
                                fontSize: 17,
                                fontWeight: FontWeight.w600),

                          ),
                      Spacer(),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 13,vertical: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppTheme.secondaryColor,

                              ),
                              child:Text(" 13.8% ",
                                style: GoogleFonts.poppins(
                                    color:  Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),)
                          ),

                        ],
                      ),

                    ],
                  ),
                ),


              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 18.0,top: 10),
              child: Text(
                "Our customers say  ",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF575757),
                    fontSize: 19,
                    fontWeight: FontWeight.w600),

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 13.0,right: 13,top: 12),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),

                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "I used my Manzo loan to consolidate my other loans and streamline my finances. L,ve reduced my monthly outgoing bills which hav given me a new way of",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 17,
                            fontWeight: FontWeight.w600),

                      ),

                    ],
                  ),
                ),


              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13.0,right: 13,top: 12),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.secondaryColor),
color: Color(0xFFB2802A).withOpacity(.15)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/lock3.svg"),
                      Text(
                        "    This won’t impact your credit score",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 17,
                            fontWeight: FontWeight.w600),

                      ),

                    ],
                  ),
                ),


              ),
            ),
            SizedBox(height: 15,),
            InkWell(
                onTap: (){
Get.toNamed(MyRouters.loanList);
                  // emailLogin();
                  //
                },
                child: CustomOutlineButton(title: "Get your personalized rate",)),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
