import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/buy_data_List_model.dart';
import '../models/model_recieve_transistion.dart';
import '../repository/get_data_list_repo.dart';
import '../repository/get_recived_transistion_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';

class BuyDataList extends StatefulWidget {
  const BuyDataList({Key? key}) : super(key: key);

  @override
  State<BuyDataList> createState() => _BuyDataListState();
}

class _BuyDataListState extends State<BuyDataList> {
  int currentDrawer = 0;
  Rx<RxStatus> statusOfBuyDataList = RxStatus.empty().obs;
  Rx<BuyDataListModel> buyDataList = BuyDataListModel().obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getBuyDataList();
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
            "Data Transactions",
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
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // currentDrawer = 0;
                                        Get.toNamed(MyRouters.buyAirtimeList);
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
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )
                                          : BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                      child: Center(
                                        child: Text("Airtime",
                                            style: currentDrawer == 2
                                                ? GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500)
                                                : GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFF1D1D1D),
                                                    fontSize: 13,
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
                                        // currentDrawer = 1;
                                        Get.toNamed(
                                            MyRouters.buyElectricityList);
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
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )
                                          : BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                      child: Center(
                                        child: Text("Electricity",
                                            style: currentDrawer == 1
                                                ? GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500)
                                                : GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFF1D1D1D),
                                                    fontSize: 13,
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
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )
                                          : BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                      child: Text("Data",
                                          style: currentDrawer == 0
                                              ? GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500)
                                              : GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF1D1D1D),
                                                  fontSize: 13,
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
                                        Get.toNamed(MyRouters.buyCabelTvList);
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
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )
                                          : BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                      child: Text("Cable Tv",
                                          style: currentDrawer == 3
                                              ? GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500)
                                              : GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF1D1D1D),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ])),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return statusOfBuyDataList.value.isSuccess
                            ? Column(
                                children: [
                                  buyDataList.value.data!.isEmpty
                                      ? Center(
                                          child: Text(
                                            "No records found.",
                                            style: GoogleFonts.poppins(
                                                color: AppTheme.primaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount:
                                              buyDataList.value.data!.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {},
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          MyRouters.buyData,
                                                          arguments: [
                                                            buyDataList
                                                                .value
                                                                .data![index]
                                                                .telcos
                                                                .toString(),
                                                            buyDataList
                                                                .value
                                                                .data![index]
                                                                .amount
                                                                .toString(),
                                                            buyDataList
                                                                .value
                                                                .data![index]
                                                                .dataplan
                                                                .toString(),
                                                            buyDataList
                                                                .value
                                                                .data![index]
                                                                .dataCode
                                                                .toString(),
                                                            buyDataList
                                                                .value
                                                                .data![index]
                                                                .phone
                                                                .toString(),
                                                            buyDataList
                                                                .value
                                                                .data![index]
                                                                .userId
                                                                .toString(),
                                                          ]);
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  buyDataList
                                                                      .value
                                                                      .data![
                                                                          index]
                                                                      .phone
                                                                      .toString(),
                                                                  style: GoogleFonts.poppins(
                                                                      color: AppTheme
                                                                          .primaryColor,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                Text(
                                                                  buyDataList
                                                                      .value
                                                                      .data![
                                                                          index]
                                                                      .telcos
                                                                      .toString(),
                                                                  style: GoogleFonts.poppins(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Text(
                                                                  "Plan:- " +
                                                                      buyDataList
                                                                          .value
                                                                          .data![
                                                                              index]
                                                                          .dataplan
                                                                          .toString(),
                                                                  style: GoogleFonts.poppins(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  buyDataList
                                                                      .value
                                                                      .data![
                                                                          index]
                                                                      .createdAt
                                                                      .toString(),
                                                                  style: GoogleFonts.poppins(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                            "assets/images/ngn.svg"),
                                                                    Text(
                                                                      buyDataList
                                                                          .value
                                                                          .data![
                                                                              index]
                                                                          .amount
                                                                          .toString(),
                                                                      style: GoogleFonts.poppins(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  "Code:- " +
                                                                      buyDataList
                                                                          .value
                                                                          .data![
                                                                              index]
                                                                          .dataCode
                                                                          .toString(),
                                                                  style: GoogleFonts.poppins(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                ],
                              )
                            : statusOfBuyDataList.value.isError
                                ? CommonErrorWidget(
                                    errorText:
                                        buyDataList.value.message.toString(),
                                    onTap: () {
                                      // getBuyDataList();
                                    },
                                  )
                                : const CommonProgressIndicator();
                      })
                    ]))));
  }
}
