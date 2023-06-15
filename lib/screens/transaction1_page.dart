import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

class TransactionsFirst extends StatefulWidget {
  const TransactionsFirst({Key? key}) : super(key: key);

  @override
  State<TransactionsFirst> createState() => _TransactionsFirstState();
}

class _TransactionsFirstState extends State<TransactionsFirst> {
  int currentDrawer = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
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
            "Transactions",
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentDrawer = 0;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 12),
                                decoration: currentDrawer == 0
                                    ? BoxDecoration(
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFF0D75F),
                                              Color(0xFFB2802A),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter),
                                        borderRadius: BorderRadius.circular(15),
                                      )
                                    : BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                child: Text("Daily",
                                    style: currentDrawer == 0
                                        ? GoogleFonts.poppins(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)
                                        : GoogleFonts.poppins(
                                            color: const Color(0xFF1D1D1D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentDrawer = 1;
                                });
                              },
                              child: Container(
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
                                            end: Alignment.bottomCenter),
                                        borderRadius: BorderRadius.circular(15),
                                      )
                                    : BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                child: Text("Weekly",
                                    style: currentDrawer == 1
                                        ? GoogleFonts.poppins(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)
                                        : GoogleFonts.poppins(
                                            color: const Color(0xFF1D1D1D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentDrawer = 2;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 12),
                                decoration: currentDrawer == 2
                                    ? BoxDecoration(
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFF0D75F),
                                              Color(0xFFB2802A),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter),
                                        borderRadius: BorderRadius.circular(15),
                                      )
                                    : BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                child: Text("Monthly",
                                    style: currentDrawer == 2
                                        ? GoogleFonts.poppins(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)
                                        : GoogleFonts.poppins(
                                            color: const Color(0xFF1D1D1D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentDrawer = 3;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 12),
                                decoration: currentDrawer == 3
                                    ? BoxDecoration(
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFF0D75F),
                                              Color(0xFFB2802A),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter),
                                        borderRadius: BorderRadius.circular(15),
                                      )
                                    : BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                child: Text("Yearly",
                                    style: currentDrawer == 3
                                        ? GoogleFonts.poppins(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)
                                        : GoogleFonts.poppins(
                                            color: const Color(0xFF1D1D1D),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SvgPicture.asset('assets/images/graph.svg'),
                    SizedBox(height: 35,),
                      Text(
                        "Account Details",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF2E2E2E),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF212121),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xFF121212),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.asset(
                                        'assets/images/profile.png',
                                        height: 50,
                                        width: 50,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Daniel Daniel",
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "Account number",
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFF0D75F),
                                    ),
                                    child: const Icon(Icons.arrow_downward_sharp),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total credit",
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "NGN 50,000",
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFB2802A),
                                    ),
                                    child: const Icon(Icons.arrow_upward_sharp),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Debit",
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "NGN 5,700",
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Get.toNamed(MyRouters.transactionsHistory);
                                    },
                                    child: Text(
                                      "View",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFFF0D75F),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ]))));
  }
}
