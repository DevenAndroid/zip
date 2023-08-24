import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';


import '../models/model_search.dart';
import '../repository/serach_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class AddRecipients extends StatefulWidget {
  const AddRecipients({Key? key}) : super(key: key);

  @override
  State<AddRecipients> createState() => _AddRecipientsState();
}

class _AddRecipientsState extends State<AddRecipients> {

  Rx<RxStatus> statusOfSearch= RxStatus.empty().obs;
  TextEditingController phoneController = TextEditingController();
  Rx<ModelSearchTag> searchData = ModelSearchTag().obs;
  TextEditingController ziptagController = TextEditingController();
  TextEditingController email1Controller = TextEditingController();


  getSearchList() {

    searchRepo(
      email: email1Controller.text.trim(),
     phone:phoneController.text.trim() ,
     zip_tag: ziptagController.text.trim()+"@zip",
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
          "Send Money ",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
           Get.back();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search,color: Colors.black,),
          )
        ],
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
                    Get.toNamed(MyRouters.createRecipients);
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
              padding: const EdgeInsets.only(left: 20,right: 20),
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
                controller: ziptagController,
                obSecure: false,
                hintText: "@",
                labelText: "ZIP Tag",
                suffixIcon: InkWell(
                    onTap: (){
                      getSearchList();
                    },
                    child: Icon(Icons.arrow_forward)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                controller: email1Controller,
                obSecure: false,
                hintText: "Email",
                labelText: "Enter Email",
                suffixIcon: InkWell(
                    onTap: (){
                      getSearchList();
                    },
                    child: Icon(Icons.arrow_forward)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                controller: phoneController,
                obSecure: false,
                hintText: "Phone",
                labelText: "Enter Phone no ",
                suffixIcon: InkWell(
                    onTap: (){
                      getSearchList();
                    },
                    child: Icon(Icons.arrow_forward)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: size.height * .27,
            ),
            InkWell(
                onTap: (){
                  email1Controller.text="";
                  phoneController.text="";
                  ziptagController.text="";
                },
                child: CustomOutlineBoder(title: "Clear")),
            SizedBox(height: 25,),
            InkWell(
              onTap: () {

                Get.toNamed(MyRouters.yourBalanceScreen);
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
