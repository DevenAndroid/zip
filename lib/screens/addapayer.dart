import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/screens/requestapayment.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/update_user.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class AddAPayer extends StatefulWidget {
  const AddAPayer({Key? key}) : super(key: key);

  @override
  State<AddAPayer> createState() => _AddAPayerState();
}

class _AddAPayerState extends State<AddAPayer> {
  final formKey4 = GlobalKey<FormState>();
  final register = Get.put(registerController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double doubleVar;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Add a payer",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20,top: 20),
        //     child: Text(
        //       "Cancel",
        //       style: GoogleFonts.poppins(
        //           color: const Color(0xFFF0D75F),
        //           fontSize: 11,
        //           fontWeight: FontWeight.w400),
        //     ),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey4,
          child: Column(
            children: [
              const SizedBox(
                height: 28,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {},
                        child: const CustomOutlineButton(
                          title: "Individual",
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: CustomOutlineBoder(
                      title: "Company",
                      backgroundColor: Colors.white,
                      textColor: AppTheme.buttonColor,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
                  prefix: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 9),
                    child: Image.asset(
                      'assets/images/nigeria.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  hintText: "Nigeria",
                  obSecure: false,
                  readOnly: true,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 12, right: 12),
              //   child: DecoratedBox(
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         border: Border.all(color: Colors.black, width: 1),
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //       child: Padding(
              //           padding: const EdgeInsets.only(left: 15, right: 30),
              //           child: DropdownButton(
              //             value: "United Kingdom",
              //             items: [
              //               DropdownMenuItem(
              //                 child: Row(
              //                   children: [
              //                     Image.asset('assets/images/nigeria.png',height: 30,),
              //                     const SizedBox(width: 10,),
              //                     Text(
              //                       "Nigeria",
              //                       style: GoogleFonts.poppins(
              //                           color: const Color(0xFF1D1D1D),
              //                           fontSize: 15,
              //                           fontWeight: FontWeight.w300),
              //                     ),
              //                   ],
              //                 ),
              //                 value: "United Kingdom",
              //               ),
              //             /*  const DropdownMenuItem(
              //                   child: Text("Canada"), value: "Canada"),*/
              //               // const DropdownMenuItem(
              //               //   child: Text("Russia"),
              //               //   value: "Russia",
              //               // )
              //             ],
              //             onChanged: (value) {},
              //             icon: const Padding(
              //                 padding: EdgeInsets.only(left: 20),
              //                 child: Icon(Icons.keyboard_arrow_down_outlined)),
              //             iconEnabledColor: Colors.black, //Icon color
              //             style: const TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 20),
              //             dropdownColor: Colors.white,
              //             underline: Container(),
              //             isExpanded: true,
              //           ))),
              // ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(12),
                    FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                  ],
                  onChanged: (value) => doubleVar = double.parse(value),
                  validator: MultiValidator([
                    RequiredValidator(
                        errorText: 'Please enter your contact number '),
                    MinLengthValidator(10,
                        errorText: 'Please enter minumum 10 digit number'),
                    MaxLengthValidator(12,
                        errorText: 'Please enter 12 digit number'),
                    PatternValidator(r'(^(?:[+0]9)?[0-9]{10,12}$)',
                        errorText: '')
                  ]),
                  obSecure: false,
                  controller: register.AddmobileController,
                  hintText: "",
                  labelText: "Mobile Number",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Please enter your Name '),
                  ]),
                  obSecure: false,
                  controller: register.AddNameController,
                  hintText: "",
                  labelText: "Name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
                  validator: (value) {
                    if (register.AddEmailController.text.isEmpty) {
                      return "Please enter your email";
                    } else if (register.AddEmailController.text.contains('+') ||
                        register.AddEmailController.text.contains(' ')) {
                      return "Email is invalid";
                    } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(register.AddEmailController.text)) {
                      return null;
                    } else {
                      return 'Please type a valid email address';
                    }
                  },
                  obSecure: false,
                  hintText: "",
                  controller: register.AddEmailController,
                  labelText: "Email",
                ),
              ),
              SizedBox(
                height: size.height * .1,
              ),
              InkWell(
                onTap: () {
                  if (formKey4.currentState!.validate()) {
                    Get.toNamed(MyRouters.requestPaymentLink);
                  }
                },
                child: const CustomOutlineButton(
                  title: "Next",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
