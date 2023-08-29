
import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_colour.dart';


import '../controller/number_controller.dart';
import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/buy_energy_model.dart';
import '../models/buy_plan_model.dart';
import '../models/model_security_pin.dart';
import '../models/model_setting.dart';
import '../models/model_verify_africa.dart';
import '../models/model_veryfy_meter.dart';
import '../models/save_transastion_model.dart';
import '../models/verify_africa.dart';
import '../repository/buy_energy_repo.dart';
import '../repository/repo_buy_plan.dart';
import '../repository/save_buy_plan_repo.dart';
import '../repository/security_pin_repo].dart';
import '../repository/setting_repo.dart';
import '../repository/verify_africa_b.dart';
import '../repository/verify_meter_repo.dart';
import '../resourses/api_constant.dart';

import '../controller/update_user.dart';


class PurchaseRechargePin extends StatefulWidget {
  const PurchaseRechargePin({Key? key}) : super(key: key);

  @override
  State<PurchaseRechargePin> createState() => _PurchaseRechargePinState();
}

class _PurchaseRechargePinState extends State<PurchaseRechargePin> {
  final profileController = Get.put(ProfileController());
  final controller = Get.put(registerController());

  final formKeypin = GlobalKey<FormState>();

  TextEditingController otpcontroller = TextEditingController();
  Rx<RxStatus> statusOfProviders= RxStatus.empty().obs;
  Rx<ModelSecurityPin> modelVerifySecurity = ModelSecurityPin().obs;
  Rx<RxStatus> statusOfSucess= RxStatus.empty().obs;
  Rx<ModelVerifyMeterNumber> verifyMeter = ModelVerifyMeterNumber().obs;
  Rx<RxStatus> statusOfResolve = RxStatus.empty().obs;
  Rx<ModelBuyEnergy> Energy = ModelBuyEnergy().obs;
  Rx<RxStatus> statusOfBuyEnergy = RxStatus.empty().obs;
  Rx<RxStatus> statusOfSave= RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;

  saveList() {
    saveTransastionRepo(
        user_id: profileController.modal.value.data!.user!.id.toString(),
        amount:controller.amount.text.trim(),
        about: "Buy Electricity",
        // complete_response: purchaseData.value.data!.toJson(),
        context: context,
        description:controller.provider.text.trim(),
        type: "dr"
    ).then((value) {
      log("response.body.....    ${value}");
      save.value = value;
      if (value.status == true) {
        statusOfSave.value = RxStatus.success();

      } else {
        statusOfSave.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }

   buyEnergy()  {
     BuyEnergyPlanRepo(
      meter_number: controller.meterNo.text.toString(),
      provider: controller.provider.text.trim(),
      amount: controller.amount.text.trim(),
      phone_no: controller.mobileNO.text.trim(),
      context: context,
    )
        .then((value) {
      Energy.value = value;
      if (value.success == true) {
        // payOutcontroller.accountName.text = (value.data!.accountName??"").toString();
        statusOfBuyEnergy.value = RxStatus.success();
        saveList();
        Get.toNamed(MyRouters.successRechargeScreen);
        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
      }
    }
      // showToast(value.message.toString());
    );
  }
  verify() {
    securityPinRepo(
        context: context,
        pin:  otpcontroller.text.trim()


    ).then((value) {
      modelVerifySecurity.value = value;
      if (value.status == true) {

        verifyMeterRepo(
            meter_number: controller.meterNo.text.toString(),
            provider: controller.provider.text.trim()
        )
            .then((value) {
          verifyMeter.value = value;
          if (value.success == true) {
            buyEnergy();
            // payOutcontroller.accountName.text = (value.data!.accountName??"").toString();
            statusOfResolve.value = RxStatus.success();

            showToast(value.message.toString());
          } else {
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
    }

    );

    // if(value.status=="success"){
    //   statusOfChooseBank.value.isSuccess;
    // }
    // Get.toNamed(MyRouters.bottomNavbar);



  }

  getCheckValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.getBool('TransistionPin', );
    print( pref.getBool('TransistionPin', ));
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
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title:Text( "Verify Pin" ,style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),),
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
                            onTap: (){

                            },
                            child: Text(
                              "Create your unique 4-digits pin!",
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
                              controller:otpcontroller,
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
