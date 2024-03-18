import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/controller/profile_controller.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/update_user.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';

class VerifyPaymentLink extends StatefulWidget {
  const VerifyPaymentLink({Key? key}) : super(key: key);

  @override
  State<VerifyPaymentLink> createState() => _VerifyPaymentLinkState();
}

class _VerifyPaymentLinkState extends State<VerifyPaymentLink> {
  final register = Get.put(registerController());
  final profileContrller = Get.put(ProfileController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileContrller.getCurrentBalance();
  }

  @override
  Widget build(BuildContext context) {
    double doubleVar;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.grey.shade300,
              height: 1.0,
            ),
          ),
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 18.0, right: 10, left: 10),
          child: InkWell(
              onTap: () {
                register.cashCheckout(context);
                // register.saveList(context);
                // Get.toNamed(MyRouters.paymentLink);
                // emailLogin();
                //
              },
              child: const CustomOutlineButton(
                title: "Pay By Card",
              )),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please fund your account using a credit or debit card',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Text(
                              "Enter Amount ",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "FEE : " +
                                  profileContrller.currentBalanceModel.value
                                      .data!.fee!.cashinFee
                                      .toString(),
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF1D1D1D),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonTextfield(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            // LengthLimitingTextInputFormatter(11),
                            FilteringTextInputFormatter.allow(
                                RegExp('[0-9]+\\.?[0-9]*')),
                          ],
                          onChanged: (value) => doubleVar = double.parse(value),
                          // validator: MultiValidator([
                          //   RequiredValidator(
                          //       errorText:
                          //       'Please enter your amount '),
                          //   MinLengthValidator(1,
                          //       errorText:
                          //       'Please enter amount'),
                          //   MaxLengthValidator(11,
                          //       errorText:
                          //       'Please enter amount'),
                          //   PatternValidator(
                          //       r'(^(?:[+0]9)?[0-9]{10,12}$)',
                          //       errorText: '')
                          // ]),

                          validator: MultiValidator([
                            // RangeValidator(
                            //     min: 0,
                            //     max: profileContrller.currentBalanceModel.value
                            //         .data!.currentBalance!
                            //         .toInt(),
                            //     errorText:
                            //         "Can't add more than${profileContrller.currentBalanceModel.value.data!.currentBalance}"),
                            RequiredValidator(
                                errorText: 'Please enter amount '),
                          ]),
                          controller: register.amountController,
                          obSecure: false,
                          hintText: "enter amount "),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Click below and you will be taken to our payment processors website to complete your transaction and when you are done done please return to the app',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                      ),
                    ]))));
  }
}
