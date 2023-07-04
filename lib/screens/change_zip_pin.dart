import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/repository/change_zip_pin_repo.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/update_user.dart';
import '../models/modal_change_zippin.dart';
import '../models/ziptagmodel.dart';
import '../repository/ziptag_repo.dart';
import '../resourses/api_constant.dart';

class ChangeZipPin extends StatefulWidget {
  const ChangeZipPin({Key? key}) : super(key: key);

  @override
  State<ChangeZipPin> createState() => _ChangeZipPinState();
}

class _ChangeZipPinState extends State<ChangeZipPin> {
  TextEditingController oldZipController = TextEditingController();
  TextEditingController newZipController = TextEditingController();


  Rx<RxStatus> statusOfZipTag = RxStatus.empty().obs;
  Rx<ChangeZipPinModal> zipTag = ChangeZipPinModal().obs;

  final formKeyTag = GlobalKey<FormState>();

  Email() {
    if (formKeyTag.currentState!.validate()) {

      changeZipPinRepo(
          context: context,
          old_zip_pin: oldZipController.text.trim(),
        new_zip_pin: newZipController.text.trim()
      ).then((value) {
        zipTag.value = value;
        if (value.status == true) {

          Get.toNamed(MyRouters.setting);
          statusOfZipTag.value = RxStatus.success();
          showToast(value.message.toString());
        } else {
          statusOfZipTag.value = RxStatus.error();
          showToast(value.message.toString());


        }
      }

      );
    }
  }

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
          key: formKeyTag,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "Update your @Zip Tag, your unique name for getting paid by anyone ",
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
                              errorText: 'Please enter your old pin '),
                        ]),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),

                          ),
                        ),
                        controller: oldZipController,
                        obSecure: false,
                        hintText: "Enter your old pin"),

                    const SizedBox(
                      height: 20,
                    ),
                    CommonTextfield(
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter your new pin '),
                        ]),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),

                          ),
                        ),
                        controller: newZipController,
                        obSecure: false,
                        hintText: "Enter your new pin"),
                    SizedBox(
                      height: size.height * .40,
                    ),
                    InkWell(
                        onTap: () {
                        },
                        child: const CustomOutlineButton(
                          title: "Update",
                        )),
                  ])),
        )));
  }
}
