import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/loan_controller.dart';
import '../controller/update_user.dart';
import '../routers/my_routers.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final loanController = Get.put(LoanController());
  final registorController = Get.put(registerController());

  List<DropdownMenuItem<String>> get dropdownItemsm1 {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(
          value: "Government Employed",
          child: Text(
            "Government Employed",
          )),
      const DropdownMenuItem(
          value: "Private Employed", child: Text("Private Employed")),
      const DropdownMenuItem(value: "Unemployed", child: Text("Unemployed")),
      const DropdownMenuItem(
          value: "Self Employed", child: Text("Self Employed")),
      const DropdownMenuItem(
          value: "Small Business owner", child: Text("Small Business owner")),
    ];
    return menuItemsm;
  }

  List<DropdownMenuItem<String>> get dropdownItemsm {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(
          value: "Home owner",
          child: Text(
            "Home owner",
          )),
      const DropdownMenuItem(value: "Rental", child: Text("Rental")),
    ];
    return menuItemsm;
  }

  List<DropdownMenuItem<String>> get dropdownItemsm2 {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(
          value: "0 Naira to 1 Naira", child: Text("0 Naira to 1 Naira")),
      const DropdownMenuItem(
          value: "1 Naira to 2 Naira", child: Text("1 Naira to 2 Naira")),
      const DropdownMenuItem(
          value: "2 Naira to 3 Naira", child: Text("2 Naira to 3 Naira")),
      const DropdownMenuItem(
          value: "3 Naira to 4 Naira", child: Text("3 Naira to 4 Naira")),
      const DropdownMenuItem(
          value: "4 Naira to 5 Naira", child: Text("4 Naira to 5 Naira")),
    ];
    return menuItemsm;
  }

  List<DropdownMenuItem<String>> get dropdownItemsm3 {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(
          value: "1 month to 6 month", child: Text("1 month to 6 month")),
      const DropdownMenuItem(
          value: "6 month to 1 year", child: Text("6 month to 1 year")),
      const DropdownMenuItem(
          value: "1 year to 2 year", child: Text("1 year to 2 year")),
      const DropdownMenuItem(
          value: "2 year to 3 year", child: Text("2 year to 3 year")),
      const DropdownMenuItem(
          value: "3 year to 4 year", child: Text("3 year to 4 year")),
    ];
    return menuItemsm;
  }

  List<DropdownMenuItem<String>> get dropdownItemsm4 {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(
          value: "0 Naira to 1 Naira", child: Text("0 Naira to 1 Naira")),
      const DropdownMenuItem(
          value: "1 Naira to 2 Naira", child: Text("1 Naira to 2 Naira")),
      const DropdownMenuItem(
          value: "2 Naira to 3 Naira", child: Text("2 Naira to 3 Naira")),
      const DropdownMenuItem(
          value: "3 Naira to 4 Naira", child: Text("3 Naira to 4 Naira")),
      const DropdownMenuItem(
          value: "4 Naira to 5 Naira", child: Text("4 Naira to 5 Naira")),
    ];
    return menuItemsm;
  }

  List<DropdownMenuItem<String>> get dropdownItemsm5 {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(value: "Yes", child: Text("Yes")),
      const DropdownMenuItem(value: "No", child: Text("No")),
    ];
    return menuItemsm;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF3F0F7),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Questions",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          // centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF1D1D1D),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please answer some questions",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "We need some more info first to see what we can offer. answering these questions won’t affect your score.",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF343434),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Residential status',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 63,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(
                                  0.1,
                                  0.1,
                                ), //Offset
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ]),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            padding: const EdgeInsets.all(10),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please select your channel'),
                            ]),
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF585757),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                            ),
                            hint: const Text("Home Owner"),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                            isExpanded: true,
                            value: loanController.selectedValuem,
                            items: dropdownItemsm,
                            onChanged: (String? value) {
                              setState(() {
                                loanController.selectedValuem = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Employed status',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 63,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(
                                  0.1,
                                  0.1,
                                ), //Offset
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ]),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            padding: const EdgeInsets.all(10),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please select your channel'),
                            ]),
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF585757),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                            ),
                            hint: const Text(""),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            value: loanController.dropdownvalue,
                            items: dropdownItemsm1,
                            onChanged: (String? value) {
                              setState(() {
                                loanController.dropdownvalue = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Monthly income',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CommonTextfield(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          // LengthLimitingTextInputFormatter(8),
                          FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                        ],
                        onChanged: (value) {},
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Please enter amount";
                          }
                          if (double.tryParse(value.trim()) == null) {
                            return "Enter valid amount";
                          }
                          return null;
                        },
                        controller: loanController.monthelyController,
                        obSecure: false,
                        hintText: "Enter Monthly income",
                      ),
                      // DropdownButtonHideUnderline(
                      //   child: DropdownButtonFormField(
                      //     validator: MultiValidator([
                      //       RequiredValidator(
                      //           errorText: 'Please select your channel'),
                      //     ]),
                      //     style: GoogleFonts.poppins(
                      //         color: const Color(0xFF585757),
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 16),
                      //     decoration: InputDecoration(
                      //       contentPadding: const EdgeInsets.all(10),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(
                      //           10,
                      //         ),
                      //         borderSide: const BorderSide(
                      //             color: Color(0xFFB7B7B7), width: 1.5),
                      //       ),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(
                      //           10,
                      //         ),
                      //         borderSide: const BorderSide(
                      //             color: Color(0xFFB7B7B7), width: 1.5),
                      //       ),
                      //       disabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(
                      //           10,
                      //         ),
                      //         borderSide: const BorderSide(
                      //             color: Color(0xFFB7B7B7), width: 1.5),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(
                      //           10,
                      //         ),
                      //         borderSide: const BorderSide(
                      //             color: Color(0xFFB7B7B7), width: 1.5),
                      //       ),
                      //     ),
                      //     hint: const Text(""),
                      //     icon: const Icon(Icons.keyboard_arrow_down),
                      //     isExpanded: true,
                      //     value: loanController.selectedValuem1,
                      //     items: dropdownItemsm2,
                      //     onChanged: (String? value) {
                      //       setState(() {
                      //         loanController.selectedValuem1 = value!;
                      //       });
                      //     },
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Duration of loan (in months)',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 63,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(
                                  0.1,
                                  0.1,
                                ), //Offset
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ]),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            padding: const EdgeInsets.all(10),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please select your channel'),
                            ]),
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF585757),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                            ),
                            hint: const Text(""),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            value: loanController.selectedValuem2,
                            items: dropdownItemsm3,
                            onChanged: (String? value) {
                              setState(() {
                                loanController.selectedValuem2 = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Desired Amount ',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CommonTextfield(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          // LengthLimitingTextInputFormatter(8),
                          FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                        ],
                        onChanged: (value) {},
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Please enter amount";
                          }
                          if (double.tryParse(value.trim()) == null) {
                            return "Enter valid amount";
                          }
                          return null;
                        },
                        controller: loanController.desiredController,
                        obSecure: false,
                        hintText: "Enter  Desired amount",
                      ),
                      // DropdownButtonHideUnderline(
                      //   child: DropdownButtonFormField(
                      //     validator: MultiValidator([
                      //       RequiredValidator(
                      //           errorText: 'Please select your channel'),
                      //     ]),
                      //     style: GoogleFonts.poppins(
                      //         color: const Color(0xFF585757),
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 16),
                      //     decoration: InputDecoration(
                      //       contentPadding: const EdgeInsets.all(10),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(
                      //           10,
                      //         ),
                      //         borderSide: const BorderSide(
                      //             color: Color(0xFFB7B7B7), width: 1.5),
                      //       ),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(
                      //           10,
                      //         ),
                      //         borderSide: const BorderSide(
                      //             color: Color(0xFFB7B7B7), width: 1.5),
                      //       ),
                      //       disabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(
                      //           10,
                      //         ),
                      //         borderSide: const BorderSide(
                      //             color: Color(0xFFB7B7B7), width: 1.5),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(
                      //           10,
                      //         ),
                      //         borderSide: const BorderSide(
                      //             color: Color(0xFFB7B7B7), width: 1.5),
                      //       ),
                      //     ),
                      //     hint: const Text(""),
                      //     icon: const Icon(Icons.keyboard_arrow_down),
                      //     isExpanded: true,
                      //     value: loanController.selectedValuem3,
                      //     items: dropdownItemsm4,
                      //     onChanged: (String? value) {
                      //       setState(() {
                      //         loanController.selectedValuem3 = value!;
                      //       });
                      //     },
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Is your income likely to change in the next 6 - 12 months',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 63,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(
                                  0.1,
                                  0.1,
                                ), //Offset
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ]),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            padding: const EdgeInsets.all(10),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please select your channel'),
                            ]),
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF585757),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            // padding:  const EdgeInsets.symmetric( vertical: 20),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                            ),
                            hint: const Text(""),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            value: loanController.selectedValuem4,
                            items: dropdownItemsm5,
                            onChanged: (String? value) {
                              setState(() {
                                loanController.selectedValuem4 = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     padding: const EdgeInsets.all(12),
                      //
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       border: Border.all(color: Colors.grey),
                      //
                      //     ),
                      //     child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children:[
                      //           Text(
                      //             "Please answer some questions",
                      //             style: GoogleFonts.poppins(
                      //                 color:  const Color(0xFF5A5656),
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           Text(
                      //             "SELECT",
                      //             style: GoogleFonts.poppins(
                      //                 color:  const Color(0xFFB2802A),
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //         ]
                      //     )),
                      // const SizedBox(height: 20,),
                      // Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     padding: const EdgeInsets.all(12),
                      //
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       border: Border.all(color: Colors.grey),
                      //
                      //     ),
                      //     child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children:[
                      //           Text(
                      //             "Residential status",
                      //             style: GoogleFonts.poppins(
                      //                 color:  const Color(0xFF5A5656),
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           Text(
                      //             "SELECT",
                      //             style: GoogleFonts.poppins(
                      //                 color:  const Color(0xFFB2802A),
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           const Divider(thickness: 1,color: Colors.grey,),
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 "Annual income before tax",
                      //                 style: GoogleFonts.poppins(
                      //                     color:  const Color(0xFF5A5656),
                      //                     fontSize: 16,
                      //                     fontWeight: FontWeight.w600),
                      //               ),
                      //
                      //               // Image.asset('assets/images/i.svg')
                      //             ],
                      //           ),
                      //           Row(
                      //
                      //             children: [
                      //               Text(
                      //                 "\$",
                      //                 style: GoogleFonts.poppins(
                      //                     color:  const Color(0xFF000000),
                      //                     fontSize: 16,
                      //                     fontWeight: FontWeight.w600),
                      //               ),
                      //               const SizedBox(width: 2,),
                      //               Expanded(
                      //                 child: TextField(
                      //
                      //                   decoration: new InputDecoration(
                      //                     contentPadding: const EdgeInsets.all(3.0),
                      //                     isDense: true,
                      //                     hintText: "0",
                      //                     enabledBorder: const UnderlineInputBorder(
                      //                       borderSide: BorderSide(color: Colors.grey),
                      //                     ),
                      //                     focusedBorder: const UnderlineInputBorder(
                      //                       borderSide: BorderSide(color: Colors.grey),
                      //                     ),
                      //                     hintStyle:
                      //                     GoogleFonts.poppins(
                      //                         color:  const Color(0xFF5A5656),
                      //                         fontSize: 16,
                      //                         fontWeight: FontWeight.w500),
                      //                   ),
                      //
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           const SizedBox(height: 10,),
                      //           Text(
                      //             "Is your income likely to go down in the near future?",
                      //             style: GoogleFonts.poppins(
                      //                 color:  const Color(0xFF5A5656),
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           const SizedBox(height: 7,),
                      //           Text(
                      //             "SELECT",
                      //             style: GoogleFonts.poppins(
                      //                 color:  const Color(0xFFB2802A),
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //         ]
                      //     )),
                      // const SizedBox(height: 20,),
                      // Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     padding: const EdgeInsets.all(12),
                      //
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       border: Border.all(color: Colors.grey),
                      //
                      //     ),
                      //     child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children:[
                      //           Text(
                      //             "Does anyone rely on you financially? like your partner, childrean or relatives",
                      //             style: GoogleFonts.poppins(
                      //                 color:  const Color(0xFF5A5656),
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           Text(
                      //             "SELECT",
                      //             style: GoogleFonts.poppins(
                      //                 color:  const Color(0xFFB2802A),
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //         ]
                      //     )),
                      // const SizedBox(height: 15,),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(MyRouters.privacyPolicyScreen);
                          },
                          child: Text(
                            "Learn about how we use your data",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        // Icon(Icons.exit_to_app)
                      ]),

                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFEDCB2F)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: SvgPicture.asset(
                                  "assets/images/lock3.svg",
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  "Scroll down to check all your details are correct, We will carry out an eligibility check.",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF1D1D1D),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                          onTap: () {
                            registorController.contactUpdate(context);
                            // loanController.loan(context);

                            // emailLogin();
                            //
                          },
                          child: const CustomOutlineButton(
                            title: "Submit",
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                    ]))));
  }
}
