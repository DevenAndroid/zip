import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/repository/get_recived_transistion_repo.dart';
import 'package:zip/repository/get_send_transistion_repo.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/model_all_transistion.dart';
import '../repository/get_all_transistion_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';

class TransactionsHistory extends StatefulWidget {
  const TransactionsHistory({Key? key}) : super(key: key);

  @override
  State<TransactionsHistory> createState() => _TransactionsHistoryState();
}

class _TransactionsHistoryState extends State<TransactionsHistory> {
  int currentDrawer = 0;
  String? appBarName = "All Transactions";
  Rx<RxStatus> statusOfAllTransistion = RxStatus.empty().obs;
  Rx<ModelAllTransistion> allTransistion = ModelAllTransistion().obs;

  getAllTransitionList() {
    transistionListGetRepo().then((value) {
      log("response.body.....    ${value}");
      allTransistion.value = value;
      if (value.status == true) {
        statusOfAllTransistion.value = RxStatus.success();
      } else {
        statusOfAllTransistion.value = RxStatus.error();
      }
    }
        // showToast(value.message.toString());
        );
  }

  getAllTransitionList1() {
    sendTransistionListGetRepo().then((value) {
      log("response.body.....    ${value}");
      allTransistion.value = value;
      if (value.status == true) {
        statusOfAllTransistion.value = RxStatus.success();
      } else {
        statusOfAllTransistion.value = RxStatus.error();
      }
    }
        // showToast(value.message.toString());
        );
  }

  getAllTransitionList2() {
    recieveTransistionListGetRepo().then((value) {
      log("response.body.....    ${value}");
      allTransistion.value = value;
      if (value.status == true) {
        statusOfAllTransistion.value = RxStatus.success();
      } else {
        statusOfAllTransistion.value = RxStatus.error();
      }
    }
        // showToast(value.message.toString());
        );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTransitionList();
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
              child: const SizedBox()),
          title: Text(
            appBarName.toString(),
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),

          centerTitle: true,
        ),
        body: Theme(
          data: ThemeData(useMaterial3: true),
          child: SingleChildScrollView(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentDrawer = 0;
                                          appBarName = "All Transaction";
                                          getAllTransitionList();
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
                                                    end:
                                                        Alignment.bottomCenter),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              )
                                            : BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                        child: Center(
                                          child: Text("All",
                                              style: currentDrawer == 0
                                                  ? GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFFFFFFFF),
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
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentDrawer = 1;
                                          appBarName = "Sent Transaction";
                                          getAllTransitionList1();
                                          // Get.toNamed(MyRouters
                                          //     .sentTransactionsHistory);
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
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                        child: Center(
                                          child: Text("Sent",
                                              style: currentDrawer == 1
                                                  ? GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFFFFFFFF),
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
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentDrawer = 2;
                                          appBarName = "Receive Transaction";
                                          getAllTransitionList2();
                                          // Get.toNamed(MyRouters
                                          //     .reciveTransactionsHistory);
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
                                                    end:
                                                        Alignment.bottomCenter),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              )
                                            : BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                        child: Text("Received",
                                            style: currentDrawer == 2
                                                ? GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500)
                                                : GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFF1D1D1D),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ),
                                  ])),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (currentDrawer == 0)
                          Obx(() {
                            return statusOfAllTransistion.value.isSuccess
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:
                                        allTransistion.value.data!.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {},
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
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .secondaryColor,
                                                        shape: BoxShape.circle),
                                                    child: Icon(
                                                      allTransistion
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      allTransistion.value.data?[index]?.currency == "USD" ?
                                                      Text(
                                                        '\$${allTransistion.value.data?[index]?.amount}',
                                                        style: GoogleFonts.poppins(
                                                          color: AppTheme.primaryColor,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ):
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Image.network(
                                                            "https://cdn-icons-png.flaticon.com/512/32/32974.png",
                                                            color: Colors.black,
                                                            width: 14,
                                                            height: 14,
                                                          ),
                                                          Text(
                                                            allTransistion.value.data![index]!.amount.toString(),
                                                            style: GoogleFonts.poppins(
                                                              color: AppTheme.primaryColor,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          )],
                                                      ),

    Text(
                                                        allTransistion
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        allTransistion
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
                                                        allTransistion
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
                                : statusOfAllTransistion.value.isError
                                    ? CommonErrorWidget(
                                        errorText: allTransistion.value.message
                                            .toString(),
                                        onTap: () {
                                          getAllTransitionList();
                                        },
                                      )
                                    : const CommonProgressIndicator();
                          }),
                        if (currentDrawer == 1)
                          Obx(() {
                            return statusOfAllTransistion.value.isSuccess
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:
                                        allTransistion.value.data!.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {},
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
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .secondaryColor,
                                                        shape: BoxShape.circle),
                                                    child: Icon(
                                                      allTransistion
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      allTransistion.value.data?[index]?.currency == "USD" ?
                                                      Text(
                                                        '\$${allTransistion.value.data?[index]?.amount}',
                                                        style: GoogleFonts.poppins(
                                                          color: AppTheme.primaryColor,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ):
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Image.network(
                                                            "https://cdn-icons-png.flaticon.com/512/32/32974.png",
                                                            color: Colors.black,
                                                            width: 14,
                                                            height: 14,
                                                          ),
                                                          Text(
                                                            allTransistion.value.data![index]!.amount.toString(),
                                                            style: GoogleFonts.poppins(
                                                              color: AppTheme.primaryColor,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          )],
                                                      ),
                                                      Text(
                                                        allTransistion
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        allTransistion
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
                                                        allTransistion
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
                                : statusOfAllTransistion.value.isError
                                    ? CommonErrorWidget(
                                        errorText: allTransistion.value.message
                                            .toString(),
                                        onTap: () {
                                          // getSentTransitionList();
                                        },
                                      )
                                    : const CommonProgressIndicator();
                          }),
                        if (currentDrawer == 2)
                          Obx(() {
                            return statusOfAllTransistion.value.isSuccess
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:
                                        allTransistion.value.data!.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {},
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
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .secondaryColor,
                                                        shape: BoxShape.circle),
                                                    child: Icon(
                                                      allTransistion
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      allTransistion.value.data?[index]?.currency == "USD" ?
                                                      Text(
                                                         '\$${allTransistion.value.data?[index]?.amount}',
                                                        style: GoogleFonts.poppins(
                                                          color: AppTheme.primaryColor,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ):
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Image.network(
                                                            "https://cdn-icons-png.flaticon.com/512/32/32974.png",
                                                            color: Colors.black,
                                                            width: 14,
                                                            height: 14,
                                                          ),
                                                          Text(
                                                            allTransistion.value.data![index]!.amount.toString(),
                                                            style: GoogleFonts.poppins(
                                                              color: AppTheme.primaryColor,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          )],
                                                      )

                                                      ,
                                                      Text(
                                                        allTransistion
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        allTransistion
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
                                                        allTransistion
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
                                : statusOfAllTransistion.value.isError
                                    ? CommonErrorWidget(
                                        errorText: allTransistion.value.message
                                            .toString(),
                                        onTap: () {
                                          // getRecieveTransitionList();
                                        },
                                      )
                                    : const CommonProgressIndicator();
                          })
                      ]))),
        ));
  }
}
