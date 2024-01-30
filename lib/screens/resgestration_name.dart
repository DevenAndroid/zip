import 'package:flutter/material.dart';
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
    registorController.molileController.text = numbercontroller.number;
    registorController.emailController.text = numbercontroller.email;
    registorController.getData();
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
                        readOnly: false,
                        controller: registorController.firstNameController,
                        obSecure: false,
                        // readOnly: true,
                        hintText: "first name"),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfield(
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter your last name '),
                        ]),
                        readOnly: false,
                        controller: registorController.lastNameController,
                        obSecure: false,
                        // readOnly: true,
                        hintText: "Last Name"),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfield(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        readOnly: true,
                        controller: registorController.molileController,
                        obSecure: false,
                        hintText: "mobile number"),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextfield(
                        readOnly: true,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter your email'),
                        ]),
                        controller: registorController.emailController,
                        obSecure: false,
                        hintText: "email"),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "Please enter your Full name as it’s shown on your government documents or BVN registration",
                        style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .18,
                    ),
                    GestureDetector(
                        onTap: () {
                          if (formKeyName.currentState!.validate()) {
                            // registorController.contactCreate1(context);
                            Get.toNamed(MyRouters.birthdayScreen, arguments: [
                              registorController.firstNameController.text.trim()
                            ]);
                          }
                        },
                        child: const CustomOutlineButton(
                          title: "Next ",
                        )),
                  ])),
        )));
  }
}
