import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({Key? key}) : super(key: key);

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')});
  final registorController = Get.put(registerController());
  final formKeyBirthday = GlobalKey<FormState>();
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double doubleVar;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "",
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
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        body: Obx(() {
      return profileController.modal.value.status == true?

      SingleChildScrollView(
            child: Form(
          key: formKeyBirthday,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        children: [
                          Text(
                            "Welcome to"+'${profileController.modal.value.data!.user!.fname.toString()} ' +
                                ' ${profileController.modal.value.data!.user!.lname.toString()}',
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                          SvgPicture.asset(
                            'assets/images/Hand.svg',
                          ),
                          Text(
                            " !",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "When is your birthday? ",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CommonTextfield(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                    primary: AppTheme
                                        .primaryColor, // header background color
                                    onPrimary:
                                        Colors.white, // header text color
                                    onSurface:
                                        AppTheme.buttonColor // body text color
                                    ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppTheme
                                        .buttonColor, // button text color
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },

                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime.now(),
                        );

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            registorController.dateOfBirthController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                      controller: registorController.dateOfBirthController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [maskFormatter],
                      onChanged: (value) => doubleVar = double.parse(value),
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Please enter your DOB  '),
                      ]),
                      obSecure: false,
                      readOnly: true,
                      hintText: "2005-09-15",
                    ),
                    SizedBox(
                      height: size.height * .5,
                    ),
                    InkWell(
                        onTap: () {
                          if (formKeyBirthday.currentState!.validate()) {
                            Get.toNamed(
                              MyRouters.tagScreen,
                            );
                          }
                        },
                        child: const CustomOutlineButton(
                          title: "Next",
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRouters.tagScreen);
                      },
                      child: CustomOutlineBoder(
                        title: "Skip",
                        backgroundColor: Colors.white,
                        textColor: AppTheme.buttonColor,
                        onPressed: () {
                          Get.toNamed(MyRouters.enterEmailScreen);
                        },
                      ),
                    )
                  ])),
        )) : const Center(
        child: CircularProgressIndicator(),
      );
        }),);
  }
}
