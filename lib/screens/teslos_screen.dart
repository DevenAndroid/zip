import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/model_airtime.dart';
import '../models/save_transastion_model.dart';
import '../repository/airtime_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_textfield.dart';

class TelcosScreen extends StatefulWidget {
  const TelcosScreen({Key? key}) : super(key: key);

  @override
  State<TelcosScreen> createState() => _TelcosScreenState();
}

class _TelcosScreenState extends State<TelcosScreen> {
  final profileController = Get.put(ProfileController());
  final registorController = Get.put(registerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      registorController.fetchVritualAccount();
    });
    profileController.getCurrentBalance();
  }

  Rx<RxStatus> statusOfProviders = RxStatus.empty().obs;

  // TextEditingController phoneController = TextEditingController();
  // TextEditingController amountController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  Rx<AirtimeModel> purchaseData = AirtimeModel().obs;

  Rx<RxStatus> statusOfSave = RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;

  saveList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var uniqueIdentifier = pref.getString("uniqueIdentifier");
    saveTransastionRepo(
            user_id: profileController.modal.value.data!.user!.id.toString(),
            amount: registorController.result.toString(),
            about: "Buy Airtime",
            // complete_response: purchaseData.value.data!.toJson(),
            context: context,
            telcos: profileController.airtimeController.text.trim(),
            phone: registorController.phoneController1.text.trim(),
            description: registorController
                    .fetchAccount.value.data!.accountNumber
                    .toString() +
                DateTime.now().millisecondsSinceEpoch.toString(),
            type: "dr")
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

  final formKey4 = GlobalKey<FormState>();

  getProviderList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var uniqueIdentifier = pref.getString("uniqueIdentifier");
    if (pref.getBool('TransistionPin') == true) {
      Get.toNamed(MyRouters.sucessRechargePin);
    } else {
      airtimeRepo(
        key: "pay",
        context: context,
        amount: registorController.amountController1.text.toString(),
        phone: registorController.phoneController1.text.trim(),
        serviceID: profileController.serviceController.text.trim(),
        telcos: profileController.airtimeController.text.trim(),
        // reference:
        //     registorController.fetchAccount.value.data!.accountNumber.toString() +
        //         DateTime.now().millisecondsSinceEpoch.toString(),
      ).then((value) {
        log("response.body.....    $value");
        purchaseData.value = value;
        if (value.status == true) {
          // saveList();
          Get.toNamed(MyRouters.successRechargeScreen);
          statusOfProviders.value = RxStatus.success();
          showToast(value.message.toString());
          print(
            registorController.fetchAccount.value.data!.accountNumber
                    .toString() +
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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double doubleVar;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.grey.shade300,
              height: 1.0,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.toNamed(MyRouters.bottomNavbar);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
          title: Text(
            "Buy Airtime",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Form(
          key: formKey4,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextfield(
                      onTap: () {
                        Get.toNamed(MyRouters.buyAirtimecreen);
                      },
                      suffixIcon: Icon(Icons.keyboard_arrow_down),
                      controller: profileController.airtimeController,
                      readOnly: true,
                      obSecure: false,
                      hintText: "",
                      labelText: "Select Provider",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
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
                    CommonTextfield(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9]+\\.?[0-9]*')),
                      ],
                      onChanged: (value) => doubleVar = double.parse(value),
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Please enter your phone number '),
                        MinLengthValidator(10,
                            errorText: 'Please enter minumum  10  number'),
                        MaxLengthValidator(12,
                            errorText: 'Please enter 12  number'),
                        PatternValidator(r'(^(?:[+0]9)?[0-9]{10,12}$)',
                            errorText: '')
                      ]),
                      controller: registorController.phoneController1,
                      obSecure: false,
                      hintText: "123456789",
                      labelText: "Phone Number",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Amount",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF2E2E2E),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "FEE : ${profileController.currentBalanceModel.value.data!.fee!.serviceFee}",
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
                    CommonTextfield(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[0-9]+\\.?[0-9]*')),
                      ],
                      onChanged: (value) {
                        // _addNumbers();
                      },
                      validator: MultiValidator([
                        RangeValidator(
                            min: 0,
                            max: profileController
                                .currentBalanceModel.value.data!.currentBalance!
                                .toInt(),
                            errorText:
                                "Can't add more than${profileController.currentBalanceModel.value.data!.currentBalance}"),
                        RequiredValidator(
                            errorText: 'Please enter your amount'),
                      ]),
                      controller: registorController.amountController1,
                      obSecure: false,
                      hintText: "0",
                      labelText: "Amount",
                    ),
                    SizedBox(
                      height: size.height * .26,
                    ),
                    InkWell(
                      onTap: () {
                        if (formKey4.currentState!.validate()) {
                          getProviderList();
                        }
                      },
                      child: const CustomOutlineButton(
                        title: "Continue",
                      ),
                    ),
                  ])),
        )));
  }

  void _addNumbers() {
    // Get the input values as strings
    String firstNumberString = registorController.amountController1.text;
    String secondNumberString = profileController
        .currentBalanceModel.value.data!.fee!.serviceFee
        .toString();

    // Check if both inputs are not empty
    if (firstNumberString.isNotEmpty && secondNumberString.isNotEmpty) {
      // Convert strings to integers
      int firstNumber = int.parse(firstNumberString);
      int secondNumber = int.parse(secondNumberString);

      // Perform addition
      int sum = firstNumber + secondNumber;

      // Convert the result back to a string and update the UI
      setState(() {
        registorController.result = sum.toString();
        print(registorController.result.toString());
      });
    } else {
      // Handle the case when one or both of the inputs are empty
      setState(() {
        registorController.result = 'Please enter valid numbers';
      });
    }
  }
}
