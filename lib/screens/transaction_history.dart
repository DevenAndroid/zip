import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/repository/get_recived_transistion_repo.dart';
import 'package:zip/repository/get_send_transistion_repo.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/model_all_transistion.dart';
import '../models/model_recieve_transistion.dart';
import '../models/model_send_tranbsistion.dart';
import '../repository/get_all_transistion_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';

class TransactionsHistory extends StatefulWidget {
  const TransactionsHistory({Key? key}) : super(key: key);

  @override
  State<TransactionsHistory> createState() => _TransactionsHistoryState();
}

class _TransactionsHistoryState extends State<TransactionsHistory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String _appBarTitle;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateAppBarTitle() {
    setState(() {
      // Update the AppBar title based on the active tab
      switch (_tabController.index) {
        case 0:
          _appBarTitle = "All Transaction";
          break;
        case 1:
          _appBarTitle = 'Sent Transaction';
          break;
        case 2:
          _appBarTitle = 'Received Transaction';
          break;
      }
    });
  }

  int currentDrawer = 0;
  String? appBarName = "All Transactions";
  Rx<RxStatus> statusOfAllTransistion = RxStatus.empty().obs;
  Rx<RxStatus> statusOfSendTransistion = RxStatus.empty().obs;
  Rx<RxStatus> statusOfReciveTransistion = RxStatus.empty().obs;
  Rx<ModelAllTransistion> allTransistion = ModelAllTransistion().obs;
  Rx<ModelSendTransistion> sendTransistion = ModelSendTransistion().obs;
  Rx<ModelRecieveTransistion> reciveTransistion = ModelRecieveTransistion().obs;

  getAllTransitionList() {
    transistionListGetRepo().then((value) {
      log("response.body.....    $value");
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
      log("response.body.....    $value");
      sendTransistion.value = value;
      if (value.status == true) {
        statusOfSendTransistion.value = RxStatus.success();
      } else {
        statusOfSendTransistion.value = RxStatus.error();
      }
    }
        // showToast(value.message.toString());
        );
  }

  getAllTransitionList2() {
    recieveTransistionListGetRepo().then((value) {
      log("response.body.....    $value");
      reciveTransistion.value = value;
      if (value.status == true) {
        statusOfReciveTransistion.value = RxStatus.success();
      } else {
        statusOfReciveTransistion.value = RxStatus.error();
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
    getAllTransitionList1();
    getAllTransitionList2();
    _tabController = TabController(length: 3, vsync: this);
    _appBarTitle = 'All Transaction'; // Set the initial title
    _tabController.addListener(_updateAppBarTitle);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.toNamed(MyRouters.bottomNavbar);
            },
            child: const SizedBox()),
        title: Text(
          _appBarTitle.toString(),
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Column(
            children: [
              Container(
                color: Colors.grey.shade300,
                height: 1.0,
              ),
              const SizedBox(
                height: 10,
              ),
              TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                indicatorColor: const Color(0xFFEDCA2F),
                indicatorPadding: const EdgeInsets.only(left: 15, right: 10),
                labelColor: Colors.black,
                labelStyle: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
                unselectedLabelColor: Colors.grey,
                dividerColor: Colors.grey.withOpacity(.1),
                unselectedLabelStyle: GoogleFonts.poppins(
                    color: const Color(0xFF777777),
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
                tabs: const [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Sent",
                  ),
                  Tab(
                    text: "Received",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: TabBarView(controller: _tabController, children: [
          Obx(() {
            return statusOfAllTransistion.value.isSuccess
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: allTransistion.value.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      allTransistion.value.data![index]
                                                  .transactionType ==
                                              "Credit"
                                          ? Icons.arrow_downward_sharp
                                          : Icons.arrow_upward_sharp,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          allTransistion.value.data![index]
                                              .transactionAbout
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          allTransistion
                                              .value.data![index].createdAt
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.grey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        allTransistion.value.data?[index]
                                                    .currency ==
                                                "USD"
                                            ? Text(
                                                '\$${allTransistion.value.data?[index].amount}',
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        AppTheme.primaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    decoration: TextDecoration
                                                        .underline),
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Image.network(
                                                    "https://cdn-icons-png.flaticon.com/512/32/32974.png",
                                                    color: Colors.black,
                                                    width: 14,
                                                    height: 14,
                                                  ),
                                                  Text(
                                                    allTransistion.value
                                                        .data![index].amount
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: AppTheme
                                                            .primaryColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .underline),
                                                  )
                                                ],
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(.2),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      );
                    })
                : statusOfAllTransistion.value.isError
                    ? CommonErrorWidget(
                        errorText: allTransistion.value.message.toString(),
                        onTap: () {
                          getAllTransitionList();
                        },
                      )
                    : const CommonProgressIndicator();
          }),
          Obx(() {
            return statusOfSendTransistion.value.isSuccess
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: sendTransistion.value.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      sendTransistion.value.data![index]
                                                  .transactionType ==
                                              "Credit"
                                          ? Icons.arrow_downward_sharp
                                          : Icons.arrow_upward_sharp,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  FittedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          sendTransistion.value.data![index]
                                              .transactionAbout
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          sendTransistion
                                              .value.data![index].createdAt
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.grey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        allTransistion.value.data?[index]
                                                    .currency ==
                                                "USD"
                                            ? Text(
                                                '\$${sendTransistion.value.data?[index].amount}',
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        AppTheme.primaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    decoration: TextDecoration
                                                        .underline),
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Image.network(
                                                    "https://cdn-icons-png.flaticon.com/512/32/32974.png",
                                                    color: Colors.black,
                                                    width: 14,
                                                    height: 14,
                                                  ),
                                                  Text(
                                                    sendTransistion.value
                                                        .data![index].amount
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: AppTheme
                                                            .primaryColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .underline),
                                                  )
                                                ],
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(.2),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      );
                    })
                : statusOfSendTransistion.value.isError
                    ? CommonErrorWidget(
                        errorText: allTransistion.value.message.toString(),
                        onTap: () {
                          // getSentTransitionList();
                        },
                      )
                    : const CommonProgressIndicator();
          }),
          Obx(() {
            return statusOfReciveTransistion.value.isSuccess
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: reciveTransistion.value.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      reciveTransistion.value.data![index]
                                                  .transactionType ==
                                              "Credit"
                                          ? Icons.arrow_downward_sharp
                                          : Icons.arrow_upward_sharp,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          reciveTransistion.value.data![index]
                                              .transactionAbout
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          reciveTransistion
                                              .value.data![index].createdAt
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.grey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        allTransistion.value.data?[index]
                                                    .currency ==
                                                "USD"
                                            ? Text(
                                                '\$${allTransistion.value.data?[index].amount}',
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        AppTheme.primaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    decoration: TextDecoration
                                                        .underline),
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Image.network(
                                                    "https://cdn-icons-png.flaticon.com/512/32/32974.png",
                                                    color: Colors.black,
                                                    width: 14,
                                                    height: 14,
                                                  ),
                                                  Text(
                                                    reciveTransistion.value
                                                        .data![index].amount
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: AppTheme
                                                            .primaryColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .underline),
                                                  )
                                                ],
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(.2),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      );
                    })
                : statusOfReciveTransistion.value.isError
                    ? CommonErrorWidget(
                        errorText: allTransistion.value.message.toString(),
                        onTap: () {
                          // getRecieveTransitionList();
                        },
                      )
                    : const CommonProgressIndicator();
          })
        ]),
      ),
    );
  }
}
