import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';

import '../controller/profile_controller.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_textfield.dart';

class AddFundScreen extends StatefulWidget {
  const AddFundScreen({Key? key}) : super(key: key);

  @override
  State<AddFundScreen> createState() => _AddFundScreenState();
}

class _AddFundScreenState extends State<AddFundScreen> {
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
            "Fund Card",
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
                  key: profileController.formKeyFund,
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
                          controller: profileController.amountController1,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(11),
                            FilteringTextInputFormatter.allow(
                                RegExp('[0-9]+\\.?[0-9]*')),
                          ],
                          onChanged: (value) => doubleVar = double.parse(value),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Please enter your amount '),
                          ]),
                          obSecure: false,
                          readOnly: false,
                          hintText: "please enter your amount",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Reference ",
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
                          controller: profileController.refrenceController,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Please enter reference'),
                          ]),
                          obSecure: false,
                          hintText: "refrence",
                        ),
                        SizedBox(
                          height: size.height * .3,
                        ),
                        InkWell(
                          onTap: () {
                            profileController.getCard();
                            profileController.addFund(context);
                          },
                          child: const CustomOutlineButton(
                            title: "Add Fund ",
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(MyRouters.fundIssuingWallet);
                          },
                          child: const CustomOutlineBoder(
                            title: "Issuing Fund",
                          ),
                        ),
                      ]),
                ))));
  }
}
