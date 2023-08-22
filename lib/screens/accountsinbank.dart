import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';


import '../widgets/common_button.dart';

class AccountsInBank extends StatefulWidget {
  const AccountsInBank({Key? key}) : super(key: key);

  @override
  State<AccountsInBank> createState() => _AccountsInBankState();
}

class _AccountsInBankState extends State<AccountsInBank> {

  String _selectedCurrency = 'NGN';
  String _selectedEur = 'EUR';
  String _selectedCurrencyUsd = 'USD';
  String _selectedCurrencyGbp = 'GBP';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Accounts",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: (){ Get.back();},
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    _selectedCurrency ;
                    Get.toNamed(MyRouters.exchangeMoney,arguments: [_selectedCurrency]);
                  },
                  child: Container(
                      height: 62,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: const Color(0xff1D1D1D))),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          ListTile(
                              visualDensity:
                                  const VisualDensity(horizontal: 0, vertical: -4),
                              leading: Image.asset(
                                'assets/images/nigeria.png',
                                height: 35,
                              ),
                              title: Text(
                                "NG Naira",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF1D1D1D),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              // subtitle: Text(
                              //   "N1098.00",
                              //   style: GoogleFonts.poppins(
                              //       color: const Color(0x571D1D1D),
                              //       fontSize: 14,
                              //       fontWeight: FontWeight.w400),
                              // ),
                              trailing :Radio<String>(
                    value: 'NGN',
                    groupValue: _selectedCurrency,
                                activeColor: AppTheme.secondaryColor,
                    onChanged: (value) {
                      setState(() {
                        _selectedCurrency = value!;
                      });
                    },
                  ),
                  ),
                        ],
                      )),
                ),
                // const SizedBox(height: 14,),
                // GestureDetector(
                //   onTap: (){
                //     _selectedEur;
                //     Get.toNamed(MyRouters.exchangeMoney,arguments: [_selectedEur]);
                //   },
                //   child: Container(
                //       height: 62,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(15),
                //           border: Border.all(color: const Color(0xff1D1D1D))),
                //       child: Column(
                //         children: [
                //           SizedBox(height: 10,),
                //           ListTile(
                //               visualDensity:
                //               const VisualDensity(horizontal: 0, vertical: -4),
                //               leading: Image.asset(
                //                 'assets/images/euro.png',
                //                 height: 35,
                //               ),
                //               title: Text(
                //                 "Euro",
                //                 style: GoogleFonts.poppins(
                //                     color: const Color(0xFF1D1D1D),
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.w500),
                //               ),
                //               // subtitle: Text(
                //               //   "E0.00",
                //               //   style: GoogleFonts.poppins(
                //               //       color: const Color(0x571D1D1D),
                //               //       fontSize: 14,
                //               //       fontWeight: FontWeight.w400),
                //               // ),
                //               trailing:Radio<String>(
                //                 value: 'EUR',
                //                 activeColor: AppTheme.secondaryColor,
                //                 groupValue: _selectedCurrency,
                //
                //                 onChanged: (value) {
                //                   setState(() {
                //                     _selectedEur = value!;
                //                   });
                //                 },
                //               ),),
                //         ],
                //       )),
                // ),
                // const SizedBox(height: 14,),
                // InkWell(
                //   onTap: (){
                //     _selectedCurrency;
                //     log(_selectedCurrencyGbp);
                //     Get.toNamed(MyRouters.exchangeMoney,arguments: [_selectedCurrencyGbp]);
                //   },
                //   child: Container(
                //       height: 62,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(15),
                //           border: Border.all(color: const Color(0xff1D1D1D))),
                //       child: Column(
                //         children: [
                //           SizedBox(height: 10,),
                //           ListTile(
                //
                //               visualDensity:
                //               const VisualDensity(horizontal: 0, vertical: -4),
                //               leading: Image.asset(
                //                 'assets/images/pound.png',
                //                 height: 35,
                //               ),
                //               title: Text(
                //                 "British pounds",
                //                 style: GoogleFonts.poppins(
                //                     color: const Color(0xFF1D1D1D),
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.w500),
                //               ),
                //               // subtitle: Text(
                //               //   "E0.00",
                //               //   style: GoogleFonts.poppins(
                //               //       color: const Color(0x571D1D1D),
                //               //       fontSize: 14,
                //               //       fontWeight: FontWeight.w400),
                //               // ),
                //               trailing: Radio<String>(
                //                 value: 'GBP',
                //                 activeColor: AppTheme.secondaryColor,
                //                 groupValue: _selectedCurrency,
                //                 onChanged: (value) {
                //                   setState(() {
                //                     _selectedCurrencyGbp = value!;
                //                   });
                //                 },
                //               ),),
                //         ],
                //       )),
                // ),
                // const SizedBox(height: 14,),
                // InkWell(
                //   onTap: (){
                //     _selectedCurrencyUsd;
                //     Get.toNamed(MyRouters.exchangeMoney,arguments: [_selectedCurrencyUsd]);
                //   },
                //   child: Container(
                //       height: 62,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(15),
                //           border: Border.all(color: const Color(0xff1D1D1D))),
                //       child: Column(
                //
                //         children: [
                //           SizedBox(height: 10,),
                //           ListTile(
                //               visualDensity:
                //               const VisualDensity(horizontal: 0, vertical: -4),
                //               leading: Image.asset(
                //                 'assets/images/doller.png',
                //                 height: 35,
                //               ),
                //               title: Text(
                //                 "US Dollers",
                //                 style: GoogleFonts.poppins(
                //                     color: const Color(0xFF1D1D1D),
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.w500),
                //               ),
                //               // subtitle: Text(
                //               //   "\$6.00",
                //               //   style: GoogleFonts.poppins(
                //               //       color: const Color(0x571D1D1D),
                //               //       fontSize: 14,
                //               //       fontWeight: FontWeight.w400),
                //               // ),
                //               trailing:Radio<String>(
                //                 activeColor: AppTheme.secondaryColor,
                //                 value: 'USD',
                //                 groupValue: _selectedCurrency,
                //                 onChanged: (value) {
                //                   setState(() {
                //                     _selectedCurrencyUsd = value!;
                //                   });
                //                 },
                //               ),),
                //         ],
                //       )),
                // ),
                SizedBox(
                  height: size.height * .65,
                ),
                InkWell(
                  onTap: () {
                    // Get.toNamed(MyRouters.addFundsInBank);
                  },
                  child: const CustomOutlineButton(
                    title: "Create new account",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
