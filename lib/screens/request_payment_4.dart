import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/profile_controller.dart';
import '../models/model_search.dart';
import '../repository/serach_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class RequestPayment4 extends StatefulWidget {
  const RequestPayment4({Key? key}) : super(key: key);

  @override
  State<RequestPayment4> createState() => _RequestPayment4State();
}

class _RequestPayment4State extends State<RequestPayment4> {
  Rx<RxStatus> statusOfSearch = RxStatus.empty().obs;
  TextEditingController phoneController = TextEditingController();
  Rx<ModelSearchTag> searchData = ModelSearchTag().obs;
  TextEditingController ziptagController = TextEditingController();
  TextEditingController email1Controller = TextEditingController();
  final profileController = Get.put(ProfileController());
  final formKey4 = GlobalKey<FormState>();

  getSearchList() {
    searchRepo(
      email: email1Controller.text.trim(),
      phone: phoneController.text.trim(),
      zip_tag: ziptagController.text.trim() + "@zip",
      context: context,
    ).then((value) {
      log("response.body.....    ${value}");
      searchData.value = value;
      if (value.status == true) {
        statusOfSearch.value = RxStatus.success();
        showToast(value.message.toString());
        email1Controller.text = (value.data!.email ?? "").toString();
        phoneController.text = (value.data!.phone ?? "").toString();
        ziptagController.text = (value.data!.zipTag ?? "").toString();
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
                  onTap: () {
                    Get.toNamed(MyRouters.requestMoney2);
                  },
                  child: CustomOutlineBoder(
                    title: "Add Manually",
                    backgroundColor: Colors.white,
                    textColor: AppTheme.buttonColor,
                    onPressed: () {},
                  ),
                )),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {},
                      child: const CustomOutlineButton(
                        title: "Search zip user",
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Search user by email or phone",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF2E2E2E),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Please enter Ziptag '),
                ]),
                controller: ziptagController,
                obSecure: false,
                hintText: "@",
                labelText: "ZIP Tag",
                suffixIcon: InkWell(
                    onTap: () {
                      getSearchList();
                    },
                    child: const Icon(Icons.arrow_forward)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Please enter email '),
                ]),
                controller: email1Controller,
                obSecure: false,
                hintText: "Email",
                labelText: "Enter Email",
                suffixIcon: InkWell(
                    onTap: () {
                      getSearchList();
                    },
                    child: const Icon(Icons.arrow_forward)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Please enter Phone '),
                ]),
                controller: phoneController,
                obSecure: false,
                hintText: "Phone",
                labelText: "Enter Phone no ",
                suffixIcon: InkWell(
                    onTap: () {
                      getSearchList();
                    },
                    child: const Icon(Icons.arrow_forward)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: size.height * .03,
            ),
            InkWell(
                onTap: () {
                  email1Controller.text = "";
                  phoneController.text = "";
                  ziptagController.text = "";
                },
                child: const CustomOutlineBoder(title: "Clear")),
            const SizedBox(
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
    );
  }
}
