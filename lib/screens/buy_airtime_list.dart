import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/airtimeTransistionModel.dart';
import '../models/buy_data_List_model.dart';
import '../models/buy_electricity_list_model.dart';
import '../models/cabel_tv_list_model.dart';
import '../models/model_all_transistion.dart';
import '../repository/get_airtime_list_repo.dart';
import '../repository/get_all_transistion_repo.dart';
import '../repository/get_cabel_tv_repo.dart';
import '../repository/get_data_list_repo.dart';
import '../repository/get_electricity_list_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';

class BuyAirtimeList extends StatefulWidget {
  const BuyAirtimeList({Key? key}) : super(key: key);

  @override
  State<BuyAirtimeList> createState() => _BuyAirtimeListState();
}

class _BuyAirtimeListState extends State<BuyAirtimeList> {
  int currentDrawer = 0;
  Rx<RxStatus> statusOfAirtimeTransistion = RxStatus.empty().obs;
  Rx<BuyAirtimeListModel> airtimeTransistion = BuyAirtimeListModel().obs;
  Rx<RxStatus> statusOfBuyDataList = RxStatus.empty().obs;
  Rx<BuyCavelTvList> buyCableList = BuyCavelTvList().obs;
  Rx<RxStatus> statusOfelEctricityTransistion = RxStatus.empty().obs;
  Rx<BuyElectricityListModel> electricityTransistion =
      BuyElectricityListModel().obs;

  Rx<RxStatus> statusOfBuyDataList1 = RxStatus.empty().obs;
  Rx<BuyDataListModel> buyDataList = BuyDataListModel().obs;

  String? appBarName = "Airtime Transistion";

  getAllTransitionList() {
    buyAirtimeListRepo().then((value) {
      log("response.body.....    ${value}");
      airtimeTransistion.value = value;
      if (value.status == true) {
        statusOfAirtimeTransistion.value = RxStatus.success();
      } else {
        statusOfAirtimeTransistion.value = RxStatus.error();
      }
    }
        // showToast(value.message.toString());
        );
  }

  getSentTransitionList() {
    buyElectricityListRepo().then((value) {
      log("response.body.....    ${value}");
      electricityTransistion.value = value;
      if (value.status == true) {
        statusOfelEctricityTransistion.value = RxStatus.success();
      } else {
        statusOfelEctricityTransistion.value = RxStatus.error();
      }
    }
        // showToast(value.message.toString());
        );
  }

  getBuyDataList() {
    buyDataListRepo().then((value) {
      log("response.body.....    ${value}");
      buyDataList.value = value;
      if (value.status == true) {
        statusOfBuyDataList1.value = RxStatus.success();
      } else {
        statusOfBuyDataList1.value = RxStatus.error();
      }
    }
        // showToast(value.message.toString());
        );
  }

