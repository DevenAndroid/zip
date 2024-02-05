import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../routers/my_routers.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';

class VerifyPaymentLink2 extends StatefulWidget {
  const VerifyPaymentLink2({Key? key}) : super(key: key);

  @override
  State<VerifyPaymentLink2> createState() => _VerifyPaymentLink2State();
}

class _VerifyPaymentLink2State extends State<VerifyPaymentLink2> {
  final register = Get.put(registerController());
  final profileController = Get.put(ProfileController());
  final formKey4 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double doubleVar;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Payment Link ",
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
        body: Obx(() {
          return profileController.modal.value.status == true
              ? SingleChildScrollView(
                  child: Form(
                  key: formKey4,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "You can send a payment link to anyone and they can pay you by debit or credit card.",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Enter Amount ",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommonTextfield(
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(11),
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]+\\.?[0-9]*')),
                                ],
                                onChanged: (value) =>
                                    doubleVar = double.parse(value),
                                validator: MultiValidator([
                                  RangeValidator(
                                      min: 0,
                                      max: profileController.currentBalanceModel
                                          .value.data!.currentBalance!
                                          .toInt(),
                                      errorText:
                                          "Can't add more than${profileController.currentBalanceModel.value.data!.currentBalance}"),
                                  RequiredValidator(
                                      errorText: 'Please enter amount '),
                                ]),
                                controller: register.amountController,
                                obSecure: false,
                                hintText: "enter amount "),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Description",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommonTextfield(
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText:
                                          'Please enter your Description '),
                                ]),
                                controller: register.descriptionController1,
                                obSecure: false,
                                hintText: "enter Description "),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "You can send a payment link to anyone and they can pay you by debit or credit card.",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .3,
                            ),
                            InkWell(
                                onTap: () {
                                  // register.cashCheckout1(context);
                                  if (formKey4.currentState!.validate()) {
                                    Get.toNamed(MyRouters.addAPayer);
                                  }
                                  // emailLogin();
                                  //
                                },
                                child: const CustomOutlineButton(
                                  title: "Request a Payment ",
                                )),
                          ])),
                ))
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }));
  }
}
