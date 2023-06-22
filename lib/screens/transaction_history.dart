import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

class TransactionsHistory extends StatefulWidget {
  const TransactionsHistory({Key? key}) : super(key: key);

  @override
  State<TransactionsHistory> createState() => _TransactionsHistoryState();
}

class _TransactionsHistoryState extends State<TransactionsHistory> {
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
            "Transactions",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(MyRouters.fAQScreens);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.primaryColor, width: 2)),
                  child: Icon(Icons.question_mark_rounded,color: Colors.black,),
                ),
              ),
            )
          ],
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
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentDrawer = 0;
                                  });
                                },
                                child: Container(
                                  width: 100,
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
                                  child: Center(
                                    child: Text("All",
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
                                              end: Alignment.bottomCenter),
                                          borderRadius: BorderRadius.circular(15),
                                        )
                                      : BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                  child: Center(
                                    child: Text("Sent",
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
                                  child: Text("Received",
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
                            ])),
                      ),
                SizedBox(height: 20,),
    ListView.builder(shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 8,
    itemBuilder: (context, index) {
    return
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Get.toNamed(MyRouters.exchangeMoney);
        },
        child: Column(

                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("12 April, 2023"),
                         SizedBox(height: 10,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             const Icon(Icons.arrow_upward_sharp,color: Color(0xFFB2802A),size: 30,),
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
                                       color: AppTheme.primaryColor,
                                       fontSize: 16,
                                       fontWeight: FontWeight.w500),
                                 ),
                                 SizedBox(height: 3,),
                                 Text(
                                   "NGN 50,000",
                                   style: GoogleFonts.poppins(
                                       color:  Colors.grey,
                                       fontSize: 12,
                                       fontWeight: FontWeight.w300),
                                 ),
                               ],
                             ),
                           ],
                         ),
SizedBox(height: 10,)
                       ],
        ),
      ),
    );} )




                    ]))));
  }
}
