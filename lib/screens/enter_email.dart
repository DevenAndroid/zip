import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/number_controller.dart';
import '../controller/update_user.dart';
import '../models/modal_registor.dart';
import '../models/model_detail_africa.dart';
import '../models/model_save_africa_details.dart';
import '../models/registor_model.dart';
import '../repository/africa_save_repo.dart';
import '../repository/live_deails_africa_repo.dart';
import '../repository/mobile_no_otp_repo.dart';
import '../repository/registor_repo.dart';
import '../resourses/api_constant.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {

  // var initStateBlank = Get.arguments[0];
  // Rx<RxStatus> statusOfLogin = RxStatus.empty().obs;
  //
  // Rx<ModelCommonResponse> login = ModelCommonResponse().obs;
  Rx<RxStatus> statusOfemailregister = RxStatus.empty().obs;
  final numbercontroller = Get.put(numberController());
  final Controller = Get.put(registerController());
  Rx<RegisterModel> emailregister = RegisterModel().obs;
  TextEditingController mobileNoController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey5 = GlobalKey<FormState>();
  Rx<RxStatus> statusOfAfricaDetails = RxStatus.empty().obs;
  Rx<ModelLiveDetails> africaDetails = ModelLiveDetails().obs;

  liveAfrica(context) {

    africaLiveDetailsRepo(
        verificationType:"BVN-FULL-DETAILS",
        searchParameter:Controller.BVNController.text.trim(),
        context: context
    ).then((value) {

      africaDetails.value = value;
      if (value.description == "Successful") {
        emailRegister();


        statusOfAfricaDetails.value = RxStatus.success();

        showToast(value.description.toString());
      } else {
        statusOfAfricaDetails.value = RxStatus.error();
        showToast(value.description.toString());
      }
    }

    );

  }
  Rx<RxStatus> statusOfSavedDetails = RxStatus.empty().obs;
  Rx<ModelSaveDetailsAfrica> saveDetails = ModelSaveDetailsAfrica().obs;
  save1(context) {

    africaDetailsRepo(
      userid:Controller. userId1,

        email: africaDetails.value.response!.email.toString(),
        phone:  africaDetails.value.response!.phone.toString(),
        last_name: africaDetails.value.response!.lastName.toString(),
        first_name: africaDetails.value.response!.firstName.toString(),
        country: africaDetails.value.response!.country.toString(),

        address_line_2:africaDetails.value.response!.addressLine2.toString() ,
        address_line_3: africaDetails.value.response!.addressLine3.toString(),
        alternate_phone: africaDetails.value.response!.alternatePhone.toString(),
        avatar: africaDetails.value.response!.avatar.toString(),
        bvn: africaDetails.value.response!.bvn.toString(),
        dob: africaDetails.value.response!.dob.toString(),
        full_name: africaDetails.value.response!.fullName.toString(),
        gender:africaDetails.value.response!.gender.toString() ,
        lga_of_origin:africaDetails.value.response!.lgaOfOrigin.toString() ,
        lga_of_residence: africaDetails.value.response!.lgaOfResidence.toString(),
        marital_status: africaDetails.value.response!.maritalStatus.toString(),
        middle_name: africaDetails.value.response!.maritalStatus.toString(),
        nationality: africaDetails.value.response!.nationality.toString(),
        nin:africaDetails.value.response!.nin.toString() ,
        state_of_origin:africaDetails.value.response!.stateOfOrigin.toString() ,
        state_of_residence:africaDetails.value.response!.stateOfResidence.toString() ,
        context: context
    ).then((value) {

      saveDetails.value = value;
      if (value.status == true) {
        Controller.targetImage =saveDetails.value.data!.avatar.toString();
        Get.toNamed(
            MyRouters.otpEmailScreen, arguments: [Controller.emailNoController.text]);

        statusOfSavedDetails.value = RxStatus.success();

        showToast(value.message.toString());
      } else {
        statusOfSavedDetails.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }

    );

  }
  emailRegister() {
    if (formKey5.currentState!.validate()) {

      registerRepo(
          context: context,
          password:passwordController.text.trim(),
          bvn: Controller.BVNController.text.trim(),
          phone: "+234"+mobileNoController.text.trim(),
          password_confirmation: confirmPasswordController.text.trim(),
          email:Controller.emailNoController.text.trim(),

      ).then((value) {
        numbercontroller.isNumber =true;
        numbercontroller.isNumberBvn =false;
        numbercontroller.email=Controller.emailNoController.text.trim();
        numbercontroller.number="+234${mobileNoController.text.trim()}";
        numbercontroller.emailBvn=Controller.BVNController.text.trim();

        // numbercontroller.number="";
        // numbercontroller.numberBvn="";



        emailregister.value = value;
        Controller. userId1=emailregister.value.data!.user!.id.toString();
        if (value.status == true) {

print("Users::::::::::::"+Controller. userId1);


          statusOfemailregister.value = RxStatus.success();
Controller. userId1=emailregister.value.data!.user!.id.toString();
          showToast(value.data!.otp.toString());
// Get.toNamed(
//     MyRouters.otpEmailScreen, arguments: [Controller.emailNoController.text]);
 save1(context);
           showToast(value.message.toString());
        } else {
          statusOfemailregister.value = RxStatus.error();
          showToast(value.message.toString());
        }
      }

      );
    }
  }



  var obscureText4 = true;
  var obscureText3 = true;
  // emailLogin() {
  //   if (formKey3.currentState!.validate()) {
  //     loginUserRepo(
  //       name: Get.arguments[0],
  //       context: context,
  //       phone: "08130000000",
  //       email: emailNoController.text.trim(),
  //     ).then((value) {
  //       login.value = value;
  //       Get.toNamed(MyRouters.otpEmailScreen,
  //           arguments: [value.data![0].reference.toString()]);
  //       // Get.toNamed(MyRouters.otpEmailScreen);
  //
  //
  //       showToast(value.message.toString());
  //       showToast(value.data![0].otp.toString());
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double doubleVar;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading:   InkWell(

            onTap: (){
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),),
        body: SingleChildScrollView(
            child: Form(
              key:formKey5 ,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: InkWell(
                          onTap: (){
                            print("hgdfhhh"+Controller.avtar.toString());
                          },
                          child: Text(
                            "Enter your email & Mobile No to continue ",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //         child: InkWell(
                      //           onTap: (){
                      //             Get.back();
                      //           },
                      //           child: CustomOutlineBoder(
                      //             title: "Phone",
                      //             backgroundColor: Colors.white,
                      //             textColor: AppTheme.buttonColor,onPressed: (){
                      //             Get.toNamed(MyRouters.mobileNumber);
                      //           },),
                      //         )),
                      //
                      //     const SizedBox(
                      //       height: 15,
                      //     ),
                      //     Expanded(
                      //       child: InkWell(
                      //           onTap: () {
                      //
                      //           },
                      //           child: const CustomOutlineButton(
                      //             title: "Email",
                      //           )),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 23,
                      ),
                      CommonTextfield(
                        validator: (value) {
                          if (Controller.emailNoController.text.isEmpty) {
                            return "Please enter your email";
                          } else if (Controller.emailNoController.text.contains('+') || Controller.emailNoController.text.contains(' ')) {
                            return "Email is invalid";
                          } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(Controller.emailNoController.text)) {
                            return null;
                          } else {
                            return 'Please type a valid email address';
                          }
                        },
                        controller: Controller.emailNoController,obSecure: false, hintText: "pkp@gmail.com",labelText: "Email",),
                      SizedBox(height: 15,),
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
                                          'Please enter minumum  10 digit number'),
                                      MaxLengthValidator(12,
                                          errorText:
                                          'Please enter 12 digit number'),
                                      PatternValidator(
                                          r'(^(?:[+0]9)?[0-9]{10,12}$)',
                                          errorText: '')
                                    ]),
                                    controller: mobileNoController,
                                    decoration: const InputDecoration(
                                      hintText: "XXXXXXXXXX",
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
                        keyboardType:
                        const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                          FilteringTextInputFormatter.allow(
                              RegExp('[0-9]+')),
                        ],
                        onChanged: (value) =>
                        doubleVar = double.parse(value),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText:
                              'Please enter your bvn number '),
                          MinLengthValidator(11,
                              errorText:
                              'Please enter minumum  11 bvn number'),
                          MaxLengthValidator(11,
                              errorText:
                              'Please enter 11 digit bvn number'),
                          PatternValidator(
                              r'(^(?:[+0]9)?[0-9]{10,12}$)',
                              errorText: '')
                        ]),controller: Controller.BVNController,obSecure: false, labelText: "BVN Number", hintText: 'BVN Number',),
                      SizedBox(height: 15,),
                      CommonTextfield(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText4 =
                                !obscureText4;
                              });
                            },
                            child: obscureText4
                                ? const Icon(
                              Icons.visibility_off,
                              color: Color(0xFF8487A1),
                            )
                                : const Icon(
                                Icons.visibility,
                                color: Color(
                                    0xFF8487A1))),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter your password'),
                          MinLengthValidator(8,
                              errorText: 'Password must be at least 8 characters, with 1 special character & 1 numerical'),
                          PatternValidator(
                              r"(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
                              errorText: "Password must be at least with 1 special character & 1 numerical"),
                        ]),
                        obSecure: obscureText4,
                    controller: passwordController, labelText: "Password", hintText: 'Password',),
                      SizedBox(height: 15,),
                      CommonTextfield(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText3 =
                                !obscureText3;
                              });
                            },
                            child: obscureText3
                                ? const Icon(
                              Icons.visibility_off,
                              color: Color(0xFF8487A1),
                            )
                                : const Icon(
                                Icons.visibility,
                                color: Color(
                                    0xFF8487A1))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.toString() ==
                                passwordController.text) {
                              return null;
                            }
                            return "Confirm password not matching with password";
                          },controller: confirmPasswordController,obSecure: obscureText3, labelText: "Confirm Password", hintText: 'Confirm Password',),
                      SizedBox(height: 25,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: Text(
                          "By opening an account, you agree to our",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: Text(
                          "Terms of Use",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFFB5832C),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height:size.height*.1,),

                      InkWell(
                          onTap: (){
                          liveAfrica(context);

                            // emailRegister();
                            //
                          },
                          child: CustomOutlineButton(title: "Next",)),
                      SizedBox(height: 15,),
                      // InkWell(
                      //   onTap: (){
                      //
                      //     Get.toNamed(MyRouters.mobileNumber);
                      //   },
                      //   child: CustomOutlineBoder(title: "Use Mobile Number", backgroundColor: Colors.white,textColor: AppTheme.buttonColor,onPressed: (){
                      //     Get.toNamed(MyRouters.mobileNumber);
                      //   },),
                      // ),


                    ]),
              ),
            )));
  }
}
