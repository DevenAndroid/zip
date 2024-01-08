import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/profile_controller.dart';
import '../models/model_search.dart';
import '../models/model_search_zip.dart';
import '../repository/serach_repo.dart';
import '../repository/zip_search_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class RequestMoney2 extends StatefulWidget {
  const RequestMoney2({Key? key}) : super(key: key);

  @override
  State<RequestMoney2> createState() => _RequestMoney2State();
}

class _RequestMoney2State extends State<RequestMoney2> {
  Rx<RxStatus> statusOfSearch = RxStatus.empty().obs;

  final profileController = Get.put(ProfileController());
  Rx<ModelSearchZip> searchZip = ModelSearchZip().obs;
  final formKey4 = GlobalKey<FormState>();

  getSearchList() {
    zipSearchRepo(
      zip_tag: profileController.requestZiptag1Controller.text.trim() + "@zip",
      context: context,
    ).then((value) {
      log("response.body.....    ${value}");
      searchZip.value = value;
      if (value.status == true) {
        statusOfSearch.value = RxStatus.success();
        showToast(value.message.toString());
        profileController.requestNameController.text =
            "${value.data!.fname.toString()} " +
                "${value.data!.lname.toString()}";
        profileController.requestPhoneController.text =
            (value.data!.phone ?? "").toString();
        profileController.requestZiptag1Controller.text =
            (value.data!.zipTag ?? "").toString();
        profileController.requestemailController.text =
            (value.data!.email ?? "").toString();
        // profileController.zipUserController.text = (value.data!.id??"").toString()
        profileController.userId = value.data!.id.toString();

        print(value.data!.email.toString());
      } else {
        statusOfSearch.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }
        // showToast(value.message.toString());
        );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Request Money ",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.toNamed(MyRouters.bottomNavbar);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {},
                        child: const CustomOutlineButton(
                          title: "Add Manually",
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Get.toNamed(MyRouters.requestPayment4);
                    },
                    child: CustomOutlineBoder(
                      title: "Search Zip User",
                      backgroundColor: Colors.white,
                      textColor: AppTheme.buttonColor,
                      onPressed: () {},
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  "Search Zip Tag",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF2E2E2E),
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Please enter ZipTag '),
                  ]),
                  suffixIcon: InkWell(
                      onTap: () {
                        getSearchList();
                      },
                      child: Icon(Icons.arrow_forward)),
                  controller: profileController.requestZiptag1Controller,
                  obSecure: false,
                  hintText: "Zip Tag ",
                  labelText: "Zip Tag ",
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Please enter Name '),
                  ]),
                  readOnly: true,
                  controller: profileController.requestNameController,
                  obSecure: false,
                  hintText: "Piyush",
                  labelText: "Name",
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: CommonTextfield(
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Please enter Phone '),
                  ]),
                  readOnly: true,
                  controller: profileController.requestPhoneController,
                  obSecure: false,
                  hintText: "695659606u69u06u",
                  labelText: "Phone",
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              InkWell(
                  onTap: () {
                    profileController.requestNameController.text = "";
                    profileController.requestPhoneController.text = "";
                    profileController.requestZiptag1Controller.text = "";
                  },
                  child: CustomOutlineBoder(title: "Clear")),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  if (formKey4.currentState!.validate()) {
                    Get.toNamed(MyRouters.yourBalanceScreen);
                  }
                },
                child: const CustomOutlineButton(
                  title: "Continue",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
