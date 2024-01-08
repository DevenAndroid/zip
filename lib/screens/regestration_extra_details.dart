import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/update_user.dart';
import '../models/model_update_address.dart';
import '../repository/update_address_repo.dart';
import '../resourses/api_constant.dart';

class ExtraDetailsScreen extends StatefulWidget {
  const ExtraDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ExtraDetailsScreen> createState() => _ExtraDetailsScreenState();
}

class _ExtraDetailsScreenState extends State<ExtraDetailsScreen> {
  final controller = Get.put(registerController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double doubleVar;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
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
          key: controller.formKeyAddressField,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "Please add any extra details to complete this  ",
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
                      controller: controller.streetController,
                      obSecure: false,
                      labelText: "Street Name",
                      hintText: '',
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Please enter Street Name  '),
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CommonTextfield(
                      controller: controller.houseNoController,
                      obSecure: false,
                      labelText: "House Number",
                      hintText: '',
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Please enter House Number '),
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CommonTextfield(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                        FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                      ],
                      onChanged: (value) => doubleVar = double.parse(value),
                      controller: controller.postalCodeController,
                      obSecure: false,
                      labelText: "Postal Code",
                      hintText: ' ',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CommonTextfield(
                      controller: controller.stateController,
                      obSecure: false,
                      labelText: "Region/state",
                      hintText: '',
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Please enter Region/state '),
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CommonTextfield(
                      controller: controller.cityController,
                      obSecure: false,
                      labelText: "City",
                      hintText: '',
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Please enter City '),
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CommonTextfield(
                      controller: controller.countryController,
                      obSecure: false,
                      labelText: "Country",
                      hintText: '',
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Please enter Country '),
                      ]),
                    ),
                    SizedBox(
                      height: size.height * .1,
                    ),
                    InkWell(
                        onTap: () {
                          if (controller.formKeyAddressField.currentState!
                              .validate()) {
                            controller.updateUserAddress(context);
                          }
                        },
                        child: const CustomOutlineButton(
                          title: "Next",
                        )),
                  ])),
        )));
  }
}
