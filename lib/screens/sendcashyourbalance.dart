import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/profile_controller.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class SendCashYourBalance extends StatefulWidget {
  const SendCashYourBalance({Key? key}) : super(key: key);

  @override
  State<SendCashYourBalance> createState() => _SendCashYourBalanceState();
}

class _SendCashYourBalanceState extends State<SendCashYourBalance> {
  final profileController = Get.put(ProfileController());
  final formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          "Your Balance",
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
        padding: const EdgeInsets.only(bottom: 28.0),
        child: InkWell(
          onTap: () {
            if (formKey2.currentState!.validate()) {
              Get.toNamed(MyRouters.selectMethod);
            }
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 10, right: 8),
            child: CustomOutlineButton(
              title: "Send",
            ),
          ),
        ),
      ),
      body: Obx(() {
        print(double.tryParse(
            profileController.currentBalanceModel.value.data.toString()));
        return profileController.currentBalanceModel.value.status == true
            ? SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                  child: Form(
                    key: formKey2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "https://cdn-icons-png.flaticon.com/512/32/32974.png",
                                color: Colors.black,
                                width: 15,
                                height: 15,
                              ),
                              Text(
                                NumberFormat('#,##0.00').format(
                                    profileController.currentBalanceModel.value
                                        .data!.currentBalance!),
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF1D1D1D),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Withdraw funds to your preferred bank account",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 6),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "FEE : " +
                                  profileController.currentBalanceModel.value
                                      .data!.fee!.cashoutFee
                                      .toString(),
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF1D1D1D),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        CommonTextfield(
                          controller: profileController.amountController,
                          obSecure: false,
                          onChanged: (value) {
                            _addNumbers();
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          hintText: "Amount",
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Please enter amount";
                            }
                            if (double.tryParse(value.trim()) == null) {
                              return "Enter valid amount";
                            }
                            if (double.parse(value.trim()) >
                                (double.tryParse(profileController
                                        .currentBalanceModel
                                        .value
                                        .data!
                                        .currentBalance
                                        .toString()) ??
                                    0)) {
                              return "Please enter amount less than balance ";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: size.height * .5,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }

  void _addNumbers() {
    // Get the input values as strings
    String firstNumberString = profileController.amountController.text;
    String secondNumberString = profileController
        .currentBalanceModel.value.data!.fee!.cashoutFee
        .toString();

    // Check if both inputs are not empty
    if (firstNumberString.isNotEmpty && secondNumberString.isNotEmpty) {
      // Convert strings to integers
      int firstNumber = int.parse(firstNumberString);
      int secondNumber = int.parse(secondNumberString);

      // Perform addition
      int sum = firstNumber + secondNumber;

      // Convert the result back to a string and update the UI
      setState(() {
        profileController.result5 = sum.toString();
        print(profileController.result5.toString());
      });
    } else {
      // Handle the case when one or both of the inputs are empty
      setState(() {
        profileController.result5 = 'Please enter valid numbers';
      });
    }
  }
}
