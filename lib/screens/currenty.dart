import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/common_colour.dart';
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
    Currency myCurrency = await CurrencyConverter.getMyCurrency();
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
    Currency myCurrency = await CurrencyConverter.getMyCurrency();
    var usdConvert1 = await CurrencyConverter.convert(
      from: Currency.ngn,
      to:  Currency.eur,
      amount: 1,
    );
    setState(() {
      gbpToNgn = usdConvert1.toString();
    });
  }
  void convertEur() async {
    Currency myCurrency = await CurrencyConverter.getMyCurrency();
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
    Currency myCurrency = await CurrencyConverter.getMyCurrency();
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
    Currency myCurrency = await CurrencyConverter.getMyCurrency();
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
    return  Scaffold(
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
    centerTitle: true,
    title: Text("Check Rates",
    style: GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 20,
    fontWeight: FontWeight.w500),),
    ),
    body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(13),
    decoration: BoxDecoration(
    border: Border.all(color: AppTheme.primaryColor,width: 1),
    borderRadius: BorderRadius.circular(15),
    ),
    child: Text("1  NGN",
    style: GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 17,
    fontWeight: FontWeight.w400),),
    ),
    SvgPicture.asset("assets/images/arrow1.svg"),

    Container(
      padding: const EdgeInsets.all(13),
    decoration: BoxDecoration(
    border: Border.all(color: AppTheme.primaryColor,width: 1),
    borderRadius: BorderRadius.circular(15),
    ),
    child: Text(" USD ",
    style: GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 17,
    fontWeight: FontWeight.w400),),
    ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.primaryColor,width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text("$usdToNgn ${Currency.usd.name.toUpperCase()}",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.primaryColor,width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text("1  NGN",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),),
                  ),
                  SvgPicture.asset("assets/images/arrow1.svg"),
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.primaryColor,width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(" EUR ",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),),
                  ),
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.primaryColor,width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text( "$gbpToNgn ${Currency.eur.name.toUpperCase()}",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.primaryColor,width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text("1  NGN",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),),
                  ),
                  SvgPicture.asset("assets/images/arrow1.svg"),
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.primaryColor,width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(" GBP ",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),),
                  ),
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.primaryColor,width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text( "$eurToNgn ${Currency.gbp.name.toUpperCase()}",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
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
              const SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    ));
  }
}
