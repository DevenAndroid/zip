import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/update_user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final formKeyName = GlobalKey<FormState>();
  final registorController = Get.put(registerController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                        hintText: "Daniel"),
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
                    SizedBox(
                      height: size.height * .5,
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
