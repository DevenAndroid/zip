import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/electricity_variation_model.dart';
import '../repository/electricity_variation_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';

class ElectricityVariationScreen extends StatefulWidget {
  const ElectricityVariationScreen({Key? key}) : super(key: key);

  @override
  State<ElectricityVariationScreen> createState() =>
      _ElectricityVariationScreenState();
}

class _ElectricityVariationScreenState
    extends State<ElectricityVariationScreen> {
  Rx<RxStatus> statusOfBiller = RxStatus.empty().obs;
  Rx<ElectricityVariationModel> biller = ElectricityVariationModel().obs;
  final controller = Get.put(registerController());
  var service = Get.arguments[0];
  final profileController = Get.put(ProfileController());
  getBillerList() {
    commonElectricityVariationRepo(
      identifier: "electricity-bill",
      key: "variations",
      serviceID: service,
    ).then((value) {
      log("response.body.....    ${value}");
      biller.value = value;
      if (value.status == true) {
        controller.idController1.text = service.toString();
        statusOfBiller.value = RxStatus.success();
      } else {
        statusOfBiller.value = RxStatus.error();
      }
    }
        // showToast(value.message.toString());
        );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBillerList();
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
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
          title: Text(
            "Energy",
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
                      Obx(() {
                        return statusOfBiller.value.isSuccess
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: biller
                                    .value.data!.content!.varations!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      AppTheme.primaryColor)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Plan:",
                                                      style: GoogleFonts.poppins(
                                                          color: const Color(
                                                              0xFF1D1D1D),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        biller
                                                            .value
                                                            .data!
                                                            .content!
                                                            .varations![index]
                                                            .name
                                                            .toString(),
                                                        style: GoogleFonts.poppins(
                                                            color: const Color(
                                                                0xFF1D1D1D),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Price",
                                                      style: GoogleFonts.poppins(
                                                          color: const Color(
                                                              0xFF1D1D1D),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      biller
                                                          .value
                                                          .data!
                                                          .content!
                                                          .varations![index]
                                                          .variationAmount
                                                          .toString(),
                                                      style: GoogleFonts.poppins(
                                                          color: const Color(
                                                              0xFF1D1D1D),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment
                                                //           .spaceBetween,
                                                //   children: [
                                                //     Text(
                                                //       "FixedPrice",
                                                //       style: GoogleFonts.poppins(
                                                //           color: const Color(
                                                //               0xFF1D1D1D),
                                                //           fontSize: 16,
                                                //           fontWeight:
                                                //               FontWeight.w500),
                                                //     ),
                                                //     Text(
                                                //       biller
                                                //           .value
                                                //           .data!
                                                //           .content!
                                                //           .varations![index]
                                                //           .fixedPrice
                                                //           .toString(),
                                                //       style: GoogleFonts.poppins(
                                                //           color: const Color(
                                                //               0xFF1D1D1D),
                                                //           fontSize: 15,
                                                //           fontWeight:
                                                //               FontWeight.w500),
                                                //     ),
                                                //   ],
                                                // ),
                                                // const SizedBox(
                                                //   height: 10,
                                                // ),
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment
                                                //           .spaceBetween,
                                                //   children: [
                                                //     Text(
                                                //       "Variation Code",
                                                //       style: GoogleFonts.poppins(
                                                //           color: const Color(
                                                //               0xFF1D1D1D),
                                                //           fontSize: 15,
                                                //           fontWeight:
                                                //               FontWeight.w500),
                                                //     ),
                                                //     Text(
                                                //       biller
                                                //           .value
                                                //           .data!
                                                //           .content!
                                                //           .varations![index]
                                                //           .variationCode
                                                //           .toString(),
                                                //       style: GoogleFonts.poppins(
                                                //           color: const Color(
                                                //               0xFF1D1D1D),
                                                //           fontSize: 16,
                                                //           fontWeight:
                                                //               FontWeight.w500),
                                                //     ),
                                                //   ],
                                                // ),
                                                // const SizedBox(
                                                //   height: 15,
                                                // ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          controller.provider1
                                                                  .text =
                                                              biller
                                                                  .value
                                                                  .data!
                                                                  .content!
                                                                  .varations![
                                                                      index]
                                                                  .name
                                                                  .toString();
                                                          controller
                                                              .idController1
                                                              .text = service;
                                                          controller
                                                                  .amount.text =
                                                              biller
                                                                  .value
                                                                  .data!
                                                                  .content!
                                                                  .varations![
                                                                      index]
                                                                  .variationAmount
                                                                  .toString();
                                                          Get.toNamed(
                                                            MyRouters
                                                                .meterVerifyScreen,
                                                          );
                                                        },
                                                        child: Center(
                                                          child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                                color: const Color(
                                                                    0xFFEDCA2F),
                                                              ),
                                                              child: Text(
                                                                "Buy Plan ",
                                                                style: GoogleFonts.poppins(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              )),
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //
                                        //     Expanded(
                                        //       child: InkWell(
                                        //         onTap: () {
                                        //          controller.provider.text = biller.value.data!.content!.varations![index].name.toString();
                                        //           // controller.idController1.text = chooseBank.value.data![index].code.toString();
                                        //           Get.toNamed(MyRouters.meterVerifyScreen,
                                        //              );
                                        //         },
                                        //         child: Text(biller.value.data!.content!.varations![index].name.toString(),
                                        //           style: GoogleFonts.poppins(
                                        //               color: const Color(0xFF1D1D1D),
                                        //               fontSize: 16,
                                        //               fontWeight: FontWeight.w500),),
                                        //       ),
                                        //     ),
                                        //
                                        //     // InkWell(
                                        //     //     onTap: (){
                                        //     //       // Get.toNamed(MyRouters.dataPlanScreen,arguments: [biller.value.data![index].name.toString(),]);
                                        //     //     },
                                        //     //     child: Container(
                                        //     //         padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                                        //     //         decoration: BoxDecoration(
                                        //     //           borderRadius: BorderRadius.circular(7),
                                        //     //           color: AppTheme.secondaryColor,
                                        //     //         ),
                                        //     //
                                        //     //         child: Text("See Plan",
                                        //     //           style: GoogleFonts.poppins(
                                        //     //               color:  Colors.white,
                                        //     //               fontSize: 12,
                                        //     //               fontWeight: FontWeight.w500),))),
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  );
                                })
                            : statusOfBiller.value.isError
                                ? CommonErrorWidget(
                                    errorText: biller.value.message.toString(),
                                    onTap: () {
                                      getBillerList();
                                    },
                                  )
                                : const CommonProgressIndicator();
                      })
                    ]))));
  }
}
