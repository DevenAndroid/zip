import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class CreateRecipients extends StatefulWidget {
  const CreateRecipients({Key? key}) : super(key: key);

  @override
  State<CreateRecipients> createState() => _CreateRecipientsState();
}

class _CreateRecipientsState extends State<CreateRecipients> {

  Rx<RxStatus> statusOfSearch= RxStatus.empty().obs;
  TextEditingController phone1Controller = TextEditingController();
  Rx<ModelSearchTag> searchData = ModelSearchTag().obs;
  TextEditingController ziptag1Controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final profileController = Get.put(ProfileController());

  getSearchList() {

    searchRepo(
      email: nameController.text.trim(),
      phone:phone1Controller.text.trim() ,
      zip_tag: ziptag1Controller.text.trim()+"@zip",
      context: context,

    ).then((value) {
      log("response.body.....    ${value}");
      searchData.value = value;
      if (value.status == true) {
        statusOfSearch.value = RxStatus.success();
        showToast(value.message.toString());
        nameController.text = "${value.data!.fname.toString()} "+"${value.data!.lname.toString()}";
        phone1Controller.text =( value.data!.phone??"").toString();
        ziptag1Controller.text = (value.data!.zipTag??"").toString();
        profileController.userId=searchData.value.data!.id.toString();

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
                        Get.toNamed(MyRouters.addRecipients);
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
              padding: const EdgeInsets.only(left: 25,right: 25),
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
                suffixIcon: InkWell(
                    onTap: (){
                      getSearchList();
                    },
                    child: Icon(Icons.arrow_forward)),


                controller: ziptag1Controller,
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
                readOnly: true,
                controller: nameController,
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
                readOnly: true,
                controller: phone1Controller,
                obSecure: false,
                hintText: "695659606u69u06u",
                labelText: "Phone",
              ),
            ),
            SizedBox(
              height: size.height * .27,
            ),
            InkWell(
                onTap: (){

                  nameController.text="";
                  phone1Controller.text="";
                  ziptag1Controller.text="";
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
