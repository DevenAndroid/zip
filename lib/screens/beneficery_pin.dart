
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
import '../models/model_beneficary_list.dart';
import '../models/model_create_payout.dart';
import '../models/model_security_pin.dart';
import '../models/model_setting.dart';
import '../models/model_verify_africa.dart';
import '../models/model_veryfy_meter.dart';
import '../models/save_transastion_model.dart';
import '../models/verify_africa.dart';
import '../repository/buy_energy_repo.dart';
import '../repository/payout_repo.dart';
import '../repository/repo_buy_plan.dart';
import '../repository/save_buy_plan_repo.dart';
import '../repository/security_pin_repo].dart';
import '../repository/setting_repo.dart';
import '../repository/verify_africa_b.dart';
import '../repository/verify_meter_repo.dart';
import '../resourses/api_constant.dart';

import '../controller/update_user.dart';


class BeneficeryPin extends StatefulWidget {
  const BeneficeryPin({Key? key}) : super(key: key);

  @override
  State<BeneficeryPin> createState() => _BeneficeryPinState();
}

class _BeneficeryPinState extends State<BeneficeryPin> {
  final profileController = Get.put(ProfileController());
  final RegistorController = Get.put(registerController());

  final formKeypin = GlobalKey<FormState>();

  TextEditingController otpcontroller = TextEditingController();
  Rx<RxStatus> statusOfProviders= RxStatus.empty().obs;
  Rx<ModelSecurityPin> modelVerifySecurity = ModelSecurityPin().obs;
  Rx<RxStatus> statusOfSucess= RxStatus.empty().obs;



  Rx<RxStatus> statusOfpayout = RxStatus.empty().obs;
  Rx<ModelPayout> payout = ModelPayout().obs;
  final formKey4 = GlobalKey<FormState>();


  BenificaryData data = BenificaryData();

  @override
  void initState() {
    super.initState();
    if(Get.arguments != null){
      data = Get.arguments;

    }
  }
  Rx<RxStatus> statusOfSave= RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;

  saveList() {
    saveTransastionRepo(
        user_id: profileController.modal.value.data!.user!.id.toString(),
        amount:RegistorController.amount1Controller.text.trim() ,
        about: "Send Cash",
        send_type: "otherusers ",
        beneficiary_id: data.id.toString(),
        // complete_response: purchaseData.value.data!.toJson(),
        context: context,
        description:RegistorController.descriptionController.text.trim(),
        type: "dr"
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
  verify() {
    securityPinRepo(
        context: context,
        pin:  otpcontroller.text.trim()


    ).then((value) {
      modelVerifySecurity.value = value;
      if (value.status == true) {
        Get.toNamed(MyRouters.payNowBalance,arguments: data);

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
          title:Text( "Verify Otp" ,style: GoogleFonts.poppins(
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
