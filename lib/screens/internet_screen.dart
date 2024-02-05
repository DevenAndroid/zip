import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/service_variation_model.dart';
import '../repository/service_variation_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_colour.dart';

class InterNetPlanScreen extends StatefulWidget {
  const InterNetPlanScreen({Key? key}) : super(key: key);

  @override
  State<InterNetPlanScreen> createState() => _InterNetPlanScreenState();
}

class _InterNetPlanScreenState extends State<InterNetPlanScreen> {
  Rx<RxStatus> statusOfPlan = RxStatus.empty().obs;

  // var initStateBlank = Get.arguments[0];
  var serviceid = Get.arguments[0];

  Rx<ServiceVariationModel> dataPlan = ServiceVariationModel().obs;
  final registorController = Get.put(registerController());
  getTelcoList() {
    commonVariationRepo(key: "variations", serviceID: serviceid.toString())
        .then((value) {
      dataPlan.value = value;
      if (value.status == true) {
        statusOfPlan.value = RxStatus.success();
      } else {
        statusOfPlan.value = RxStatus.error();
      }
    }
            // showToast(value.message.toString());
            );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTelcoList();
  }

  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.grey.shade300,
              height: 1.0,
            ),
          ),
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
            "Data Plan",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          return statusOfPlan.value.isSuccess
              ? SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: dataPlan
                                    .value.data!.content!.varations!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppTheme.primaryColor)),
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
                                                      dataPlan
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
                                                              FontWeight.w500),
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
                                                    dataPlan
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
                                              // SizedBox(
                                              //   height: 10,
                                              // ),
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment
                                              //           .spaceBetween,
                                              //   children: [
                                              //     Text(
                                              //       "Validity",
                                              //       style: GoogleFonts.poppins(
                                              //           color: const Color(
                                              //               0xFF1D1D1D),
                                              //           fontSize: 16,
                                              //           fontWeight:
                                              //               FontWeight.w500),
                                              //     ),
                                              //     Text(
                                              //       dataPlan
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
                                              // SizedBox(
                                              //   height: 10,
                                              // ),
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment
                                              //           .spaceBetween,
                                              //   children: [
                                              //     Text(
                                              //       "Data Code",
                                              //       style: GoogleFonts.poppins(
                                              //           color: const Color(
                                              //               0xFF1D1D1D),
                                              //           fontSize: 15,
                                              //           fontWeight:
                                              //               FontWeight.w500),
                                              //     ),
                                              //     Text(
                                              //       dataPlan
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
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        // Get the input values as strings
                                                        String
                                                            firstNumberString =
                                                            dataPlan
                                                                .value
                                                                .data!
                                                                .content!
                                                                .varations![
                                                                    index]
                                                                .variationAmount
                                                                .toString();
                                                        String
                                                            secondNumberString =
                                                            profileController
                                                                .currentBalanceModel
                                                                .value
                                                                .data!
                                                                .fee!
                                                                .serviceFee
                                                                .toString();

                                                        // Check if both inputs are not empty
                                                        if (firstNumberString
                                                                .isNotEmpty &&
                                                            secondNumberString
                                                                .isNotEmpty) {
                                                          // Convert strings to integers
                                                          // int firstNumber = int.parse(firstNumberString);
                                                          // int secondNumber = int.parse(secondNumberString);
                                                          double firstNumber =
                                                              double.parse(
                                                                  firstNumberString);
                                                          double secondNumber =
                                                              double.parse(
                                                                  secondNumberString);
                                                          // Perform addition
                                                          double sum =
                                                              firstNumber +
                                                                  secondNumber;
                                                          // int sum = firstNumber + secondNumber;
                                                          // Convert the result back to a string and update the UI
                                                          setState(() {
                                                            registorController
                                                                    .result3 =
                                                                sum.toString();
                                                          });
                                                        } else {
                                                          // Handle the case when one or both of the inputs are empty
                                                          setState(() {
                                                            registorController
                                                                    .result2 =
                                                                'Please enter valid numbers';
                                                          });
                                                        }

                                                        Get.toNamed(
                                                            MyRouters
                                                                .purchaseDataScreen,
                                                            arguments: [
                                                              dataPlan
                                                                  .value
                                                                  .data!
                                                                  .content!
                                                                  .varations![
                                                                      index]
                                                                  .variationAmount
                                                                  .toString(),
                                                              dataPlan
                                                                  .value
                                                                  .data!
                                                                  .content!
                                                                  .varations![
                                                                      index]
                                                                  .variationCode
                                                                  .toString(),
                                                              serviceid
                                                                  .toString(),
                                                            ]);

                                                        // if(dataPlan.value.data!.content![index].minimiumAmount < profileController
                                                        //     .currentBalanceModel
                                                        //     .value
                                                        //     .data){
                                                        //   Get.toNamed(MyRouters.purchaseDataScreen,arguments: [initStateBlank,dataPlan.value.data!.content![index].minimiumAmount.toString(),dataPlan.value.data!.content![index].name.toString(),dataPlan.value.data!.content![index].productType.toString(),]);
                                                        //
                                                        // }
                                                        // else{
                                                        //   showToast("inefficient balance");
                                                        // }
                                                      },
                                                      child: Center(
                                                        child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical: 8,
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
                                                                  fontSize: 12,
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
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  );
                                })
                          ])))
              : const CommonProgressIndicator();
        }));
  }
}
