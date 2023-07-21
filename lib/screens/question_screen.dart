import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import '../routers/my_routers.dart';
import '../widgets/common_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  String dropdownvalue = 'Government Employed';

  List<DropdownMenuItem<String>> get dropdownItemsm1 {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(value: "Government Employed", child: Text("Government Employed",)),
      const DropdownMenuItem(value: "Private Employed", child: Text("Private Employed")),
      const DropdownMenuItem(value: "Unemployed", child: Text("Unemployed")),
      const DropdownMenuItem(value: "Self Employed", child: Text("Self Employed")),
      const DropdownMenuItem(value: "Small Business owner", child: Text("Small Business owner")),
    ];
    return menuItemsm;
  }
  List<DropdownMenuItem<String>> get dropdownItemsm {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(value: "Home owner", child: Text("Home owner",)),
      const DropdownMenuItem(value: "Rental", child: Text("Rental")),
    ];
    return menuItemsm;
  }
  String selectedValuem = "Home owner";
  List<DropdownMenuItem<String>> get dropdownItemsm2 {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(value: "0 lakh to 1 lakh", child: Text("0 lakh to 1 lakh")),
      const DropdownMenuItem(value: "1 lakh to 2 lakh", child: Text("1 lakh to 2 lakh")),
      const DropdownMenuItem(value: "2 lakh to 3 lakh", child: Text("2 lakh to 3 lakh")),
      const DropdownMenuItem(value: "3 lakh to 4 lakh", child: Text("3 lakh to 4 lakh")),
      const DropdownMenuItem(value: "4 lakh to 5 lakh", child: Text("4 lakh to 5 lakh")),
    ];
    return menuItemsm;
  }
  String selectedValuem1 = "0 lakh to 1 lakh";
  List<DropdownMenuItem<String>> get dropdownItemsm3 {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(value: "1 month to 6 month", child: Text("1 month to 6 month")),
      const DropdownMenuItem(value: "6 month to 1 year", child: Text("6 month to 1 year")),
      const DropdownMenuItem(value: "1 year to 2 year", child: Text("1 year to 2 year")),
      const DropdownMenuItem(value: "2 year to 3 year", child: Text("2 year to 3 year")),
      const DropdownMenuItem(value: "3 year to 4 year", child: Text("3 year to 4 year")),
    ];
    return menuItemsm;
  }
  String selectedValuem2 = "1 month to 6 month";
  List<DropdownMenuItem<String>> get dropdownItemsm4 {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(value: "0 lakh to 1 lakh", child: Text("0 lakh to 1 lakh")),
      const DropdownMenuItem(value: "1 lakh to 2 lakh", child: Text("1 lakh to 2 lakh")),
      const DropdownMenuItem(value: "2 lakh to 3 lakh", child: Text("2 lakh to 3 lakh")),
      const DropdownMenuItem(value: "3 lakh to 4 lakh", child: Text("3 lakh to 4 lakh")),
      const DropdownMenuItem(value: "4 lakh to 5 lakh", child: Text("4 lakh to 5 lakh")),
    ];
    return menuItemsm;
  }
  String selectedValuem3 = "0 lakh to 1 lakh";
  List<DropdownMenuItem<String>> get dropdownItemsm5 {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(value: "Yes", child: Text("Yes")),
      const DropdownMenuItem(value: "No", child: Text("No")),
    ];
    return menuItemsm;
  }
  String selectedValuem4 = "Yes";




  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
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
            onTap: (){
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF1D1D1D),
            ),
          ),
        ),
        body:  SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Text(
                        "Please answer some questions",
                        style: GoogleFonts.poppins(
                            color:  Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        "We need some more info first to see what we can offer. answering these questions won’t affect your score.",
                        style: GoogleFonts.poppins(
                            color:  const Color(0xFF343434),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20,),
                      Text('Residential status',style: GoogleFonts.poppins(
                          color: const Color(0xFF5A5656),
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                      ),),
                      const SizedBox(height: 20,),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Please select your channel'),
                          ]),
                          style: GoogleFonts.poppins(color: const Color(0xFF585757),fontWeight: FontWeight.w400,fontSize: 16),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                          ),
                          hint: const Text("Home Owner"),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          value: selectedValuem,
                          items: dropdownItemsm,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValuem = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text('Employed status',style: GoogleFonts.poppins(
                          color: const Color(0xFF5A5656),
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                      ),),
                      const SizedBox(height: 20,),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Please select your channel'),
                          ]),
                          style: GoogleFonts.poppins(color: const Color(0xFF585757),fontWeight: FontWeight.w400,fontSize: 16),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                          ),
                          hint: const Text(""),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          value: dropdownvalue,
                          items: dropdownItemsm1,
                          onChanged: (String? value) {
                            setState(() {
                              dropdownvalue = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text('Monthly income',style: GoogleFonts.poppins(
                          color: const Color(0xFF5A5656),
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                      ),),
                      const SizedBox(height: 20,),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Please select your channel'),
                          ]),
                          style: GoogleFonts.poppins(color: const Color(0xFF585757),fontWeight: FontWeight.w400,fontSize: 16),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                          ),
                          hint: const Text(""),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          value: selectedValuem1,
                          items: dropdownItemsm2,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValuem1 = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text('Duration of loan (in months)',style: GoogleFonts.poppins(
                          color: const Color(0xFF5A5656),
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                      ),),
                      const SizedBox(height: 20,),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Please select your channel'),
                          ]),
                          style: GoogleFonts.poppins(color: const Color(0xFF585757),fontWeight: FontWeight.w400,fontSize: 16),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                          ),
                          hint: const Text(""),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          value: selectedValuem2,
                          items: dropdownItemsm3,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValuem2 = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text('Desired Amount ',style: GoogleFonts.poppins(
                          color: const Color(0xFF5A5656),
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                      ),),
                      const SizedBox(height: 20,),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Please select your channel'),
                          ]),
                          style: GoogleFonts.poppins(color: const Color(0xFF585757),fontWeight: FontWeight.w400,fontSize: 16),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                          ),
                          hint: const Text(""),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          value: selectedValuem3,
                          items: dropdownItemsm4,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValuem3 = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text('Is your income likely to change in the next 6 - 12 months',style: GoogleFonts.poppins(
                          color: const Color(0xFF5A5656),
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                      ),),
                      const SizedBox(height: 20,),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Please select your channel'),
                          ]),
                          style: GoogleFonts.poppins(color: const Color(0xFF585757),fontWeight: FontWeight.w400,fontSize: 16),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB7B7B7), width: 1.5),
                            ),
                          ),
                          hint: const Text(""),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          value: selectedValuem4,
                          items: dropdownItemsm5,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValuem4 = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),
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
                      Text(
                        "Learn about how we use your data",
                        style: GoogleFonts.poppins(
                            color:  const Color(0xFFB2802A),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFFB2802A).withOpacity(0.20)),
                            color: const Color(0xFFB2802A).withOpacity(.15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(child:  SvgPicture.asset("assets/images/lock3.svg"),),
                              const SizedBox(width: 15,),
                              Expanded(
                                child: Text(
                                  "Scroll down to check all your details. submitting won’t impact your credit score.",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF1D1D1D),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),

                                ),
                              ),

                            ],
                          ),
                        ),


                      ),
                      const SizedBox(height: 15,),
                       InkWell(
                           onTap: (){
                             Get.toNamed(MyRouters.eligibleScreen);
                             // emailLogin();
                             //
                           },
                           child: const CustomOutlineButton(title: "Sumbit",)),
                      const SizedBox(height: 15,),
                    ])
            ))
    );
  }
}
