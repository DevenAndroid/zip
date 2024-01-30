import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/payout_controller.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';

class CreateBenificeryScreen extends StatefulWidget {
  const CreateBenificeryScreen({Key? key}) : super(key: key);

  @override
  State<CreateBenificeryScreen> createState() => _CreateBenificeryScreenState();
}

class _CreateBenificeryScreenState extends State<CreateBenificeryScreen> {
  final payoutController = Get.put(PayoutController());

  List<DropdownMenuItem<String>> get dropdownItemsm {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(value: "individual", child: Text("individual")),
      const DropdownMenuItem(value: "corporate ", child: Text("corporate ")),
    ];
    return menuItemsm;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Create Benificery",
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
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "First Name",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CommonTextfield(
                        controller: payoutController.firstNameController,
                        obSecure: false,
                        hintText: "First Name "),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Last Name",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CommonTextfield(
                        controller: payoutController.lastNameController,
                        obSecure: false,
                        hintText: "Last Name "),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Email",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CommonTextfield(
                        controller: payoutController.emailController1,
                        obSecure: false,
                        hintText: "Email "),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Account Holder Name",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CommonTextfield(
                        controller:
                            payoutController.accountHolderNameController,
                        obSecure: false,
                        hintText: "Account Holder Name "),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Type",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Please select your bank type '),
                          ]),
                          style: const TextStyle(color: AppTheme.primaryColor),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: AppTheme.primaryColor, width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: AppTheme.primaryColor, width: 1.5),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: AppTheme.primaryColor, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: AppTheme.primaryColor, width: 1.5),
                            ),
                          ),
                          hint: const Text(""),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          value: payoutController.selectedValue,
                          items: dropdownItemsm,
                          onChanged: (Object? value) {
                            setState(() {
                              payoutController.selectedValue = value.toString();
                              print(payoutController.selectedValue =
                                  value.toString());
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Currency",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CommonTextfield(
                        controller: payoutController.currencyController,
                        obSecure: false,
                        hintText: "Currency "),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Payment Destination",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CommonTextfield(
                        controller:
                            payoutController.paymentDestinationController,
                        readOnly: true,
                        obSecure: false,
                        hintText: "Bank Account "),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Destination Address",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CommonTextfield(
                        controller:
                            payoutController.destinationAddressController,
                        obSecure: false,
                        hintText: "Destination Address "),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                        onTap: () {
                          payoutController.CreateBenificery();
                          // emailLogin();
                          //
                        },
                        child: const CustomOutlineButton(
                          title: "Create ",
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                  ]),
            )));
  }
}
