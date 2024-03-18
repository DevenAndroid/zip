import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/resourses/api_constant.dart';
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
  final String _selectedEur = 'EUR';
  final String _selectedCurrencyUsd = 'USD';
  final String _selectedCurrencyGbp = 'GBP';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
        ),
        title: Text(
          "Accounts",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
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
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    _selectedCurrency;
                    Get.toNamed(MyRouters.exchangeMoney,
                        arguments: [_selectedCurrency]);
                  },
                  child: Container(
                      height: 62,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: const Color(0xff1D1D1D))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -4),
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
                            trailing: Radio<String>(
                              value: 'NGN',
                              groupValue: _selectedCurrency,
                              activeColor: Colors.black,
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
                SizedBox(
                  height: size.height * .65,
                ),
                InkWell(
                  onTap: () {
                    _selectedCurrency;

                    showToast("Only NG Naira is available at the moment");
                    // Get.toNamed(MyRouters.exchangeMoney,
                    //     arguments: [_selectedCurrency]);
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
