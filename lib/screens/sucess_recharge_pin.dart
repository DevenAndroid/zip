import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/buy_plan_model.dart';
import '../models/model_airtime.dart';
import '../models/model_security_pin.dart';
import '../models/save_transastion_model.dart';
import '../repository/airtime_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../repository/security_pin_repo].dart';
import '../resourses/api_constant.dart';

class SucessRechargePin extends StatefulWidget {
  const SucessRechargePin({Key? key}) : super(key: key);

  @override
  State<SucessRechargePin> createState() => _SucessRechargePinState();
}

class _SucessRechargePinState extends State<SucessRechargePin> {
  final profileController = Get.put(ProfileController());
  final controller = Get.put(registerController());

  final formKeypin = GlobalKey<FormState>();

  TextEditingController otpcontroller = TextEditingController();
  Rx<RxStatus> statusOfProviders = RxStatus.empty().obs;
  Rx<ModelSecurityPin> modelVerifySecurity = ModelSecurityPin().obs;
  Rx<RxStatus> statusOfSucess = RxStatus.empty().obs;
  Rx<ModelBuy> purchaseData = ModelBuy().obs;
  Rx<RxStatus> statusOfSave = RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;
  Rx<AirtimeModel> purchaseData1 = AirtimeModel().obs;

  saveList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var uniqueIdentifier = pref.getString("uniqueIdentifier");
    saveTransastionRepo(
            user_id: profileController.modal.value.data!.user!.id.toString(),
            amount: controller.result.toString(),
            about: "Buy Airtime",
            // complete_response: purchaseData.value.data!.toJson(),
            context: context,
            description:
                controller.fetchAccount.value.data!.accountNumber.toString() +
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

  verify() {
    securityPinRepo(context: context, pin: otpcontroller.text.trim())
        .then((value) {
      modelVerifySecurity.value = value;
      if (value.status == true) {
        airtimeRepo(
          context: context,
          key: "pay",
          amount: controller.amountController1.text.toString(),
          phone: controller.phoneController1.text.trim(),
          serviceID: profileController.serviceController.text.trim(),
          telcos: profileController.airtimeController.text.trim(),

          // reference:
          //     registorController.fetchAccount.value.data!.accountNumber.toString() +
          //         DateTime.now().millisecondsSinceEpoch.toString(),
        ).then((value) {
          log("response.body.....    $value");
          purchaseData1.value = value;
          if (value.status == true) {
            // saveList();
            Get.toNamed(MyRouters.successRechargeScreen);
            statusOfProviders.value = RxStatus.success();
            showToast(value.message.toString());
          } else {
            statusOfProviders.value = RxStatus.error();
            showToast(value.message.toString());
          }
        }
            // showToast(value.message.toString());
            );
        statusOfSucess.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfSucess.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });

    // if(value.status=="success"){
    //   statusOfChooseBank.value.isSuccess;
    // }
    // Get.toNamed(MyRouters.bottomNavbar);
  }

  getCheckValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.getBool(
      'TransistionPin',
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getCheckValue(
    //
    // );
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 56,
        height: 56,
        textStyle: const TextStyle(
          fontSize: 22,
          color: Color.fromRGBO(30, 60, 87, 1),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: AppTheme.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(10)));
    Size size = MediaQuery.of(context).size;
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
          centerTitle: true,
          title: Text(
            "Verify Pin",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: formKeypin,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Enter your unique 4-digits pin for transition",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "Please remember this pin. It’ll be used to keep your account secure ",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Center(
                        child: Pinput(
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Enter 4 Digit Pin')
                          ]),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          controller: otpcontroller,
                          keyboardType: TextInputType.number,
                          length: 4,
                          defaultPinTheme: defaultPinTheme,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .5,
                    ),
                    InkWell(
                      onTap: () {
                        if (formKeypin.currentState!.validate()) {
                          verify();
                        }
                      },
                      child: CustomOutlineBoder(
                        title: "Next",
                        backgroundColor: Colors.white,
                        textColor: AppTheme.buttonColor,
                        onPressed: () {
                          Get.toNamed(MyRouters.otpScreen);
                        },
                      ),
                    )
                  ])),
        )));
  }
}
