import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';


import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/buy_cabel_model.dart';
import '../models/buy_plan_model.dart';
import '../models/save_transastion_model.dart';
import '../repository/buy_cabel_repo.dart';
import '../repository/repo_buy_plan.dart';
import '../repository/save_buy_plan_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class CabelScreen extends StatefulWidget {
  const CabelScreen({Key? key}) : super(key: key);

  @override
  State<CabelScreen> createState() => _CabelScreenState();
}

class _CabelScreenState extends State<CabelScreen> {
  final registorController = Get.put(registerController());
  final profileController = Get.put(ProfileController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      registorController.fetchVritualAccount();});
  }
  Rx<RxStatus> statusOfProviders= RxStatus.empty().obs;

  Rx<BuyCabelTvModel> buyCabelTv = BuyCabelTvModel().obs;
  var initStateBlank = Get.arguments[0];
  var initStateBlank1 = Get.arguments[1];
  var initStateBlank2 = Get.arguments[2];
  var initStateBlank3 = Get.arguments[3];
  var initStateBlank4 = Get.arguments[4];
  var initStateBlank5 = Get.arguments[5];
  Rx<RxStatus> statusOfSave= RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;

  saveList() {
    saveTransastionRepo(
      user_id: initStateBlank5,
      amount:initStateBlank1,
      about: "Buy Cable Tv",
      // complete_response: purchaseData.value.data!.toJson(),
      context: context,
      description:profileController.description2Controller.text.trim(),
      telcos: initStateBlank,
      data_code: initStateBlank3,
      dataplan:initStateBlank2,
      type: "dr",
      phone: initStateBlank4,
    ).then((value) {
      log("response.body.....    ${value}");
      save.value = value;
      if (value.status == true) {
        statusOfSave.value = RxStatus.success();
        Get.toNamed(MyRouters.successRechargeScreen);

      } else {
        statusOfSave.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }
  getProviderList() {
    print(initStateBlank);
    print(initStateBlank1);
    BuyCabelRepo(
      amount: initStateBlank1,
      serviceID:  initStateBlank2,
      variation_code:  initStateBlank3,
      subscription_type:  initStateBlank,
      context: context,
      billersCode:initStateBlank4,
phone:profileController.modal.value.data!.user!.phone.toString() ,
key: "pay"
      // reference: profileController.description2Controller.text.trim(),
    ).then((value) {
      log("response.body.....    ${value}");
      buyCabelTv.value = value;
      if (value.status == true) {
        saveList();
        statusOfProviders.value = RxStatus.success();
        showToast(value.message.toString());
        // print(  registorController.fetchAccount.value.data!.accountNumber.toString()+DateTime.now().millisecondsSinceEpoch.toString(),);
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
    double doubleVar;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Purchase",
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
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Phone number ",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF2E2E2E),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
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
                      'Please enter your card number '),
                  MinLengthValidator(11,
                      errorText:
                      'Please enter minumum  10 card number'),
                  MaxLengthValidator(12,
                      errorText:
                      'Please enter 12 card number'),
                  PatternValidator(
                      r'(^(?:[+0]9)?[0-9]{10,12}$)',
                      errorText: '')
                ]),

                obSecure: false,
                hintText: initStateBlank4,
                // labelText: "",
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Reference",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF2E2E2E),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                controller: profileController.description2Controller,
                obSecure: false,
                hintText: "Recharge",
                labelText: "Reference",
              ),
            ),

            SizedBox(
              height: size.height * .5,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                if (pref.getBool('TransistionPin') == true) {
                  Get.toNamed(MyRouters.cabelTvPin,arguments: [initStateBlank,initStateBlank1,initStateBlank2,initStateBlank3]);
                }
                else{
                  getProviderList();
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
