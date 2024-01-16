import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_textfield.dart';

class FundIssuingWallet extends StatefulWidget {
  const FundIssuingWallet({Key? key}) : super(key: key);

  @override
  State<FundIssuingWallet> createState() => _FundIssuingWalletState();
}

class _FundIssuingWalletState extends State<FundIssuingWallet> {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double doubleVar;
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
            "Fund Issuing Wallet ",
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
                child: Form(
                  key: profileController.formKeyFund1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Amount",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF2E2E2E),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonTextfield(
                          controller: profileController.amountController2,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(11),
                            FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                          ],
                          onChanged: (value) => doubleVar = double.parse(value),
                          validator: MultiValidator([
                            MinLengthValidator(3,
                                errorText: "enter amount at least 100 "),
                            RequiredValidator(
                                errorText: 'Please enter your amount '),
                          ]),
                          obSecure: false,
                          readOnly: false,
                          hintText: "please enter your amount",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: size.height * .26,
                        ),
                        InkWell(
                          onTap: () {
                            profileController.getCard();
                            // profileController.fundIssuing(context);
                          },
                          child: const CustomOutlineButton(
                            title: "Issues Fund ",
                          ),
                        ),
                      ]),
                ))));
  }
}
