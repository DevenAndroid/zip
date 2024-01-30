import 'dart:developer';

import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/model_movement_rates_response.dart';
import '../repository/get_currency_repo.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';

class CurrencyConvert extends StatefulWidget {
  const CurrencyConvert({Key? key}) : super(key: key);

  @override
  State<CurrencyConvert> createState() => _CurrencyConvertState();
}

class _CurrencyConvertState extends State<CurrencyConvert> {
  String? usdToNgn;
  String? gbpToNgn;
  String? eurToNgn;
  String? usdToInr;
  String? usdToGbp;
  String? usdToEur;

  @override
  void initState() {
    super.initState();
    getAllTransitionList();
// add in initState
    convertUsd();
    convertGbp();
    convertEur();
    convertEur();
    convertUsd1();
    convertUsd2();
    convertUsd3();
  }

// call function to convert
  void convertUsd() async {
    var usdConvert = await CurrencyConverter.convert(
      from: Currency.ngn,
      to: Currency.usd,
      amount: 1,
    );
    setState(() {
      usdToNgn = usdConvert.toString();
    });
  }

  void convertGbp() async {
    var usdConvert1 = await CurrencyConverter.convert(
      from: Currency.ngn,
      to: Currency.eur,
      amount: 1,
    );
    setState(() {
      gbpToNgn = usdConvert1.toString();
    });
  }

  void main() {
    String originalString = "1234/1235***";

    // Remove first 4 characters
    String step1 = originalString.substring(4);

    // Find the index of '/' and remove everything before it
    String step2 = step1.substring(step1.indexOf('/') + 1);

    // Remove the last 3 characters
    String finalResult = step2.substring(0, step2.length - 3);
  }

  Rx<RxStatus> statusOfAllTransistion = RxStatus.empty().obs;
  Rx<ModelMovementsRateResponse> allConvert = ModelMovementsRateResponse().obs;

  getAllTransitionList() {
    getCurrency().then((value) {
      log("response.body.....    ${value}");
      allConvert.value = value;

      statusOfAllTransistion.value = RxStatus.success();
    }
        // showToast(value.message.toString());
        );
  }

  void convertEur() async {
    var usdConvert2 = await CurrencyConverter.convert(
      from: Currency.ngn,
      to: Currency.gbp,
      amount: 1,
    );
    setState(() {
      eurToNgn = usdConvert2.toString();
    });
  }

  void convertUsd1() async {
    var usdConvert = await CurrencyConverter.convert(
      from: Currency.usd,
      to: Currency.inr,
      amount: 1,
    );
    setState(() {
      usdToInr = usdConvert.toString();
    });
  }

  void convertUsd2() async {
    var usdConvert = await CurrencyConverter.convert(
      from: Currency.usd,
      to: Currency.gbp,
      amount: 1,
    );
    setState(() {
      usdToGbp = usdConvert.toString();
    });
  }

