import 'package:flutter/material.dart';
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
      body: Obx(() {
        print(double.tryParse(profileController.currentBalanceModel.value.data
            .toString()));
        return profileController.currentBalanceModel.value.status == true
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
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
                              Image.network("https://cdn-icons-png.flaticon.com/512/32/32974.png",color: Colors.black,width: 15,height: 15,),
                              Text(

                                NumberFormat.currency(
                                  symbol: '', // Set the currency symbol to empty since you're formatting as a plain number
                                  decimalDigits: 0, // Set the number of decimal digits to 0
                                ).format(profileController.currentBalanceModel.value.data),
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF1D1D1D),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Cash Out to our prefferedpayment method ",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        CommonTextfield(
                          controller: profileController.amountController,
                          obSecure: false,
                          hintText: "200",
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Please enter amount";
                            }
                            if (double.tryParse(value.trim()) == null) {
                              return "Enter valid amount";
                            }
                            if (double.parse(value.trim()) >
                                (double.tryParse(profileController.currentBalanceModel.value.data.toString()) ?? 0)) {
                              return "Please enter amount less than balance ";
                            }
                          },
                          labelText: "Amount",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "This transaction is free",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: size.height * .5,
                        ),
                        InkWell(
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
}
