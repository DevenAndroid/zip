import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/screens/buyservices.dart';
import 'package:zip/widgets/common_colour.dart';


import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';

class MyCard extends StatefulWidget {
  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Card",
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
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15,),
            Text(
              "Your Balance",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "\$276.00",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),

            SizedBox(
              height: 22,
            ),
            CarouselSlider(
              items: [
                Card(
                  elevation: 4.0,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Container(
                    height: 180,
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 0, bottom: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 18, top: 17),
                          child: Image.asset(
                            "assets/images/walletlogo.png",
                            height: 45,
                            width: 44,
                          ),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Card Holder Name',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  '--',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Expiry date',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  '--/--',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/images/round2.png",
                                  height: 35,
                                  width: 35,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Image.asset(
                                    "assets/images/round1.png",
                                    height: 35,
                                    width: 34,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            SizedBox(
              height: 34,
            ),
            Text(
              "This card will expire in 7 months",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 11,
            ),
            InkWell(
              onTap: () {
                Get.to(MyCard());
              },
              child: SizedBox(
                width: 200,
                child: CustomOutlineButton(
                  title: "Order a new card",
                ),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 98,
                  width: 98,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                    color: Color(0xffFAFAFA),),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add,size: 40,),
                      Text(
                        "Add Money",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF2E2E2E),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 98,
                  width: 98,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                    color: Color(0xffFAFAFA),),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.credit_card,size: 40,),
                      Text(
                        "Card Details",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF2E2E2E),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 98,
                  width: 98,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                    color: Color(0xffFAFAFA), ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.ac_unit,size: 40,),
                      Text(
                        "Freeze card",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF2E2E2E),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: InkWell(
                onTap: (){
                   Get.to(BuyServices());
                },
                child: CustomOutlineBoder(title: "Add to GPay", backgroundColor: Colors.white,textColor: AppTheme.buttonColor,onPressed: (){

                },),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 1,
              color: Color(0x1A000000),
            ),
            SizedBox(
              height: 17,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 23),
                child: Text(
                  "Manage Card",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF2E2E2E),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23,right: 23),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xff1D1D1D))),
                child: ListTile(
                  leading: Icon(Icons.settings_suggest_outlined),
                  title:    Text(
                    "Manage payment methods",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                )
              ),
            ),
            SizedBox(
              height: 17,
            ),
          ],
        ),
      ),
    );
  }
}
