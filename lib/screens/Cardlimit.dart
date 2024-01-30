import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routers/my_routers.dart';
import '../widgets/common_colour.dart';

class CardLimitScreen extends StatefulWidget {
  const CardLimitScreen({Key? key}) : super(key: key);

  @override
  State<CardLimitScreen> createState() => _CardLimitScreenState();
}

class _CardLimitScreenState extends State<CardLimitScreen> {
  int currentDrawer = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
          title: Text(
            "Limit",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              width: size.width * .8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFF1F1F1)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentDrawer = 0;
                                          Get.toNamed(MyRouters.limitScreen);
                                        });
                                      },
                                      child: Container(
                                        width: 100,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 12),
                                        decoration: currentDrawer == 0
                                            ? BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              )
                                            : BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                        child: Center(
                                          child: Text("Transfer",
                                              style: currentDrawer == 0
                                                  ? GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF1D1D1D),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  : GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF1D1D1D),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 60,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentDrawer = 1;
                                        });
                                      },
                                      child: Container(
                                        width: 100,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 12),
                                        decoration: currentDrawer == 1
                                            ? BoxDecoration(
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Color(0xFFF0D75F),
                                                      Color(0xFFB2802A),
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end:
                                                        Alignment.bottomCenter),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              )
                                            : BoxDecoration(
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Color(0xFFF0D75F),
                                                      Color(0xFFB2802A),
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end:
                                                        Alignment.bottomCenter),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                        child: Center(
                                          child: Text("Cards",
                                              style: currentDrawer == 1
                                                  ? GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  : GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                  ]),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppTheme.primaryColor),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(
                                  0.5,
                                  0.5,
                                ), //Offset
                                blurRadius: 0.5,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Card Transfer ",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF1D1D1D),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Daily ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF9B9797),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                Text("\$333333 ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF4A4A4A),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const Divider(
                                color: Color(0xFFEBF7EC),
                                thickness: 5,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("You have  ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF9B9797),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text("\$333333 ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text("Left",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF9B9797),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppTheme.primaryColor),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(
                                  0.5,
                                  0.5,
                                ), //Offset
                                blurRadius: 0.5,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bank Transfer ",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF1D1D1D),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Daily ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF9B9797),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                Text("\$333333 ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF4A4A4A),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const Divider(
                                color: Color(0xFFEBF7EC),
                                thickness: 5,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("You have  ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF9B9797),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text("\$333333 ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text("Left",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF9B9797),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppTheme.primaryColor),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(
                                  0.5,
                                  0.5,
                                ), //Offset
                                blurRadius: 0.5,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bank Transfer ",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF1D1D1D),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Daily ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF9B9797),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                Text("\$333333 ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF4A4A4A),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const Divider(
                                color: Color(0xFFEBF7EC),
                                thickness: 5,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("You have  ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF9B9797),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text("\$333333 ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text("Left",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF9B9797),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]))));
  }
}
