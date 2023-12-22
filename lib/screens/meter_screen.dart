import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../../controller/payout_controller.dart';
import '../../controller/update_user.dart';
import '../../models/model_account_resolve.dart';
import '../../repository/bank_resolve_repo.dart';
import '../../resourses/api_constant.dart';
import '../controller/profile_controller.dart';
import '../models/buy_energy_model.dart';
import '../models/model_veryfy_meter.dart';
import '../models/save_transastion_model.dart';
import '../repository/buy_energy_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../repository/verify_meter_repo.dart';

class MeterVerifyScreen extends StatefulWidget {
  const MeterVerifyScreen({Key? key}) : super(key: key);

  @override
  State<MeterVerifyScreen> createState() => _MeterVerifyScreenState();
}

class _MeterVerifyScreenState extends State<MeterVerifyScreen> {
  bool isSwitched = false;
  final registorController = Get.put(registerController());
  final profileController = Get.put(ProfileController());
  Rx<RxStatus> statusOfSave= RxStatus.empty().obs;
  Rx<ModelSaveTransastion> save = ModelSaveTransastion().obs;
  final controller = Get.put(registerController());
  final payOutcontroller = Get.put(PayoutController());
  saveList() {
    saveTransastionRepo(
        user_id: profileController.modal.value.data!.user!.id.toString(),
        amount:controller.amount.text.trim(),
        about: "Buy Electricity",
        // complete_response: purchaseData.value.data!.toJson(),
        context: context,
        telcos: controller.provider.text.trim(),
        description:controller.meterNo.text.toString(),
        phone: controller.mobileNO.text.trim(),
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

  Rx<ModelVerifyMeterNumber> verifyMeter = ModelVerifyMeterNumber().obs;
  Rx<RxStatus> statusOfResolve = RxStatus.empty().obs;
  Rx<ModelBuyEnergy> Energy = ModelBuyEnergy().obs;
  Rx<RxStatus> statusOfBuyEnergy = RxStatus.empty().obs;
  final formKey4 = GlobalKey<FormState>();

   verifyMeterData()  async {
     SharedPreferences pref = await SharedPreferences.getInstance();
     var uniqueIdentifier = pref.getString("uniqueIdentifier");
     if (pref.getBool('TransistionPin') == true) {
       Get.toNamed(MyRouters.purchaseRechargePin);
     }
     else {
       if (formKey4.currentState!.validate()) {
         verifyMeterRepo(
             billersCode: controller.meterNo.text.toString(),
             type:  controller.provider.text.trim(),
           serviceID: controller.idController1.text,
           key: "merchant-verify"
         )
             .then((value) {
           verifyMeter.value = value;
           if (value.status == true) {
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
       }}
  }
   buyEnergy()  {
     BuyEnergyPlanRepo(
      billersCode: controller.meterNo.text.toString(),
      variation_code:  controller.provider.text.trim(),
      serviceID: controller.idController1.text.toString(),
      key: "pay",
      amount: controller.amount.text.toString(),
      phone: controller.mobileNO.text.toString(),
      context: context,
      )
        .then((value) {
      Energy.value = value;
      if (value.status == true) {
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

  // final TextEditingController bankController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double doubleVar;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded, color: Colors.black,
              // color: AppTheme.primaryColor,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Buy Energy",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: InkWell(
            onTap: (){
              verifyMeterData();
              // payOutcontroller.save(context);
            },
            child: CustomOutlineButton(
              title: "Continue",

            ),
          ),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/mark.svg'),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Verify Meter',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1D1D1D)),
                                    ),
                                  ),
                                  Text(
                                    'Send to already saved channels',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextfield(
                          onTap: () {
                            Get.toNamed(MyRouters.billerScreen);
                          },
                          suffixIcon: Icon(Icons.keyboard_arrow_down),
                          controller: controller.provider,
                          readOnly: true,
                          obSecure: false,
                          hintText: "",
                          labelText: "Select Provider",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextfield(
                          keyboardType:
                          const TextInputType.numberWithOptions(
                              decimal: true),
                         inputFormatters: [
                           LengthLimitingTextInputFormatter(13),
                           FilteringTextInputFormatter.allow(
                               RegExp('[0-9]+')),
                         ],
                          onChanged: (value) =>
                          doubleVar = double.parse(value),
                          validator: MultiValidator([
                          RequiredValidator(
                              errorText:
                              'Please enter your meter number '),
                            // MinLengthValidator(12,
                            //     errorText:
                            //     'Please enter minumum  11 meter number'),
                            // MaxLengthValidator(15,
                            //     errorText:
                            //     'Please enter 10 meter number'),

                          ]),
                          controller: controller.meterNo,

                          obSecure: false,
                          hintText: "",
                          labelText: "Meter Number",

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextfield(
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
                                'Please enter your mobile number '),
                            MinLengthValidator(11,
                                errorText:
                                'Please enter minumum  11 mobile number'),
                            MaxLengthValidator(12,
                                errorText:
                                'Please enter 10 mobile number'),
                            PatternValidator(
                                r'(^(?:[+0]9)?[0-9]{10,12}$)',
                                errorText: '')
                          ]),
                          readOnly: false,
                          controller: controller.mobileNO,
                          obSecure: false,
                          hintText: "",
                          labelText: "Mobile No",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextfield(
                          keyboardType:
                          const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.allow(
                                RegExp('[0-9]+')),
                          ],
                          onChanged: (value) =>
                          doubleVar = double.parse(value),
                          validator: MultiValidator([
                            RangeValidator(min: 0, max: profileController
                                .currentBalanceModel
                                .value
                                .data!.currentBalance!.toInt(), errorText: "Can't add more than${profileController
                                .currentBalanceModel
                                .value
                                .data!.currentBalance}"),
                        RequiredValidator(
                            errorText:
                            'Please enter amount '),]),
                readOnly: false,

                          controller: controller.amount,
                          obSecure: false,
                          hintText: "",
                          labelText: "Amount",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         'Save as Account',
                        //         style: GoogleFonts.poppins(
                        //           textStyle: const TextStyle(
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.w400,
                        //               color: Color(0xFF1D1D1D)),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 50,
                        //         height: 20,
                        //         child: CupertinoSwitch(
                        //           thumbColor: Colors.black,
                        //           value: isSwitched,
                        //           activeColor: Color(0xffF0D75F),
                        //           onChanged: (value) {
                        //             setState(() {
                        //               isSwitched = value;
                        //               print(isSwitched);
                        //             });
                        //           },
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),


                        SizedBox(
                          height: 15,
                        ),
                      ])),
            )));
  }
}
