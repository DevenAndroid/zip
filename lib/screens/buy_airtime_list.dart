import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/airtimeTransistionModel.dart';
import '../models/model_all_transistion.dart';
import '../repository/get_airtime_list_repo.dart';
import '../repository/get_all_transistion_repo.dart';
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
            "Airtime Transistion",
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
                                          Get.toNamed(MyRouters
                                              .buyElectricityList);
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
                                          Get.toNamed(MyRouters
                                              .buyDataList);
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
                                        child: Text("Data",
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
                                        child: Text("Cabel Tv",
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
                                                fontWeight:
                                                FontWeight.w500)),
                                      ),
                                    ),
                                  ])),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Obx(() {
                          return statusOfAirtimeTransistion.value.isSuccess
                              ? Column(
                                children: [
                                  airtimeTransistion.value.data!.isEmpty?Center(
                                    child: Text("No records found.", style:
                                    GoogleFonts.poppins(
                                        color: AppTheme
                                            .primaryColor,
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight
                                            .w600),),
                                  ):
                                  ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: airtimeTransistion.value.data!.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {},
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          airtimeTransistion.value.data!.isEmpty?Center(
                                            child: Text("No records found.", style:
                                            GoogleFonts.poppins(
                                                color: AppTheme
                                                    .primaryColor,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight
                                                    .w600),),
                                          ):
                                          SizedBox(
                                            height: 10,
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Get.toNamed(MyRouters.buyAirtimeScreen,arguments: [  airtimeTransistion.value.data![index].userId.toString(),
                                                airtimeTransistion.value.data![index].amount.toString(),
                                                airtimeTransistion.value.data![index].telcos.toString(),
                                                airtimeTransistion.value.data![index].phone.toString(),

                                              ]

                                              );
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: Colors.grey)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [


                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(

                                                          airtimeTransistion
                                                                  .value
                                                                  .data![index]
                                                                  .phone
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
                                                          airtimeTransistion
                                                              .value
                                                              .data![index]
                                                              .telcos
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
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          airtimeTransistion
                                                              .value
                                                              .data![index]
                                                              .createdAt
                                                              .toString(),
                                                          style:
                                                          GoogleFonts.poppins(
                                                              color: Colors.grey,
                                                              fontSize: 13,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w300),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SvgPicture.asset("assets/images/ngn.svg"),
                                                            Text(
                                                              airtimeTransistion
                                                                  .value
                                                                  .data![index]
                                                                  .amount
                                                                  .toString(),
                                                              style:
                                                              GoogleFonts.poppins(
                                                                  color:
                                                                  Colors.grey,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
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
                                          SizedBox(
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
                            errorText: airtimeTransistion.value.message
                                .toString(),
                            onTap: () {
                              getAllTransitionList();
                            },
                          )
                              : const CommonProgressIndicator();
                        })
                      ]))),
        ));
  }
}
