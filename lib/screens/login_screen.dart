import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resourses/details.dart';
import '../routers/my_routers.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_textfield.dart';
import 'forgot_email.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var obscureText1 = true;
  var obscureText2 = true;

  final details = Get.put(DetailsController());

  final formKeyNumber = GlobalKey<FormState>();

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
              Icons.arrow_back_rounded, color: Colors.black,
              // color: AppTheme.primaryColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: formKeyNumber,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Text(
                      "Enter your mobile number to continue",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                            onTap: () {},
                            child: const CustomOutlineButton(
                              title: "Phone Number",
                            )),
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Get.toNamed(MyRouters.emailLoginScreen);
                        },
                        child: CustomOutlineBoder(
                          title: "Email",
                          backgroundColor: Colors.white,
                          textColor: AppTheme.buttonColor,
                          onPressed: () {
                            Get.toNamed(MyRouters.enterEmailScreen);
                          },
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppTheme.primaryColor, width: 1.3),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              const CountryCodePicker(
                                onChanged: print,
                                initialSelection: 'NG',
                                favorite: ['+234', 'NG'],
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                              ),
                              const SizedBox(
                                height: 30,
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                child: TextFormField(
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
                                      MinLengthValidator(10,
                                          errorText:
                                              'Please enter minumum 10 digit number'),
                                      MaxLengthValidator(12,
                                          errorText:
                                              'Please enter 12 digit number'),
                                      PatternValidator(
                                          r'(^(?:[+0]9)?[0-9]{10,12}$)',
                                          errorText: '')
                                    ]),
                                    controller: details.mobileNoController,
                                    decoration: const InputDecoration(
                                      hintText: "XXXXXXXXX",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Color(0xFF1D1D1D),
                                          fontSize: 16,
                                          decorationColor: Colors.transparent,
                                          decorationThickness: 0,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonTextfield(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText2 = !obscureText2;
                              });
                            },
                            child: obscureText2
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Color(0xFF8487A1),
                                  )
                                : const Icon(Icons.visibility,
                                    color: Color(0xFF8487A1))),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter your password'),
                          MinLengthValidator(8,
                              errorText:
                                  'Password must be at least 8 characters, with 1 special character & 1 numerical'),
                          PatternValidator(
                              r"(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
                              errorText:
                                  "Password must be at least with 1 special character & 1 numerical"),
                        ]),
                        controller: details.nopasswordController,
                        obSecure: obscureText2,
                        labelText: "Password",
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            // Get.toNamed(MyRouters.forgotEmail);
                            Get.to(() => const ForgotEmailScreen());
                          },
                          child: Text(
                            "Forgot Password",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .3,
                      ),
                      InkWell(
                          onTap: () {
                            if (formKeyNumber.currentState!.validate()) {
                              details.Login(context);
                            }
                            // Get.toNamed(MyRouters.mobileOtpScreen);
                          },
                          child: const CustomOutlineButton(
                            title: "SignIn",
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(MyRouters.emailLoginScreen);
                        },
                        child: CustomOutlineBoder(
                          title: "Use Email",
                          backgroundColor: Colors.white,
                          textColor: AppTheme.buttonColor,
                          onPressed: () {
                            Get.toNamed(MyRouters.emailLoginScreen);
                          },
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        )));
  }
}
