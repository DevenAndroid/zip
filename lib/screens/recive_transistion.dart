import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/model_all_transistion.dart';
import '../models/model_recieve_transistion.dart';
import '../repository/get_recived_transistion_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';

class ReciveTransactionsHistory extends StatefulWidget {
  const ReciveTransactionsHistory({Key? key}) : super(key: key);

  @override
  State<ReciveTransactionsHistory> createState() => _ReciveTransactionsHistoryState();
}

class _ReciveTransactionsHistoryState extends State<ReciveTransactionsHistory> {
  int currentDrawer = 0;
  Rx<RxStatus> statusOfRecieveTransistion = RxStatus.empty().obs;
  Rx<ModelAllTransistion> reciveTransistion = ModelAllTransistion().obs;

  getRecieveTransitionList() {
    recieveTransistionListGetRepo().then((value) {
      log("response.body.....    ${value}");
      reciveTransistion.value = value;
      if (value.status == true) {
        statusOfRecieveTransistion.value = RxStatus.success();
      } else {
        statusOfRecieveTransistion.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecieveTransitionList();
  }
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
              Get.toNamed(MyRouters.bottomNavbar);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
          title: Text(
            "Receive Transactions",
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
                                        // currentDrawer = 0;
                                        Get.toNamed(MyRouters.bottomNavbar);
                                      });
                                    },
                                    child: Container(
                                      width: 100,
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
                                      child: Center(
                                        child: Text("All",
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
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // currentDrawer = 1;
                                        Get.toNamed(MyRouters.sentTransactionsHistory);
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
                                      child: Text("Received",
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
                                ])),
                      ),
                      SizedBox(height: 20,),
                      Obx(() {
                        return statusOfRecieveTransistion.value.isSuccess
                            ? ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: reciveTransistion.value.data!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {

                                },
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.grey)
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(color: AppTheme.secondaryColor,shape: BoxShape.circle),


                                            child: Icon(
                                              reciveTransistion
                                                  .value
                                                  .data![index]
                                                  .transactionType ==
                                                  "Credit"
                                                  ? Icons
                                                  .arrow_downward_sharp
                                                  : Icons
                                                  .arrow_upward_sharp,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                          ),

                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "NGN " +
                                                    reciveTransistion
                                                        .value
                                                        .data![index]
                                                        .amount
                                                        .toString(),
                                                style:
                                                GoogleFonts.poppins(
                                                    color: AppTheme
                                                        .primaryColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight
                                                        .w600),
                                              ),
                                              Text(
                                                reciveTransistion
                                                    .value
                                                    .data![index]
                                                    .transactionAbout
                                                    .toString(),
                                                style:
                                                GoogleFonts.poppins(
                                                    color:
                                                    Colors.grey,
                                                    fontSize: 13,
                                                    fontWeight:
                                                    FontWeight
                                                        .w500),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                reciveTransistion
                                                    .value
                                                    .data![index]
                                                    .transactionType
                                                    .toString(),
                                                style:
                                                GoogleFonts.poppins(
                                                    color: AppTheme
                                                        .primaryColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight
                                                        .w600),
                                              ),
                                              Text(
                                                reciveTransistion
                                                    .value
                                                    .data![index]
                                                    .createdAt
                                                    .toString(),
                                                style:
                                                GoogleFonts.poppins(
                                                    color:
                                                    Colors.grey,
                                                    fontSize: 13,
                                                    fontWeight:
                                                    FontWeight
                                                        .w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              );
                            })
                            : statusOfRecieveTransistion.value.isError
                            ? CommonErrorWidget(
                          errorText: reciveTransistion.value.message
                              .toString(),
                          onTap: () {
                            getRecieveTransitionList();
                          },
                        )
                            : const CommonProgressIndicator();
                      })




                    ]))));
  }
}
