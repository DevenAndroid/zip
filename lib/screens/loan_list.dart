import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/loan_controller.dart';
import '../routers/my_routers.dart';
import '../widgets/common_button.dart';

class LoanList extends StatefulWidget {
  const LoanList({Key? key}) : super(key: key);

  @override
  State<LoanList> createState() => _LoanListState();
}

class _LoanListState extends State<LoanList> {
  final loanController = Get.put(LoanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 25,
                  )),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "What’s your loan for?",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(children: <Widget>[
                  Expanded(
                    child: ListTile(

                      title: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset('assets/images/icon1.svg'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Car',
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Radio(
                            value: 1,
                            groupValue: loanController.selectedValue,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(
                                () {
                                  loanController.selectedValue = value!;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset('assets/images/icon2.svg'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Holiday',
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Radio(
                            value: 2,
                            groupValue: loanController.selectedValue,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(
                                () {
                                  loanController.selectedValue = value!;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset('assets/images/icon3.svg'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Home improvements',
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Radio(
                            value: 3,
                            groupValue: loanController.selectedValue,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(
                                () {
                                  loanController.selectedValue = value!;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset('assets/images/icons4.svg'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'One-off purchase',
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Radio(
                            value: 4,
                            groupValue: loanController.selectedValue,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(
                                () {
                                  loanController.selectedValue = value!;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset('assets/images/icon5.svg'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Consolidating Finances',
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Radio(
                            value: 5,
                            groupValue: loanController.selectedValue,
                            activeColor: AppTheme.secondaryColor,
                            onChanged: (value) {
                              setState(
                                () {
                                  loanController.selectedValue = value!;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset('assets/images/icon6.svg'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Wedding',
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Radio(
                            value: 6,
                            groupValue: loanController.selectedValue,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(
                                () {
                                  loanController.selectedValue = value!;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset('assets/images/icon7.svg'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Something else',
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Radio(
                            value: 7,
                            groupValue: loanController.selectedValue,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(
                                () {
                                  loanController.selectedValue = value!;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset('assets/images/icon8.svg'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Just browsing',
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Radio(
                            value: 8,
                            groupValue: loanController.selectedValue,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(
                                () {
                                  loanController.selectedValue = value!;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    Get.toNamed(MyRouters.questionsScreen);
                    // emailLogin();
                    //
                  },
                  child: const CustomOutlineButton(
                    title: "Next",
                  )),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
