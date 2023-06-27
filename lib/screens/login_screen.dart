import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/login_model.dart';
import '../repository/login_repo.dart';
import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  Rx<RxStatus> statusOflogin = RxStatus.empty().obs;

  Rx<LoginModel> login = LoginModel().obs;
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController nopasswordController = TextEditingController();
  // var initStateBlank = Get.arguments[0];
  final formKey4 = GlobalKey<FormState>();


  Login() {
    if (formKey4.currentState!.validate()) {

      loginRepo(
          context: context,
          password:nopasswordController.text.trim(),
          phone_email:mobileNoController.text.trim(),
          type: "phone"
      ).then((value) {
        login.value = value;
        if (value.status == true) {
          Get.toNamed(MyRouters.profileScreen);
          statusOflogin.value = RxStatus.success();
          showToast(value.message.toString());
        } else {
          statusOflogin.value = RxStatus.error();
          showToast(value.message.toString());
        }
      }

      );
    }
  }
  /* Login() {
    if (formKey4.currentState!.validate()) {
      loginUserRepo(

          name: Get.arguments[0],
          context: context,
          phone: mobileNoController.text.trim(),
          email: "user@gmail.com"
      ).then((value) {
        login.value = value;
        Get.toNamed(MyRouters.mobileOtpScreen,
            arguments: [value.data![0].reference.toString()]);


        showToast(value.message.toString());
        showToast(value.data![0].otp.toString());
      });
    }
  }*/

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//    var userName=  Get.arguments[0];
//   }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double doubleVar;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(

          elevation: 0,
          backgroundColor: Colors.white,


          leading:   InkWell(

            onTap: (){
              Get.back();
            },

            child: const Icon(
              Icons.arrow_back_rounded,color: Colors.black,
              // color: AppTheme.primaryColor,
            ),
          ),),
        body: SingleChildScrollView(
            child: Form(
              key: formKey4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
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
                                onTap: () {

                                },
                                child: const CustomOutlineButton(
                                  title: "Phone Number",
                                )),
                          ),

                          Expanded(
                              child: InkWell(
                                onTap: (){
                                  Get.toNamed(MyRouters.emailLoginScreen);
                                },
                                child: CustomOutlineBoder(
                                  title: "Email",
                                  backgroundColor: Colors.white,
                                  textColor: AppTheme.buttonColor,onPressed: (){
                                  Get.toNamed(MyRouters.enterEmailScreen);
                                },),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: AppTheme.primaryColor, width: 1.3),
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
                                      LengthLimitingTextInputFormatter(10),
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
                                          'Please enter 10 digit number'),
                                      MaxLengthValidator(10,
                                          errorText:
                                          'Please enter 10 digit number'),
                                      PatternValidator(
                                          r'(^(?:[+0]9)?[0-9]{10,12}$)',
                                          errorText: '')
                                    ]),
                                    controller: mobileNoController,
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
                      SizedBox(height: 15,),
                      CommonTextfield(
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText:
                              'Please enter your password '),])
                        ,
                        controller: nopasswordController,obSecure: false, labelText: "Password", hintText: 'Password',),
                      SizedBox(height: 15,),

                      SizedBox(height:size.height*.3,),

                      InkWell(
                          onTap: (){
                            Login();
                            // Get.toNamed(MyRouters.mobileOtpScreen);
                          },
                          child: CustomOutlineButton(title: "SignIn",)),
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(MyRouters.emailLoginScreen);
                        },
                        child: CustomOutlineBoder(title: "Use Email", backgroundColor: Colors.white,textColor: AppTheme.buttonColor,onPressed: (){
                          Get.toNamed(MyRouters.emailLoginScreen);
                        },),
                      ),


                    ]),
              ),
            )));
  }
}