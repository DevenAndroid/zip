// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'package:zip/routers/my_routers.dart';
// import 'package:zip/widgets/common_boder_button.dart';
// import 'package:zip/widgets/common_button.dart';
// import 'package:zip/widgets/common_colour.dart';
//
// import '../controller/number_controller.dart';
// import '../controller/update_user.dart';
// import '../models/modal_registor.dart';
// import '../models/model_detail_africa.dart';
// import '../models/model_save_africa_details.dart';
// import '../models/registor_model.dart';
// import '../repository/africa_save_repo.dart';
// import '../repository/live_deails_africa_repo.dart';
// import '../repository/mobile_no_otp_repo.dart';
// import '../repository/registor_repo.dart';
// import '../resourses/api_constant.dart';
// import '../widgets/common_textfield.dart';
//
// class MobileNumberScreen extends StatefulWidget {
//   const MobileNumberScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MobileNumberScreen> createState() => _MobileNumberScreenState();
// }
//
// class _MobileNumberScreenState extends State<MobileNumberScreen> {
//
//   Rx<RxStatus> statusOfAfricaDetails = RxStatus.empty().obs;
//   Rx<ModelLiveDetails> africaDetails = ModelLiveDetails().obs;
//   final Controller = Get.put(registerController());
//   liveAfrica(context) {
//
//     africaLiveDetailsRepo(
//         verificationType:"BVN-FULL-DETAILS",
//         searchParameter:Controller.BVNController.text.trim(),
//         context: context
//     ).then((value) {
//
//       africaDetails.value = value;
//       if (value.description == "Successful") {
//         // emailRegister();
//         Login();
//
//         statusOfAfricaDetails.value = RxStatus.success();
//
//         showToast(value.description.toString());
//       } else {
//         statusOfAfricaDetails.value = RxStatus.error();
//         showToast(value.description.toString());
//       }
//     }
//
//     );
//
//   }
//   Rx<RxStatus> statusOfSavedDetails = RxStatus.empty().obs;
//   Rx<ModelSaveDetailsAfrica> saveDetails = ModelSaveDetailsAfrica().obs;
//   save1(context) {
//
//     africaDetailsRepo(
//         userid:Controller. userId1,
//
//         email: africaDetails.value.response!.email.toString(),
//         phone:  africaDetails.value.response!.phone.toString(),
//         last_name: africaDetails.value.response!.lastName.toString(),
//         first_name: africaDetails.value.response!.firstName.toString(),
//         country: africaDetails.value.response!.country.toString(),
//
//         address_line_2:africaDetails.value.response!.addressLine2.toString() ,
//         address_line_3: africaDetails.value.response!.addressLine3.toString(),
//         alternate_phone: africaDetails.value.response!.alternatePhone.toString(),
//         avatar: africaDetails.value.response!.avatar.toString(),
//         bvn: africaDetails.value.response!.bvn.toString(),
//         dob: africaDetails.value.response!.dob.toString(),
//         full_name: africaDetails.value.response!.fullName.toString(),
//         gender:africaDetails.value.response!.gender.toString() ,
//         lga_of_origin:africaDetails.value.response!.lgaOfOrigin.toString() ,
//         lga_of_residence: africaDetails.value.response!.lgaOfResidence.toString(),
//         marital_status: africaDetails.value.response!.maritalStatus.toString(),
//         middle_name: africaDetails.value.response!.maritalStatus.toString(),
//         nationality: africaDetails.value.response!.nationality.toString(),
//         nin:africaDetails.value.response!.nin.toString() ,
//         state_of_origin:africaDetails.value.response!.stateOfOrigin.toString() ,
//         state_of_residence:africaDetails.value.response!.stateOfResidence.toString() ,
//         context: context
//     ).then((value) {
//
//       saveDetails.value = value;
//       if (value.status == true) {
//         Controller.targetImage =saveDetails.value.data!.avatar.toString();
//         Get.toNamed(
//             MyRouters.mobileOtpScreen, arguments: register.value.data!.user!.phone.toString());
//
//         statusOfSavedDetails.value = RxStatus.success();
//
//         showToast(value.message.toString());
//       } else {
//         statusOfSavedDetails.value = RxStatus.error();
//         showToast(value.message.toString());
//       }
//     }
//
//     );
//
//   }
//
//
//
//
//
//
//
//
//   final formKey = GlobalKey<FormState>();
//   Rx<RxStatus> statusOfregister = RxStatus.empty().obs;
//
//   Rx<RegisterModel> register = RegisterModel().obs;
//   // Rx<RxStatus> statusOfLogin = RxStatus.empty().obs;
//   //
//   // Rx<ModelCommonResponse> login = ModelCommonResponse().obs;
//   TextEditingController mobileNoController = TextEditingController();
//   TextEditingController nopasswordController = TextEditingController();
//   TextEditingController noconfirmPasswordController = TextEditingController();
//   // var initStateBlank = Get.arguments[0];
//   final numbercontroller = Get.put(numberController());
//   final formKey4 = GlobalKey<FormState>();
//   var obscureText5 = true;
//   var obscureText6 = true;
//   Login() {
//     if (formKey4.currentState!.validate()) {
//
//       registerRepo(
//           context: context,
//           password:nopasswordController.text.trim(),
//           password_confirmation: noconfirmPasswordController.text.trim(),
//           bvn: Controller.BVNController.text.trim(),
//           phone_email:"+234"+mobileNoController.text.trim(),
//           type: "phone"
//       ).then((value) {
//
//         numbercontroller.isNumber =true;
//         numbercontroller.isNumberBvn =true;
//         numbercontroller.number="+234${mobileNoController.text.trim()}";
//         numbercontroller.numberBvn=Controller.BVNController.text.trim();
//
//         numbercontroller.email="";
//         numbercontroller.emailBvn="";
//         register.value = value;
//         Controller. userId1=register.value.data!.user!.id.toString();
//         if (value.status == true) {
//
//           print("Users::::::::::::"+Controller. userId1);
//
//
//           statusOfregister.value = RxStatus.success();
//           Controller. userId1=register.value.data!.user!.id.toString();
//           showToast(value.data!.otp.toString());
//
//            save1(context);
//           // showToast(value.message.toString());
//         } else {
//           statusOfregister.value = RxStatus.error();
//           showToast(value.message.toString());
//         }
//       }
//
//       );
//     }
//   }
//   // TextEditingController BVNController1 = TextEditingController();
//   /* Login() {
//     if (formKey4.currentState!.validate()) {
//       loginUserRepo(
//
//           name: Get.arguments[0],
//           context: context,
//           phone: mobileNoController.text.trim(),
//           email: "user@gmail.com"
//       ).then((value) {
//         login.value = value;
//         Get.toNamed(MyRouters.mobileOtpScreen,
//             arguments: [value.data![0].reference.toString()]);
//
//
//         showToast(value.message.toString());
//         showToast(value.data![0].otp.toString());
//       });
//     }
//   }*/
//
// // @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //    var userName=  Get.arguments[0];
// //   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery
//         .of(context)
//         .size;
//     double doubleVar;
//     return Scaffold(
//         backgroundColor: const Color(0xFFFFFFFF),
//         appBar: AppBar(
//
//           elevation: 0,
//           backgroundColor: Colors.white,
//
//
//           leading:   InkWell(
//
//             onTap: (){
//               Get.back();
//             },
//
//             child: const Icon(
//               Icons.arrow_back_rounded,color: Colors.black,
//               // color: AppTheme.primaryColor,
//             ),
//           ),),
//         body: SingleChildScrollView(
//             child: Form(
//               key: formKey4,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0,right: 10),
//                         child: Text(
//                           "Enter your mobile number to continue",
//                           style: GoogleFonts.poppins(
//                               color: const Color(0xFF1D1D1D),
//                               fontSize: 22,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 21,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: InkWell(
//                                 onTap: () {
//
//                                 },
//                                 child: const CustomOutlineButton(
//                                   title: "Phone Number",
//                                 )),
//                           ),
//
//                           Expanded(
//                               child: InkWell(
//                                 onTap: (){
//                                   Get.toNamed(MyRouters.enterEmailScreen,);
//                                 },
//                                 child: CustomOutlineBoder(
//                                   title: "Email",
//                                   backgroundColor: Colors.white,
//                                   textColor: AppTheme.buttonColor,onPressed: (){
//                                   Get.toNamed(MyRouters.enterEmailScreen);
//                                 },),
//                               )),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 23,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0,right: 10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               border:
//                               Border.all(color: AppTheme.primaryColor, width: 1.3),
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Row(
//                             children: [
//                               const CountryCodePicker(
//                                 onChanged: print,
//                                 initialSelection: 'NG',
//                                 favorite: ['+234', 'NG'],
//                                 showCountryOnly: false,
//                                 showOnlyCountryWhenClosed: false,
//                                 alignLeft: false,
//                               ),
//                               const SizedBox(
//                                 height: 30,
//                                 child: VerticalDivider(
//                                   thickness: 1,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 120,
//                                 child: TextFormField(
//                                     keyboardType:
//                                     const TextInputType.numberWithOptions(
//                                         decimal: true),
//                                     inputFormatters: [
//                                       LengthLimitingTextInputFormatter(12),
//                                       FilteringTextInputFormatter.allow(
//                                           RegExp('[0-9]+')),
//                                     ],
//                                     onChanged: (value) =>
//                                     doubleVar = double.parse(value),
//                                     validator: MultiValidator([
//                                       RequiredValidator(
//                                           errorText:
//                                           'Please enter your contact number '),
//                                       MinLengthValidator(10,
//                                           errorText:
//                                           'Please enter minumum  10 digit number'),
//                                       MaxLengthValidator(12,
//                                           errorText:
//                                           'Please enter 12 digit number'),
//                                       PatternValidator(
//                                           r'(^(?:[+0]9)?[0-9]{10,12}$)',
//                                           errorText: '')
//                                     ]),
//                                     controller: mobileNoController,
//                                     decoration: const InputDecoration(
//                                       hintText: "XXXXXXXXXX",
//                                       border: InputBorder.none,
//                                       focusedBorder: InputBorder.none,
//                                       enabledBorder: InputBorder.none,
//                                       errorBorder: InputBorder.none,
//                                       disabledBorder: InputBorder.none,
//                                       hintStyle: TextStyle(
//                                           color: Color(0xFF1D1D1D),
//                                           fontSize: 16,
//                                           decorationColor: Colors.transparent,
//                                           decorationThickness: 0,
//                                           fontWeight: FontWeight.w600),
//                                     )),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15,),
//                       CommonTextfield(
//                         keyboardType:
//                         const TextInputType.numberWithOptions(
//                             decimal: true),
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(11),
//                           FilteringTextInputFormatter.allow(
//                               RegExp('[0-9]+')),
//                         ],
//                         onChanged: (value) =>
//                         doubleVar = double.parse(value),
//                         validator: MultiValidator([
//                           RequiredValidator(
//                               errorText:
//                               'Please enter your contact bvn number '),
//                           MinLengthValidator(11,
//                               errorText:
//                               'Please enter minumum  11 digit bnv number'),
//                           MaxLengthValidator(11,
//                               errorText:
//                               'Please enter 11 digit bvn number'),
//                           PatternValidator(
//                               r'(^(?:[+0]9)?[0-9]{10,12}$)',
//                               errorText: '')
//                         ]),controller: Controller.BVNController,obSecure: false, labelText: "BVN Number", hintText: 'BVN Number',),
//                       SizedBox(height: 15,),
//                       CommonTextfield(
//                         suffixIcon: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 obscureText5 =
//                                 !obscureText5;
//                               });
//                             },
//                             child: obscureText5
//                                 ? const Icon(
//                               Icons.visibility_off,
//                               color: Color(0xFF8487A1),
//                             )
//                                 : const Icon(
//                                 Icons.visibility,
//                                 color: Color(
//                                     0xFF8487A1))),
//                           validator: MultiValidator([
//                             RequiredValidator(
//                                 errorText: 'Please enter your password'),
//                             MinLengthValidator(8,
//                                 errorText: 'Password must be at least 8 characters, with 1 special character & 1 numerical'),
//                             PatternValidator(
//                                 r"(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
//                                 errorText: "Password must be at least with 1 special character & 1 numerical"),
//                           ]),
//
//                         controller: nopasswordController,obSecure: obscureText5, labelText: "Password", hintText: 'Password',),
//                       SizedBox(height: 15,),
//                       CommonTextfield(
//                         suffixIcon: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 obscureText6 =
//                                 !obscureText6;
//                               });
//                             },
//                             child: obscureText6
//                                 ? const Icon(
//                               Icons.visibility_off,
//                               color: Color(0xFF8487A1),
//                             )
//                                 : const Icon(
//                                 Icons.visibility,
//                                 color: Color(
//                                     0xFF8487A1))),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             if (value.toString() ==
//                                 noconfirmPasswordController.text) {
//                               return null;
//                             }
//                             return "Confirm password not matching with password";
//                           },controller: noconfirmPasswordController,obSecure: obscureText6, labelText: "Confirm Password", hintText: 'Confirm Password',),
//                       SizedBox(height: 25,),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0,right: 10),
//                         child: Text(
//                           "By opening an account, you agree to our",
//                           style: GoogleFonts.poppins(
//                               color: const Color(0xFF1D1D1D),
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0,right: 10),
//                         child: Text(
//                           "Terms of Use",
//                           style: GoogleFonts.poppins(
//                               color: const Color(0xFFB5832C),
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                       SizedBox(height:size.height*.14,),
//
//                       InkWell(
//                           onTap: (){
//                              liveAfrica(context);
//
//                             // Get.toNamed(MyRouters.mobileOtpScreen);
//                           },
//                           child: CustomOutlineButton(title: "Next",)),
//                       SizedBox(height: 15,),
//                       InkWell(
//                         onTap: (){
//                           Get.toNamed(MyRouters.enterEmailScreen);
//                         },
//                         child: CustomOutlineBoder(title: "Use Email", backgroundColor: Colors.white,textColor: AppTheme.buttonColor,onPressed: (){
//                           Get.toNamed(MyRouters.enterEmailScreen);
//                         },),
//                       ),
//
//
//                     ]),
//               ),
//             )));
//   }
// }