// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../controller/number_controller.dart';
// import '../controller/update_user.dart';
// import '../repository/create_vritual_account_repo.dart';
// import '../resourses/api_constant.dart';
// import '../widgets/common_button.dart';
// import '../widgets/common_colour.dart';
// import '../widgets/common_textfield.dart';
// class VirtualAccount extends StatefulWidget {
//   const VirtualAccount({Key? key}) : super(key: key);
//
//   @override
//   State<VirtualAccount> createState() => _VirtualAccountState();
// }
//
// class _VirtualAccountState extends State<VirtualAccount> {
//   TextEditingController currencyController = TextEditingController();
//   TextEditingController accountTypeController = TextEditingController();
//   TextEditingController countryOfResidenceController = TextEditingController();
//   TextEditingController insurance_numberController = TextEditingController();
//   TextEditingController emergency_contactController = TextEditingController();
//   TextEditingController acnumberController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController cityController = TextEditingController();
//   TextEditingController typeController = TextEditingController();
//   TextEditingController phnumberController = TextEditingController();
//   TextEditingController issuedCountryCodeController = TextEditingController();
//   TextEditingController issuedByController = TextEditingController();
//   TextEditingController issuedDateController = TextEditingController();
//   TextEditingController expirationDateController = TextEditingController();
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController birthDateController = TextEditingController();
//   TextEditingController nationalityController = TextEditingController();
//   TextEditingController incomeBandController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController sourceOfIncomeController = TextEditingController();
//   TextEditingController employmentStatusController = TextEditingController();
//   TextEditingController accountDesignationController = TextEditingController();
//   TextEditingController zipController = TextEditingController();
//   TextEditingController streetController = TextEditingController();
//   TextEditingController occupationController = TextEditingController();
//
//   final registorController = Get.put(registerController());
//   final formKeyprofile = GlobalKey<FormState>();
//   File image = File("");
//   File image1 = File("");
//   File image2 = File("");
//   Future pickImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       final imageTemporary = File(image.path);
//       setState(() {
//         this.image = imageTemporary;
//       });
//     } on PlatformException catch (e) {
//       print('Field to pick img : $e');
//     }
//   }
//   Future pickImage1() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       final imageTemporary = File(image.path);
//       setState(() {
//         this.image1 = imageTemporary;
//       });
//     } on PlatformException catch (e) {
//       print('Field to pick img : $e');
//     }
//   }
//   Future pickImage2() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       final imageTemporary = File(image.path);
//       setState(() {
//         this.image2 = imageTemporary;
//       });
//     } on PlatformException catch (e) {
//       print('Field to pick img : $e');
//     }
//   }
//   final numbercontroller = Get.put(numberController());
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double doubleVar;
//     return Scaffold(
//         backgroundColor: const Color(0xFFFFFFFF),
//     appBar: AppBar(
//     backgroundColor: Colors.white,
//     elevation: 0,
//     leading: InkWell(
//     onTap: () {
//     Get.back();
//     },
//     child: const Icon(
//     Icons.arrow_back_rounded,
//     color: AppTheme.primaryColor,
//     ),
//     ),
//     title: Text(
//     "Create Virtual Account ",
//     style: GoogleFonts.poppins(
//     color: const Color(0xFF1D1D1D),
//     fontSize: 20,
//     fontWeight: FontWeight.w500),
//     ),
//
//     centerTitle: true,
//     ),
//     body: SingleChildScrollView(
//     child: Padding(
//     padding: const EdgeInsets.all(12.0),
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     const SizedBox(
//     height: 20,
//     ),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Currency*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: currencyController,
//                         obSecure: false, hintText: "NGN",),
//       const SizedBox(height: 11,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('AccountType*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: accountTypeController,
//         obSecure: false, hintText: "Individual",),
//       const SizedBox(height: 11,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('KYC Information',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 17,
//               fontWeight: FontWeight.w600),),
//
//       ),
//       const SizedBox(height: 8,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Address',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 16,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('CountryOfResidence*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: countryOfResidenceController,
//         obSecure: false, hintText: "IN",),
//       const SizedBox(height: 11,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Zip*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller:zipController ,
//         obSecure: false, hintText: "23401",),
//       const SizedBox(height: 11,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Street*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: streetController,
//         obSecure: false, hintText: "Ikereku",),
//       const SizedBox(height: 11,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Number*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: acnumberController,
//         obSecure: false, hintText: "32",), const SizedBox(height: 11,),
//
//
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('State *',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: stateController,
//         obSecure: false, hintText: "Lagos",), const SizedBox(height: 11,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('City*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//
//
//       CommonTextfield(
//         controller: cityController,
//         obSecure: false, hintText: "Alimosho",),
//       const SizedBox(height: 12,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Document',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 16,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Type*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: typeController,
//         obSecure: false, hintText: "passport",),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Number*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: phnumberController,
//         obSecure: false, hintText: "B00530139",),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Issued Country Code*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: issuedCountryCodeController,
//         obSecure: false, hintText: "NG",),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('IssuedBy*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: issuedByController,
//         obSecure: false, hintText: "government",),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Issued Date*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: issuedDateController,
//         obSecure: false, hintText: "2021-09-14",),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('First Name*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
// readOnly: true,
//         controller: registorController.firstNameController,
//         obSecure: false, hintText: "PKP",),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Last Name*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         readOnly: true,
//         controller: registorController.lastNameController,
//         obSecure: false, hintText: "k",),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Email*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//           readOnly: !numbercontroller.isNumber,
//           validator: MultiValidator([
//             RequiredValidator(
//                 errorText: 'Please enter your email'),
//           ]),
//           controller:     registorController.emailController,
//           obSecure: false,
//           hintText:"email"),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Birth Date*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         readOnly: true,
//         controller: registorController.dateOfBirthController,
//         obSecure: false, hintText: "1993-07-24",),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Income Band*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: incomeBandController,
//         obSecure: false, hintText: "0-100000",),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Phone*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//           keyboardType:
//           const TextInputType.numberWithOptions(
//               decimal: true),
//           inputFormatters: [
//             LengthLimitingTextInputFormatter(12),
//             FilteringTextInputFormatter.allow(
//                 RegExp('[0-9]+')),
//           ],
//           onChanged: (value) =>
//           doubleVar = double.parse(value),
//           validator: MultiValidator([
//             RequiredValidator(
//                 errorText:
//                 'Please enter your contact number '),
//             MinLengthValidator(10,
//                 errorText:
//                 'Please enter minumum  10 digit number'),
//             MaxLengthValidator(12,
//                 errorText:
//                 'Please enter 12 digit number'),
//             PatternValidator(
//                 r'(^(?:[+0]9)?[0-9]{10,12}$)',
//                 errorText: '')
//           ]),
//           readOnly: numbercontroller.isNumber,
//           controller:     registorController.molileController,
//           obSecure: false,
//           hintText: "mobile number"),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Occupation*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: occupationController,
//         obSecure: false, hintText: "Software-Developer",),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Source Of Income*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: sourceOfIncomeController,
//         obSecure: false, hintText: "Software-Development",),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Account Designation*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: accountDesignationController,
//         obSecure: false, hintText: "personal",),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Employment Status*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 7,),
//       CommonTextfield(
//         controller: employmentStatusController,
//         obSecure: false, hintText: "Employed",),
//       const SizedBox(height: 10,),
//
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Means Of Id*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 8,),
//       Center(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10.0,right: 10),
//           child: Container(
//
//             height: 160,
//             padding: const EdgeInsets.all(2),
//             decoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: AppTheme.primaryColor,width: 2)),
//             child: Center(
//               child: InkWell(
//                   onTap: () => pickImage(),
//
//                   // child: image.path != ""
//                   //     ?
//                   //
//                   child: Image.file(
//                   image,
//                     width: size.width,
//                     height: 180,
//                     fit: BoxFit.cover,
//                     errorBuilder: (_, __, ___) =>
//                         const Icon(Icons.add,size: 50,),
//                   )),
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Utility Bill*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 8,),
//       Center(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10.0,right: 10),
//           child: Container(
//
//             height: 160,
//             padding: const EdgeInsets.all(5),
//             decoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: AppTheme.primaryColor,width: 2)),
//             child: Center(
//               child: InkWell(
//                   onTap: () => pickImage1(),
//
//                   // child: image.path != ""
//                   //     ?
//                   //
//                   child: Image.file(
//                     image1,
//                     width: size.width,
//                     height: 180,
//                     fit: BoxFit.cover,
//                     errorBuilder: (_, __, ___) =>
//                         const Icon(Icons.add,size: 50,),
//                   )),
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(height: 10,),
//       Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: Text('Bank Statement*',
//           style: GoogleFonts.poppins(
//               color: const Color(0xFF1D1D1D),
//               fontSize: 15,
//               fontWeight: FontWeight.w500),),
//
//       ),
//       const SizedBox(height: 8,),
//       Center(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10.0,right: 10),
//           child: Container(
//
//             height: 160,
//             padding: const EdgeInsets.all(5),
//             decoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: AppTheme.primaryColor,width: 2)),
//             child: Center(
//               child: InkWell(
//                   onTap: () => pickImage2(),
//
//                   // child: image.path != ""
//                   //     ?
//                   //
//                   child: Image.file(
//                     image2,
//                     width: size.width,
//                     height: 180,
//                     fit: BoxFit.cover,
//                     errorBuilder: (_, __, ___) =>
//                         const Icon(Icons.add,size: 50,),
//                   )),
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(height: 30,),
//       InkWell(
//           onTap: (){
//             if (formKeyprofile.currentState!.validate()) {
//               Map map = <String, String>{};
//               map['currency'] =         currencyController.text.trim();
//               map['accountType'] =      accountTypeController.text.trim();
//               map['countryOfResidence']= countryOfResidenceController.text.trim();
//               map['insurance_number'] = insurance_numberController.text.trim();
//               map['emergency_contact'] =emergency_contactController.text.trim();
//               map['number'] =           acnumberController.text.trim();
//               map['state'] =            stateController.text.trim();
//               map['zip'] =              zipController.text.trim();
//               map['street'] =           streetController.text.trim();
//               map['city'] =             cityController.text.trim();
//               map['type'] =             typeController.text.trim();
//               map['occupation'] =       occupationController.text.trim();
//               map['number'] =           phnumberController.text.trim();
//               map['issuedCountryCode'] =issuedCountryCodeController.text.trim();
//               map['issuedBy'] =         firstNameController.text.trim();
//               map['issuedDate'] =       issuedDateController.text.trim();
//               map['expirationDate'] =   lastNameController.text.trim();
//               map['firstName'] =         registorController.firstNameController.text.trim();
//               map['email'] =         registorController.emailController.text.trim();
//               map['lastName'] =          registorController.lastNameController.text.trim();
//
//               map['birthDate'] =        registorController.dateOfBirthController.text.trim();
//               map['nationality'] =      nationalityController.text.trim();
//               map['incomeBand'] =       incomeBandController.text.trim();
//               map['phone'] =            phoneController.text.trim();
//               map['sourceOfIncome'] =   sourceOfIncomeController.text.trim();
//               map['employmentStatus'] = employmentStatusController.text.trim();
//               map['accountDesignation']= accountDesignationController.text.trim();
//
//
//
//
//
//
//               VritualAccountProfile(
//                 fieldName1: 'meansOfId',
//                 fieldName2: "utilityBill",
//                 fieldName3: "bankStatement",
//                 file2: image1,
//                   file3: image2,
//                 mapData: map,
//                 context: context,
//                 file1: image,
//               ).then((value) {
//                 if (value.success == true) {
//                   showToast(value.message.toString());
//                 }
//                 showToast(value.message.toString());
//               });
//             }
//             // emailLogin();
//             //
//           },
//           child: const CustomOutlineButton(title: "Create Account ",)),
//       const SizedBox(height: 15,),
//
//
//
//
//     ]
//     ))));
//   }
// }
