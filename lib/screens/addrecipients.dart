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

  Rx<RxStatus> statusOfProviders= RxStatus.empty().obs;
  TextEditingController phoneController = TextEditingController();
  Rx<ModelSearchTag> purchaseData = ModelSearchTag().obs;

  getProviderList() {

    searchRepo(
     keyword:
    ).then((value) {
      log("response.body.....    ${value}");
      purchaseData.value = value;
      if (value.success == true) {
        statusOfProviders.value = RxStatus.success();
        showToast(value.message.toString());

      } else {
        statusOfProviders.value = RxStatus.error();
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
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Zip Account Details",
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
                obSecure: false,
                hintText: "@",
                labelText: "ZIP Tag",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                obSecure: false,
                hintText: "Email",
                labelText: "Enter Email",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                obSecure: false,
                hintText: "Phone",
                labelText: "Enter Phone no ",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: size.height * .33,
            ),
            InkWell(
              onTap: () {
                // Get.toNamed(MyRouters.sendCash);
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
