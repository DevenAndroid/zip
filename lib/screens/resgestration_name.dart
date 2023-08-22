import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/number_controller.dart';
import '../controller/update_user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final formKeyName = GlobalKey<FormState>();
  final numbercontroller = Get.put(numberController());


  final registorController = Get.put(registerController());

  @override
  void initState() {
    super.initState();
    registorController.molileController.text=numbercontroller.number;
    registorController.emailController.text=numbercontroller.email;
    print(numbercontroller.number);
    print(numbercontroller.email);
  }




  List<DropdownMenuItem<String>> get dropdownItemsm {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(value: "wema", child: Text("wema")),
      const DropdownMenuItem(value: "providus", child: Text("providus")),
      const DropdownMenuItem(value: "", child: Text("")),

    ];
    return menuItemsm;
  }
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
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: formKeyName,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "Please enter your first & last name",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CommonTextfield(
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter your first name '),
                        ]),
                        controller: registorController.firstNameController,
                        obSecure: false,
                        hintText:  "first name"),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfield(
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter your last name '),
                        ]),
                        controller: registorController.lastNameController,
                        obSecure: false,
                        hintText: "Last Name"),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfield(
                        keyboardType:
                        const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12),
                          FilteringTextInputFormatter.allow(
                              RegExp('[0-9]+')),
                        ],
                        onChanged: (value) =>
                        doubleVar = double.parse(value),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText:
                              'Please enter your contact number '),
                          MinLengthValidator(11,
                              errorText:
                              'Please enter minumum  11 digit number'),
                          MaxLengthValidator(12,
                              errorText:
                              'Please enter 12 digit number'),
                          PatternValidator(
                              r'(^(?:[+0]9)?[0-9]{10,12}$)',
                              errorText: '')
                        ]),
                        readOnly: numbercontroller.isNumber,
                        controller:     registorController.molileController,
                        obSecure: false,
                        hintText: "mobile number"),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfield(
                      readOnly: !numbercontroller.isNumber,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter your email'),
                        ]),
                        controller:     registorController.emailController,
                        obSecure: false,
                        hintText:"email"),


                    SizedBox(
                      height: size.height * .2,
                    ),
                    GestureDetector(
                        onTap: () {
                          if (formKeyName.currentState!.validate()) {
                            Get.toNamed(
                              MyRouters.birthdayScreen,
                            );
                          }
                        },
                        child: const CustomOutlineButton(
                          title: "Next ",
                        )),
                  ])),
        )));
  }
}