  getBuyCableList() {
    buyCabelTvListRepo().then((value) {
      log("response.body.....    ${value}");
      buyCableList.value = value;
      if (value.status == true) {
        statusOfBuyDataList.value = RxStatus.success();
      } else {
        statusOfBuyDataList.value = RxStatus.error();
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
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
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
                                          appBarName = "Airtime Transaction";
                                          getAllTransitionList();
                                        });
                                      },
                                      child: Container(
                                        width: 110,
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
                                          child: Text("Airtime",
                                              style: currentDrawer == 0
                                                  ? GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  : GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF1D1D1D),
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
                                          currentDrawer = 1;
                                          appBarName =
                                              "Electricity Transaction";
                                          getSentTransitionList();
                                        });
                                      },
                                      child: Container(
                                        width: 110,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
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
                                          child: Text("Electricity",
                                              style: currentDrawer == 1
                                                  ? GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  : GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF1D1D1D),
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
                                          currentDrawer = 2;
                                          appBarName = "Data Transaction";
                                          getBuyDataList();
                                        });
                                      },
                                      child: Container(
                                        width: 110,
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
                                        child: Center(
                                          child: Text("Data",
                                              style: currentDrawer == 2
                                                  ? GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  : GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF1D1D1D),
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
                                          currentDrawer = 3;
                                          appBarName = "CableTv Transaction";
                                          getBuyCableList();
                                          // Get.toNamed(MyRouters.buyCabelTvList);
                                        });
                                      },
                                      child: Container(
                                        width: 110,
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
                                          child: Text("Cabel Tv",
                                              style: currentDrawer == 3
                                                  ? GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  : GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF1D1D1D),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                        ),
                                      ),
                                    ),
                                  ])),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (currentDrawer == 0)
                          Obx(() {
                            return statusOfAirtimeTransistion.value.isSuccess
                                ? Column(
                                    children: [
                                      airtimeTransistion.value.data!.isEmpty
                                          ? Center(
                                              child: Text(
                                                "No records found.",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        AppTheme.primaryColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount: airtimeTransistion
                                                  .value.data!.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      airtimeTransistion.value
                                                              .data!.isEmpty
                                                          ? Center(
                                                              child: Text(
                                                                "No records found.",
                                                                style: GoogleFonts.poppins(
                                                                    color: AppTheme
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            )
                                                          : const SizedBox(
                                                              height: 10,
                                                            ),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.toNamed(
                                                              MyRouters
                                                                  .buyAirtimeScreen,
                                                              arguments: [
                                                                airtimeTransistion
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .userId
                                                                    .toString(),
                                                                airtimeTransistion
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .amount
                                                                    .toString(),
                                                                airtimeTransistion
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .telcos
                                                                    .toString(),
                                                                airtimeTransistion
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .phone
                                                                    .toString(),
                                                              ]);
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey)),
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
                                                                      airtimeTransistion
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
                                                                              FontWeight.w600),
                                                                    ),
                                                                    Text(
                                                                      airtimeTransistion
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
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      airtimeTransistion
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
                                                                              FontWeight.w300),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                            "assets/images/ngn.svg"),
                                                                        Text(
                                                                          airtimeTransistion
                                                                              .value
                                                                              .data![index]
                                                                              .amount
                                                                              .toString(),
                                                                          style: GoogleFonts.poppins(
                                                                              color: Colors.grey,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w400),
                                                                        ),
                                                                      ],
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
                                : statusOfAirtimeTransistion.value.isError
                                    ? CommonErrorWidget(
                                        errorText: airtimeTransistion
                                            .value.message
                                            .toString(),
                                        onTap: () {
                                          getAllTransitionList();
                                        },
                                      )
                                    : const CommonProgressIndicator();
                          }),
                        if (currentDrawer == 1)
                          Obx(() {
                            return statusOfelEctricityTransistion
                                    .value.isSuccess
                                ? Column(
                                    children: [
                                      electricityTransistion.value.data!.isEmpty
                                          ? Center(
                                              child: Text(
                                                "No records found.",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        AppTheme.primaryColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount: electricityTransistion
                                                  .value.data!.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.toNamed(
                                                              MyRouters
                                                                  .buyElectricity,
                                                              arguments: [
                                                                electricityTransistion
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .userId
                                                                    .toString(),
                                                                electricityTransistion
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .amount
                                                                    .toString(),
                                                                electricityTransistion
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .telcos
                                                                    .toString(),
                                                                electricityTransistion
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .description
                                                                    .toString(),
                                                                electricityTransistion
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .phone
                                                                    .toString(),
                                                              ]);
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey)),
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
                                                                    Row(
                                                                      children: [
                                                                        Image.asset(
                                                                            "assets/images/meter.png"),
                                                                        const SizedBox(
                                                                          width:
                                                                              6,
                                                                        ),
                                                                        Text(
                                                                          electricityTransistion
                                                                              .value
                                                                              .data![index]
                                                                              .description
                                                                              .toString(),
                                                                          style: GoogleFonts.poppins(
                                                                              color: AppTheme.primaryColor,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      electricityTransistion
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
                                                                              FontWeight.w500),
                                                                    ),
                                                                    Text(
                                                                      electricityTransistion
                                                                          .value
                                                                          .data![
                                                                              index]
                                                                          .phone
                                                                          .toString(),
                                                                      style: GoogleFonts.poppins(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      electricityTransistion
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
                                                                              FontWeight.w300),
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                            "assets/images/ngn.svg"),
                                                                        Text(
                                                                          electricityTransistion
                                                                              .value
                                                                              .data![index]
                                                                              .amount
                                                                              .toString(),
                                                                          style: GoogleFonts.poppins(
                                                                              color: Colors.grey,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w400),
                                                                        ),
                                                                      ],
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
                                : statusOfelEctricityTransistion.value.isError
                                    ? CommonErrorWidget(
                                        errorText: electricityTransistion
                                            .value.message
                                            .toString(),
                                        onTap: () {
                                          // getSentTransitionList();
                                        },
                                      )
                                    : const CommonProgressIndicator();
                          }),
                        if (currentDrawer == 2)
                          Obx(() {
                            return statusOfBuyDataList1.value.isSuccess
                                ? Column(
                                    children: [
                                      buyDataList.value.data!.isEmpty
                                          ? Center(
                                              child: Text(
                                                "No records found.",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        AppTheme.primaryColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount: buyDataList
                                                  .value.data!.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                    .data![
                                                                        index]
                                                                    .telcos
                                                                    .toString(),
                                                                buyDataList
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .amount
                                                                    .toString(),
                                                                buyDataList
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .dataplan
                                                                    .toString(),
                                                                buyDataList
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .dataCode
                                                                    .toString(),
                                                                buyDataList
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .phone
                                                                    .toString(),
                                                                buyDataList
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .userId
                                                                    .toString(),
                                                              ]);
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey)),
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
                                                                              FontWeight.w600),
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
                                                                              FontWeight.w500),
                                                                    ),
                                                                    Text(
                                                                      "Plan:- " +
                                                                          buyDataList
                                                                              .value
                                                                              .data![index]
                                                                              .dataplan
                                                                              .toString(),
                                                                      style: GoogleFonts.poppins(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight:
                                                                              FontWeight.w500),
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
                                                                              FontWeight.w300),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                            "assets/images/ngn.svg"),
                                                                        Text(
                                                                          buyDataList
                                                                              .value
                                                                              .data![index]
                                                                              .amount
                                                                              .toString(),
                                                                          style: GoogleFonts.poppins(
                                                                              color: Colors.grey,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w400),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      "Code:- " +
                                                                          buyDataList
                                                                              .value
                                                                              .data![index]
                                                                              .dataCode
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
                                : statusOfBuyDataList1.value.isError
                                    ? CommonErrorWidget(
                                        errorText: buyDataList.value.message
                                            .toString(),
                                        onTap: () {
                                          // getBuyDataList();
                                        },
                                      )
                                    : const CommonProgressIndicator();
                          }),
                        if (currentDrawer == 3)
                          Obx(() {
                            return statusOfBuyDataList.value.isSuccess
                                ? Column(
                                    children: [
                                      buyCableList.value.data!.isEmpty
                                          ? Center(
                                              child: Text(
                                                "No records found.",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        AppTheme.primaryColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount: buyCableList
                                                  .value.data!.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.toNamed(
                                                              MyRouters
                                                                  .cabelScreen,
                                                              arguments: [
                                                                buyCableList
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .telcos
                                                                    .toString(),
                                                                buyCableList
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .amount
                                                                    .toString(),
                                                                buyCableList
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .dataplan
                                                                    .toString(),
                                                                buyCableList
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .dataCode
                                                                    .toString(),
                                                                buyCableList
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .phone
                                                                    .toString(),
                                                                buyCableList
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .userId
                                                                    .toString(),
                                                              ]);
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey)),
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
                                                                      buyCableList
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
                                                                              FontWeight.w600),
                                                                    ),
                                                                    Text(
                                                                      buyCableList
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
                                                                              FontWeight.w500),
                                                                    ),
                                                                    Text(
                                                                      "Plan:- " +
                                                                          buyCableList
                                                                              .value
                                                                              .data![index]
                                                                              .dataplan
                                                                              .toString(),
                                                                      style: GoogleFonts.poppins(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight:
                                                                              FontWeight.w500),
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
                                                                      buyCableList
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
                                                                              FontWeight.w300),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                            "assets/images/ngn.svg"),
                                                                        Text(
                                                                          buyCableList
                                                                              .value
                                                                              .data![index]
                                                                              .amount
                                                                              .toString(),
                                                                          style: GoogleFonts.poppins(
                                                                              color: Colors.grey,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w400),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      "Code:- " +
                                                                          buyCableList
                                                                              .value
                                                                              .data![index]
                                                                              .dataCode
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
                                        errorText: buyCableList.value.message
                                            .toString(),
                                        onTap: () {
                                          // getBuyCableList();
                                        },
                                      )
                                    : const CommonProgressIndicator();
                          })
                      ]))),
        ));
  }
}
