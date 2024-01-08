import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../models/model_data_paln.dart';
import '../models/model_fetch_telcos.dart';
import '../models/save_transastion_model.dart';
import '../models/service_common_model.dart';
import '../models/service_variation_model.dart';
import '../repository/data_plan_repo.dart';
import '../repository/fetch_telcos_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../repository/service_common_repo.dart';
import '../repository/service_variation_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';

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

  // final profileController = Get.put(ProfileController());
  // getTelcoList() {
  //   commonServiceRepo(
  //       key: "services"
  //   ).then((value) {
  //     log("response.body.....    ${value}");
  //     telcos.value = value;
  //
  //     statusOftelcos.value = RxStatus.success();
  //   }
  //     // showToast(value.message.toString());
  //   );
  // }
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
                            // Obx(() {
                            //   return  statusOfPlan.value.isSuccess ?
                            //   ListView.builder(
                            //       physics: const NeverScrollableScrollPhysics(),
                            //       itemCount:dataPlan.value.data!.content!.length,
                            //       shrinkWrap: true,
                            //       itemBuilder: (context, index) {
                            //         return Column(
                            //           children: [
                            //
                            //             Container(
                            //               padding: EdgeInsets.all(8),
                            //               decoration: BoxDecoration(
                            //                   borderRadius: BorderRadius.circular(10),
                            //                   border: Border.all(color: AppTheme.primaryColor)
                            //               ),
                            //               child: Padding(
                            //                 padding: const EdgeInsets.all(12.0),
                            //                 child: Column(
                            //                   children: [
                            //                     Row(
                            //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                       children: [
                            //                         Text("Plan",
                            //                           style: GoogleFonts.poppins(
                            //                               color: const Color(0xFF1D1D1D),
                            //                               fontSize: 16,
                            //                               fontWeight: FontWeight.w500),),
                            //                         Text(dataPlan.value.data!.content![index].name.toString(),
                            //                           style: GoogleFonts.poppins(
                            //                               color: const Color(0xFF1D1D1D),
                            //                               fontSize: 15,
                            //                               fontWeight: FontWeight.w500),),
                            //
                            //
                            //                       ],
                            //                     ),
                            //                     SizedBox(height: 10,),
                            //                     Row(
                            //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                       children: [
                            //                         Text("Price",
                            //                           style: GoogleFonts.poppins(
                            //                               color: const Color(0xFF1D1D1D),
                            //                               fontSize: 15,
                            //                               fontWeight: FontWeight.w500),),
                            //                         Text(dataPlan.value.data!.content![index].maximumAmount.toString(),
                            //                           style: GoogleFonts.poppins(
                            //                               color: const Color(0xFF1D1D1D),
                            //                               fontSize: 16,
                            //                               fontWeight: FontWeight.w500),),
                            //
                            //
                            //                       ],
                            //                     ),
                            //                     SizedBox(height: 10,),
                            //                     Row(
                            //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                       children: [
                            //                         Text("Validity",
                            //                           style: GoogleFonts.poppins(
                            //                               color: const Color(0xFF1D1D1D),
                            //                               fontSize: 16,
                            //                               fontWeight: FontWeight.w500),),
                            //                         Text(dataPlan.value.data!.content![index].convinienceFee.toString(),
                            //                           style: GoogleFonts.poppins(
                            //                               color: const Color(0xFF1D1D1D),
                            //                               fontSize: 15,
                            //                               fontWeight: FontWeight.w500),),
                            //
                            //
                            //                       ],
                            //                     ),
                            //                     SizedBox(height: 10,),
                            //                     Row(
                            //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                       children: [
                            //                         Text("Data Code",
                            //                           style: GoogleFonts.poppins(
                            //                               color: const Color(0xFF1D1D1D),
                            //                               fontSize: 15,
                            //                               fontWeight: FontWeight.w500),),
                            //                         Text(dataPlan.value.data!.content![index].productType.toString(),
                            //                           style: GoogleFonts.poppins(
                            //                               color: const Color(0xFF1D1D1D),
                            //                               fontSize: 16,
                            //                               fontWeight: FontWeight.w500),),
                            //
                            //
                            //                       ],
                            //                     ),
                            //                     SizedBox(height: 15,),
                            //                     Row(
                            //                       mainAxisAlignment: MainAxisAlignment.end,
                            //                       children: [
                            //                         InkWell(
                            //                             onTap: (){
                            //                               Get.toNamed(MyRouters.purchaseDataScreen,arguments: [dataPlan.value.data!.content![index].minimiumAmount.toString(),dataPlan.value.data!.content![index].name.toString(),dataPlan.value.data!.content![index].productType.toString(),]);
                            //
                            //                               // if(dataPlan.value.data!.content![index].minimiumAmount < profileController
                            //                               //     .currentBalanceModel
                            //                               //     .value
                            //                               //     .data){
                            //                               //   Get.toNamed(MyRouters.purchaseDataScreen,arguments: [initStateBlank,dataPlan.value.data!.content![index].minimiumAmount.toString(),dataPlan.value.data!.content![index].name.toString(),dataPlan.value.data!.content![index].productType.toString(),]);
                            //                               //
                            //                               // }
                            //                               // else{
                            //                               //   showToast("inefficient balance");
                            //                               // }
                            //
                            //
                            //                              },
                            //                             child: Container(
                            //                                 padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                            //                                 decoration: BoxDecoration(
                            //                                   borderRadius: BorderRadius.circular(7),
                            //                                   color: AppTheme.secondaryColor,
                            //                                 ),
                            //
                            //                                 child: Text("Buy Plan ",
                            //                                   style: GoogleFonts.poppins(
                            //                                       color:  Colors.white,
                            //                                       fontSize: 12,
                            //                                       fontWeight: FontWeight.w500),))),
                            //                       ],
                            //                     ),
                            //
                            //
                            //                   ],
                            //                 ),
                            //               ),
                            //             ),
                            //             SizedBox(height: 15,),
                            //           ],
                            //           );
                            //       }):  statusOfPlan.value.isError
                            //       ? CommonErrorWidget(
                            //     errorText:
                            //     dataPlan.value.message.toString(),
                            //     onTap: () {
                            //       // print("data"+dataPlan.value.data!.content!.first.productType.toString());
                            //       getTelcoList();
                            //     },
                            //   )
                            //       : const CommonProgressIndicator();
                            // })
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: dataPlan
                                    .value.data!.content!.varations!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
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
                                                  SizedBox(
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
                                              SizedBox(
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
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Validity",
                                                    style: GoogleFonts.poppins(
                                                        color: const Color(
                                                            0xFF1D1D1D),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    dataPlan
                                                        .value
                                                        .data!
                                                        .content!
                                                        .varations![index]
                                                        .fixedPrice
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: const Color(
                                                            0xFF1D1D1D),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Data Code",
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
                                                        .variationCode
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
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
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
                                                      child: Container(
                                                          padding: EdgeInsets
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
                                                            color: AppTheme
                                                                .secondaryColor,
                                                          ),
                                                          child: Text(
                                                            "Buy Plan ",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ))),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  );
                                })
                          ])))
              : CommonProgressIndicator();
        }));
  }
}
