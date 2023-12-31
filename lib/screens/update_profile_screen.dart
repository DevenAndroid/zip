import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/profile_controller.dart';
import '../repository/update_profile_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final formKeyUpdate = GlobalKey<FormState>();
  File image = File("");

  final profileController = Get.put(ProfileController());
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Field to pick img : $e');
    }
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double doubleVar;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Update Profile",
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
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKeyUpdate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.primaryColor)),
                    child: Center(
                      child: InkWell(
                        onTap: () => pickImage(),
                        child: image.path != ""
                            ? ClipOval(
                                child: Image.file(
                                  image,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  color: AppTheme.secondaryColor,
                                ),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                    imageUrl: profileController
                                        .modal.value.data!.user!.profileImage
                                        .toString(),
                                    placeholder: (context, url) =>
                                        const SizedBox(),
                                    errorWidget: (context, url, error) =>
                                        const SizedBox(),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${profileController.fNameController.text.trim()} ' +
                        ' ${profileController.lNameController.text.trim()}',
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                profileController.zipController.text.trim(),
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
                  controller: profileController.fNameController,
                  obSecure: false,
                  readOnly: true,
                  hintText: "Manish",
                  labelText: "First Name",
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
                  controller: profileController.lNameController,
                  obSecure: false,
                  hintText: "Manish",
                  readOnly: true,
                  labelText: "Last Name",
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
                  // onTap: () async {
                  //   DateTime? pickedDate = await showDatePicker(
                  //     builder: (context, child) {
                  //       return Theme(
                  //         data: Theme.of(context).copyWith(
                  //           colorScheme: ColorScheme.light(
                  //               primary: AppTheme
                  //                   .primaryColor, // header background color
                  //               onPrimary: Colors.white, // header text color
                  //               onSurface:
                  //                   AppTheme.buttonColor // body text color
                  //               ),
                  //           textButtonTheme: TextButtonThemeData(
                  //             style: TextButton.styleFrom(
                  //               foregroundColor:
                  //                   AppTheme.buttonColor, // button text color
                  //             ),
                  //           ),
                  //         ),
                  //         child: child!,
                  //       );
                  //     },
                  //     initialEntryMode: DatePickerEntryMode.calendarOnly,
                  //     context: context,
                  //     initialDate: DateTime.now(),
                  //     firstDate: DateTime(1950),
                  //     //DateTime.now() - not to allow to choose before today.
                  //     lastDate: DateTime.now(),
                  //   );
                  //
                  //   if (pickedDate != null) {
                  //     print(
                  //         pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  //     String formattedDate =
                  //         DateFormat('yyyy-MM-dd').format(pickedDate);
                  //     print(
                  //         formattedDate); //formatted date output using intl package =>  2021-03-16
                  //     setState(() {
                  //       profileController.dobController.text =
                  //           formattedDate; //set output date to TextField value.
                  //     });
                  //   } else {}
                  // },
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [maskFormatter],
                  onChanged: (value) => doubleVar = double.parse(value),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Please enter your DOB  '),
                  ]),
                  controller: profileController.dobController,
                  readOnly: true,
                  obSecure: false,
                  hintText: "DOB",
                  labelText: "Date of Birth",
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
                  readOnly: true,
                  controller: profileController.emailController,
                  obSecure: false,

                  hintText: "Manish@gmail.com",
                  labelText: "Email",
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
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
                        'Please enter minumum  11 digit number'),
                    MaxLengthValidator(12,
                        errorText:
                        'Please enter 12 digit number'),
                    PatternValidator(
                        r'(^(?:[+0]9)?[0-9]{10,12}$)',
                        errorText: '')
                  ]),
                  readOnly: true,
                  controller: profileController.mobileController,
                  obSecure: false,
                  hintText: "7665096245",
                  labelText: "Mobile no ",
                  // labelText: "Mobile Number",
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
                  readOnly: true,
                  controller: profileController.zipController,
                  obSecure: false,
                  hintText: "Manish@zip",
                  labelText: "Zip Tag",
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){
                      Get.toNamed(MyRouters.updatePassword);
                    },
                    child: Text(
                      "Change Password",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              InkWell(
                onTap: () {
                  // Get.toNamed(MyRouters.accountsInBank);
                  if (formKeyUpdate.currentState!.validate()) {
                    Map map = <String, String>{};
                    map['first_name'] =
                        profileController.fNameController.text.trim();
                    map['last_name'] =
                        profileController.lNameController.text.trim();

                    map['dob'] = profileController.dobController.text.trim();
                    map['phone'] = profileController.mobileController.text.trim();
                    map['email'] = profileController.emailController.text.trim();

                    UpdateProfileRepo(
                      fieldName1: 'profile_image',
                      mapData: map,
                      context: context,
                      file1: image,
                    ).then((value) {
                      if (value.status == true) {
                        profileController.getData();
                      }
                      showToast(value.message.toString());
                    });

                    // Get.toNamed(MyRouters.doctorNavbar);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, right: 8),
                  child: CustomOutlineButton(
                    title: "Update",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
