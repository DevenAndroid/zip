import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/buy_plan_model.dart';
import '../models/save_transastion_model.dart';
import '../repository/repo_buy_plan.dart';
import '../repository/save_buy_plan_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final registorController = Get.put(registerController());
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      registorController.fetchVritualAccount();
    });
  }

  Rx<RxStatus> statusOfProviders = RxStatus.empty().obs;
  TextEditingController phoneController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  Rx<ModelBuy> purchaseData = ModelBuy().obs;
  var initStateBlank = Get.arguments[0];
  var initStateBlank1 = Get.arguments[1];
  var initStateBlank2 = Get.arguments[2];
  Rx<RxStatus> statusOfSave = RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;

  saveList() {
    saveTransastionRepo(
            user_id: profileController.modal.value.data!.user!.id.toString(),
            amount: initStateBlank1,
            about: "Buy Airtime",
            // complete_response: purchaseData.value.data!.toJson(),
            context: context,
            description: descriptionController.text.trim(),
            type: "dr")
        .then((value) {
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
    BuyPlanRepo(
      telco: initStateBlank,
      amount: initStateBlank1,
      phone_no: registorController.phoneController1.text.trim(),
      reference:
          registorController.fetchAccount.value.data!.accountNumber.toString() +
              "_" +
              DateTime.now().millisecondsSinceEpoch.toString(),
    ).then((value) {
      log("response.body.....    ${value}");
      purchaseData.value = value;
      if (value.success == true) {
        saveList();
        statusOfProviders.value = RxStatus.success();
        showToast(value.message.toString());
        print(
          registorController.fetchAccount.value.data!.accountNumber.toString() +
              DateTime.now().millisecondsSinceEpoch.toString(),
        );
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
                controller: phoneController,
                obSecure: false,
                hintText: "123456789",
                labelText: "Phone Number",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Description",
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
                controller: descriptionController,
                obSecure: false,
                hintText: "Recharge",
                labelText: "Description",
              ),
            ),
            SizedBox(
              height: size.height * .5,
            ),
            InkWell(
              onTap: () {
                getProviderList();
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
