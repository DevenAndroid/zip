import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/model_cabel_providers.dart';
import '../repository/fetch_provider_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  final profileController = Get.put(ProfileController());
  Rx<RxStatus> statusOfProviders = RxStatus.empty().obs;
  Rx<ModelCabelProvider> cabelProvider = ModelCabelProvider().obs;
  var initStateBlank = Get.arguments[0];
  final registorController = Get.put(registerController());
  getProviderList() {
    providerRepo(
      serviceID: initStateBlank,
      key: "variations",
      identifier: "tv-subscription",
    ).then((value) {
      log("response.body.....    ${value}");
      cabelProvider.value = value;
      if (value.status == true) {
        statusOfProviders.value = RxStatus.success();
      } else {
        statusOfProviders.value = RxStatus.error();
      }
    }
        // showToast(value.message.toString());
        );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProviderList();
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
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
          title: Text(
            "Provider",
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
                        return statusOfProviders.value.isSuccess
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: cabelProvider
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
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Plan",
                                                  style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF1D1D1D),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    cabelProvider
                                                        .value
                                                        .data!
                                                        .content!
                                                        .varations![index]
                                                        .name
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: const Color(
                                                            0xFF1D1D1D),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
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
                                                  cabelProvider
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
                                              height: 8,
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
                                            //           fontSize: 15,
                                            //           fontWeight:
                                            //               FontWeight.w500),
                                            //     ),
                                            //     Text(
                                            //       cabelProvider
                                            //           .value
                                            //           .data!
                                            //           .content!
                                            //           .varations![index]
                                            //           .fixedPrice
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
                                            // SizedBox(
                                            //   height: 8,
                                            // ),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment
                                            //           .spaceBetween,
                                            //   children: [
                                            //     Text(
                                            //       "Code",
                                            //       style: GoogleFonts.poppins(
                                            //           color: const Color(
                                            //               0xFF1D1D1D),
                                            //           fontSize: 15,
                                            //           fontWeight:
                                            //               FontWeight.w500),
                                            //     ),
                                            //     Text(
                                            //       cabelProvider
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
                                            // SizedBox(
                                            //   height: 15,
                                            // ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      //
                                                      // String firstNumberString =  cabelProvider.value.data!.content!.varations![index].variationAmount.toString();
                                                      // String secondNumberString =   profileController
                                                      //     .currentBalanceModel.value.data!.fee!.serviceFee
                                                      //     .toString();
                                                      //
                                                      // // Check if both inputs are not empty
                                                      // if (firstNumberString.isNotEmpty && secondNumberString.isNotEmpty) {
                                                      //   // Convert strings to integers
                                                      //   // int firstNumber = int.parse(firstNumberString);
                                                      //   // int secondNumber = int.parse(secondNumberString);
                                                      //   double firstNumber = double.parse(firstNumberString);
                                                      //   double secondNumber = double.parse(secondNumberString);
                                                      //   // Perform addition
                                                      //   double sum = firstNumber + secondNumber;
                                                      //   // int sum = firstNumber + secondNumber;
                                                      //   print(registorController.result2.toString());
                                                      //   // Convert the result back to a string and update the UI
                                                      //   setState(() {
                                                      //     registorController.result2 = sum.toString();
                                                      //     print(registorController.result2.toString());
                                                      //   });
                                                      // } else {
                                                      //   // Handle the case when one or both of the inputs are empty
                                                      //   setState(() {
                                                      //     registorController.result2 = 'Please enter valid numbers';
                                                      //   });
                                                      // }
                                                      print(cabelProvider
                                                          .value
                                                          .data!
                                                          .content!
                                                          .varations![index]
                                                          .variationAmount
                                                          .toString());
                                                      print(profileController
                                                          .currentBalanceModel
                                                          .value
                                                          .data);
// if(cabelProvider.value.data!.content!.varations![index].v < profileController
//     .currentBalanceModel
//     .value
//     .data){
                                                      Get.toNamed(
                                                          MyRouters
                                                              .purchaseCabelScreen,
                                                          arguments: [
                                                            cabelProvider
                                                                .value
                                                                .data!
                                                                .content!
                                                                .varations![
                                                                    index]
                                                                .variationAmount
                                                                .toString(),
                                                            cabelProvider
                                                                .value
                                                                .data!
                                                                .content!
                                                                .varations![
                                                                    index]
                                                                .variationCode
                                                                .toString(),
                                                            initStateBlank
                                                                .toString(),
                                                            Get.arguments[1]
                                                          ]);

// }
// else{
//   showToast("inefficient balance");
// }
                                                    },
                                                    child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8,
                                                                horizontal: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          color: const Color(
                                                              0xFFEDCA2F),
                                                        ),
                                                        child: Text(
                                                          "Buy Plan ",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                })
                            : statusOfProviders.value.isError
                                ? CommonErrorWidget(
                                    errorText:
                                        cabelProvider.value.message.toString(),
                                    onTap: () {
                                      getProviderList();
                                    },
                                  )
                                : const Center(
                                    child: CommonProgressIndicator());
                      })
                    ]))));
  }
}
