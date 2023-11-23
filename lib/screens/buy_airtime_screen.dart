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
import '../models/buy_plan_model.dart';
import '../models/model_fetch_telcos.dart';
import '../models/save_transastion_model.dart';
import '../repository/fetch_telcos_repo.dart';
import '../repository/repo_buy_plan.dart';
import '../repository/save_buy_plan_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';
import '../widgets/common_textfield.dart';

class BuyAirtimeScreen extends StatefulWidget {
  const BuyAirtimeScreen({Key? key}) : super(key: key);

  @override
  State<BuyAirtimeScreen> createState() => _BuyAirtimeScreenState();
}

class _BuyAirtimeScreenState extends State<BuyAirtimeScreen> {
  final profileController = Get.put(ProfileController());
  final registorController = Get.put(registerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      registorController.fetchVritualAccount();
    });
  }

  Rx<RxStatus> statusOfProviders = RxStatus.empty().obs;
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController amountController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  Rx<ModelBuy> purchaseData = ModelBuy().obs;

  Rx<RxStatus> statusOfSave = RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;
  var initStateBlank = Get.arguments[0];
  var initStateBlank1 = Get.arguments[1];
  var initStateBlank2 = Get.arguments[2];
  var initStateBlank3 = Get.arguments[3];
  saveList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var uniqueIdentifier = pref.getString("uniqueIdentifier");
    saveTransastionRepo(
        user_id: initStateBlank,
        amount: initStateBlank1,
        about: "Buy Airtime",
        // complete_response: purchaseData.value.data!.toJson(),
        context: context,
        description: initStateBlank2,
           telcos: initStateBlank2,
        phone: initStateBlank3,

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
  final formKey4 = GlobalKey<FormState>();

  getProviderList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var uniqueIdentifier = pref.getString("uniqueIdentifier");
    if (pref.getBool('TransistionPin') == true) {
      Get.toNamed(MyRouters.sucessRechargePin);
    }
    else{

        BuyPlanRepo(
          telco: initStateBlank2,
          amount: initStateBlank1,
          phone_no: initStateBlank3,
          reference:
          registorController.fetchAccount.value.data!.accountNumber.toString() +
              DateTime
                  .now()
                  .millisecondsSinceEpoch
                  .toString(),
        ).then((value) {
          log("response.body.....    ${value}");
          purchaseData.value = value;
          if (value.success == true) {
            saveList();
            statusOfProviders.value = RxStatus.success();
            showToast(value.message.toString());
            print(
              registorController.fetchAccount.value.data!.accountNumber.toString() +
                  DateTime
                      .now()
                      .millisecondsSinceEpoch
                      .toString(),
            );
          } else {
            statusOfProviders.value = RxStatus.error();
            showToast(value.message.toString());
          }
        }
          // showToast(value.message.toString());
        );
      }}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double doubleVar;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
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
                          // onTap: () {
                          //   // Get.toNamed(MyRouters.buyAirtimecreen);
                          // },
                          // suffixIcon: Icon(Icons.keyboard_arrow_down),

                          readOnly: true,
                          obSecure: false,
                          hintText: initStateBlank2,

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
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(11),
                            FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                          ],
                          onChanged: (value) => doubleVar = double.parse(value),
                          validator: RequiredValidator(
                            errorText: "please enter your phone no "
                          ),

                          // validator: MultiValidator([
                          //   RequiredValidator(
                          //       errorText: 'Please enter your meter number '),
                          //   MinLengthValidator(10,
                          //       errorText: 'Please enter minumum  10  number'),
                          //   MaxLengthValidator(12,
                          //       errorText: 'Please enter 12  number'),
                          //   PatternValidator(r'(^(?:[+0]9)?[0-9]{10,12}$)',
                          //       errorText: '')
                          // ]),

                          obSecure: false,
                          readOnly: true,
                          hintText: initStateBlank3,

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Amount ",
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
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                          ],
                          onChanged: (value) => doubleVar = double.parse(value),
                       validator: MultiValidator([
                         RequiredValidator(
                             errorText: 'Please enter your amount'),
                       ]),

                          obSecure: false,
                          hintText: initStateBlank1,

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
}
