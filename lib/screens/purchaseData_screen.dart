import 'dart:developer';

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
import '../models/save_transastion_model.dart';
import '../models/service_buy_model.dart';
import '../repository/save_buy_plan_repo.dart';
import '../repository/service_buy_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class PurchaseDataScreen extends StatefulWidget {
  const PurchaseDataScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseDataScreen> createState() => _PurchaseDataScreenState();
}

class _PurchaseDataScreenState extends State<PurchaseDataScreen> {
  final registorController = Get.put(registerController());
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      registorController.fetchVritualAccount();
    });
    profileController.amount.text = initStateBlank.toString();
    profileController.getCurrentBalance();
  }

  Rx<RxStatus> statusOfProviders = RxStatus.empty().obs;

  Rx<ServiceBuyModel> purchaseInternet = ServiceBuyModel().obs;

  var initStateBlank = Get.arguments[0];
  var initStateBlank1 = Get.arguments[1];
  var initStateBlank2 = Get.arguments[2];

  Rx<RxStatus> statusOfSave = RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;

  saveList() {
    saveTransastionRepo(
            user_id: profileController.modal.value.data!.user!.id.toString(),
            amount: registorController.result3.toString(),
            about: "Buy Internet",
            // complete_response: purchaseData.value.data!.toJson(),
            context: context,
            description: profileController.descriptionController.text.trim(),
            type: "dr",
            data_code: initStateBlank1.toString(),
            telcos: initStateBlank2.toString(),
            phone: profileController.phoneController.text.trim(),
            dataplan: initStateBlank2.toString())
        .then((value) {
      log("response.body.....    $value");
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

  getInterNet() {
    commonBuyRepo(
      context: context,
      phone: profileController.phoneController.text.trim(),
      amount: initStateBlank.toString(),
      data_code: initStateBlank1.toString(),
      telcos: initStateBlank2.toString(),
      key: "pay",
      billersCode: "08011111111",
      serviceID: initStateBlank2,
      variation_code: initStateBlank1,
    ).then((value) {
      log("response.body.....    $value");
      purchaseInternet.value = value;
      if (value.status == true) {
        // saveList();
        Get.toNamed(MyRouters.successRechargeScreen);
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
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone number ",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF2E2E2E),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "FEE : " +
                        profileController
                            .currentBalanceModel.value.data!.fee!.serviceFee
                            .toString(),
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                  FilteringTextInputFormatter.allow(RegExp('[0-9]+\\.?[0-9]*')),
                ],
                onChanged: (value) {
                  // _addNumbers();
                },
                validator: MultiValidator([
                  RequiredValidator(
                      errorText: 'Please enter your contact number '),
                  MinLengthValidator(11,
                      errorText: 'Please enter minumum  11 digit number'),
                  MaxLengthValidator(11,
                      errorText: 'Please enter 11 digit number'),
                  PatternValidator(r'(^(?:[+0]9)?[0-9]{10,12}$)', errorText: '')
                ]),
                controller: profileController.phoneController,
                obSecure: false,
                hintText: "123456789",
                labelText: "Phone Number",
              ),
            ),
            const SizedBox(
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
                controller: profileController.descriptionController,
                obSecure: false,
                onChanged: (value) {
                  // _addNumbers();
                },
                hintText: "Recharge",
                labelText: "Description",
              ),
            ),
            SizedBox(
              height: size.height * .5,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                if (pref.getBool('TransistionPin') == true) {
                  // _addNumbers();
                  Get.toNamed(MyRouters.dataPurchasePin, arguments: [
                    initStateBlank,
                    initStateBlank1,
                    initStateBlank2
                  ]);
                } else {
                  // _addNumbers();
                  getInterNet();
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
  // void _addNumbers() {
  //   // Get the input values as strings
  //   String firstNumberString = profileController.amount.text.toString();
  //   String secondNumberString =   profileController
  //       .currentBalanceModel.value.data!.fee!.serviceFee
  //       .toString();
  //
  //   // Check if both inputs are not empty
  //   if (firstNumberString.isNotEmpty && secondNumberString.isNotEmpty) {
  //     // Convert strings to integers
  //     int firstNumber = int.parse(firstNumberString);
  //     int secondNumber = int.parse(secondNumberString);
  //
  //     // Perform addition
  //     int sum = firstNumber + secondNumber;
  //     print(registorController.result3.toString());
  //     // Convert the result back to a string and update the UI
  //     setState(() {
  //       registorController.result3 = sum.toString();
  //       print(registorController.result3.toString());
  //     });
  //   } else {
  //     // Handle the case when one or both of the inputs are empty
  //     setState(() {
  //       registorController.result2 = 'Please enter valid numbers';
  //     });
  //   }
  // }
}
