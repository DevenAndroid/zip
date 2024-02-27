import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/screens/forgot_email.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../resourses/details.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen>
    with SingleTickerProviderStateMixin {
  final formKeylogin = GlobalKey<FormState>();
  var obscureText = true;
  final details = Get.put(DetailsController());
  var obscureText1 = true;
  var obscureText2 = true;
  late TabController _tabController;
  late String _appBarTitle;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _appBarTitle = 'Enter your email to continue'; // Set the initial title
    _tabController.addListener(_updateAppBarTitle);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateAppBarTitle() {
    setState(() {
      // Update the AppBar title based on the active tab
      switch (_tabController.index) {
        case 0:
          _appBarTitle = "Enter your email to continue";
          break;
        case 1:
          _appBarTitle = 'Enter your mobile number\nto continue';
          break;
      }
    });
  }

  final formKeyNumber = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              _appBarTitle,
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_rounded,
                color: AppTheme.primaryColor,
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              indicatorColor: AppTheme.secondaryColor,
              indicatorPadding: const EdgeInsets.only(left: 15, right: 10),
              labelColor: Colors.black,
              labelStyle: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
              unselectedLabelColor: Colors.grey,
              dividerColor: Colors.grey.withOpacity(.1),
              unselectedLabelStyle: GoogleFonts.poppins(
                  color: const Color(0xFF777777),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
              tabs: [
                const Tab(text: "Email"),
                const Tab(
                  text: "Phone",
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 8, left: 8),
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      CommonTextfield(
                        validator: (value) {
                          if (details.emailNoController.text.isEmpty) {
                            return "Please enter your email";
                          } else if (details.emailNoController.text
                                  .contains('+') ||
                              details.emailNoController.text.contains(' ')) {
                            return "Email is invalid";
                          } else if (RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(details.emailNoController.text)) {
                            return null;
                          } else {
                            return 'Please type a valid email address';
                          }
                        },
                        controller: details.emailNoController,
                        obSecure: false,
                        hintText: "pkp@gmail.com",
                        labelText: "Email",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonTextfield(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: obscureText
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
                        controller: details.passwordController,
                        obSecure: obscureText,
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
                            details.Email(context);
                            // emailRegister();
                            // emailLogin();
                            //
                          },
                          child: const CustomOutlineButton(
                            title: "Sign In",
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          if (formKeylogin.currentState!.validate()) {
                            Get.toNamed(MyRouters.loginScreen);
                          }
                        },
                        child: CustomOutlineBoder(
                          title: "Use mobile number",
                          backgroundColor: Colors.white,
                          textColor: AppTheme.buttonColor,
                          onPressed: () {
                            Get.toNamed(MyRouters.loginScreen);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CommonTextfield(
                        prefix: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width: 125,
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/images/nigeria.svg"),
                                const Icon(Icons.arrow_drop_down_outlined),
                                const SizedBox(
                                  height: 30,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "+234",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF1D1D1D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12),
                          FilteringTextInputFormatter.allow(
                              RegExp('[0-9]+\\.?[0-9]*')),
                        ],
                        onChanged: (value) {},
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter your contact number '),
                          MinLengthValidator(10,
                              errorText:
                                  'Please enter minumum 10 digit number'),
                          MaxLengthValidator(12,
                              errorText: 'Please enter 12 digit number'),
                          PatternValidator(r'(^(?:[+0]9)?[0-9]{10,12}$)',
                              errorText: '')
                        ]),
                        controller: details.mobileNoController,
                        obSecure: obscureText2,
                        labelText: "Phone number",
                        hintText: 'Phone number',
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
                            title: "Sign In",
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(MyRouters.emailLoginScreen);
                        },
                        child: CustomOutlineBoder(
                          title: "Use email",
                          backgroundColor: Colors.white,
                          textColor: AppTheme.buttonColor,
                          onPressed: () {
                            Get.toNamed(MyRouters.emailLoginScreen);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