  void convertUsd3() async {
    var usdConvert = await CurrencyConverter.convert(
      from: Currency.usd,
      to: Currency.eur,
      amount: 1,
    );
    setState(() {
      usdToEur = usdConvert.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF3F0F7),
        appBar: AppBar(
          toolbarHeight: 80,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.grey.shade300,
              height: 1.0,
            ),
          ),
          backgroundColor: const Color(0xFFF3F0F7),
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
          centerTitle: true,
          title: Text(
            "Exchange Rates",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return statusOfAllTransistion.value.isSuccess
                        ? ListView.builder(
                            itemCount: allConvert.value.movementInfo!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              String originalString = allConvert
                                  .value.movementInfo![index].currency_rate
                                  .toString();

                              // Remove first 4 characters
                              String step1 = originalString.substring(4);

                              // Find the index of '/' and remove everything before it
                              String step2 =
                                  step1.substring(step1.indexOf('/') + 0);

                              // Remove the last 3 characters
                              String finalResult =
                                  step2.substring(1, step2.length - 3);

                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(
                                              0.5,
                                              0.5,
                                            ), //Offset
                                            blurRadius: 0.5,
                                            spreadRadius: 0.0,
                                          ), //BoxShadow
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        if (allConvert
                                                .value
                                                .movementInfo![index]
                                                .currency_name ==
                                            "EUR")
                                          Image.asset(
                                            "assets/images/EUR.png",
                                            // color: Colors.black,
                                            width: 35,
                                            height: 35,
                                          ),
                                        if (allConvert
                                                .value
                                                .movementInfo![index]
                                                .currency_name ==
                                            "GBP")
                                          Image.asset(
                                            "assets/images/GBP.png",
                                            // color: Colors.black,
                                            width: 35,
                                            height: 35,
                                          ),
                                        if (allConvert
                                                .value
                                                .movementInfo![index]
                                                .currency_name ==
                                            "USD")
                                          Image.asset(
                                            "assets/images/USD.png",
                                            // color: Colors.black,
                                            width: 35,
                                            height: 35,
                                          ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              allConvert
                                                  .value
                                                  .movementInfo![index]
                                                  .currency_name
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF1D1D1D),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            if (allConvert
                                                    .value
                                                    .movementInfo![index]
                                                    .currency_name ==
                                                "EUR")
                                              Text(
                                                "Euro",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFF777777),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            if (allConvert
                                                    .value
                                                    .movementInfo![index]
                                                    .currency_name ==
                                                "GBP")
                                              Text(
                                                "British Pounds ",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFF777777),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            if (allConvert
                                                    .value
                                                    .movementInfo![index]
                                                    .currency_name ==
                                                "USD")
                                              Text(
                                                "US Dollar",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFF777777),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${finalResult.toString()}.00" +
                                                  " NGN ",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF1D1D1D),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "Naira ",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF777777),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                          "assets/images/ng.png",
                                          width: 45,
                                          height: 45,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              );
                            })
                        : statusOfAllTransistion.value.isError
                            ? CommonErrorWidget(
                                errorText: "",
                                onTap: () {},
                              )
                            : const Center(child: CircularProgressIndicator());
                  }),
                  // const SizedBox(height: 15,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text("1  NGN",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w400),),
                  //     ),
                  //     SvgPicture.asset("assets/images/arrow1.svg"),
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text(allConvert.value.movementInfo![1].currency_name.toString(),
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w400),),
                  //     ),
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text( "$gbpToNgn ${Currency.eur.name.toUpperCase()}",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w500),),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 15,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text("1  NGN",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w400),),
                  //     ),
                  //     SvgPicture.asset("assets/images/arrow1.svg"),
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text(allConvert.value.movementInfo![2].currency_name.toString(),
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w400),),
                  //     ),
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text( "$eurToNgn ${Currency.gbp.name.toUpperCase()}",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w500),),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 15,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text("1  USD",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w400),),
                  //     ),
                  //     SvgPicture.asset("assets/images/arrow1.svg"),
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text(" 1  INR",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w400),),
                  //     ),
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text( "  $usdToInr ${Currency.inr.name.toUpperCase()}  ",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w500),),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 15,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text("1  USD",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w400),),
                  //     ),
                  //     SvgPicture.asset("assets/images/arrow1.svg"),
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text(" 1  GBP ",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w400),),
                  //     ),
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text( " $usdToGbp ${Currency.gbp.name.toUpperCase()}  ",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w500),),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 15,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text("1  USD",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w400),),
                  //     ),
                  //     SvgPicture.asset("assets/images/arrow1.svg"),
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text(" 1  EUR ",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w400),),
                  //     ),
                  //     Container(
                  //       padding: const EdgeInsets.all(13),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppTheme.primaryColor,width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Text( " $usdToEur ${Currency.eur.name.toUpperCase()} ",
                  //         style: GoogleFonts.poppins(
                  //             color: const Color(0xFF1D1D1D),
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w500),),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
