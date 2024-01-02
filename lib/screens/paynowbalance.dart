import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';


import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/model_beneficary_list.dart';
import '../models/model_create_payout.dart';
import '../models/model_get_binificery.dart';
import '../models/save_transastion_model.dart';
import '../repository/payout_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class PayNowBalance extends StatefulWidget {
  const PayNowBalance({Key? key}) : super(key: key);

  @override
  State<PayNowBalance> createState() => _PayNowBalanceState();
}

class _PayNowBalanceState extends State<PayNowBalance> {
  final RegistorController = Get.put(registerController());
  final details = Get.put(DetailsController());
  Rx<RxStatus> statusOfpayout = RxStatus.empty().obs;
  Rx<ModelPayout> payout = ModelPayout().obs;
  final formKey4 = GlobalKey<FormState>();
  Future CreatePayout() async {
    if (formKey4.currentState!.validate()) {



      payoutRepo(
          amount:RegistorController.amount1Controller.text.trim() ,
          context: context,
          key: "payouts",
          bank_code:RegistorController.idController1.text.trim(),
          user_id: profileController.modal.value.data!.user!.id.toString(),
          accountHolderName:data.accountHolderName.toString() ,
          accountNumber:data.destinationAddress.toString(),
          destinationCurrency:"NGN",
          about: "Pay Out",
          customerReference:  DateFormat.jm().format(DateTime.now()),
// RegistorController.descriptionController.text.trim(),
// destinationCurrencyController.text.trim() ,
          sourceCurrency: "NGN",
          // sourceCurrencyController.text.trim(),
          description: RegistorController.descriptionController.text.trim(),
          // email:data.email.toString(),
          firstName: data.firstName.toString() ,
          // lastName:data.lastName.toString() ,
          paymentDestination:"bank_account" ,
          type:"individual" ,
          business: details.businessID
      ).then((value) {
        payout.value = value;
        if (value.success == true) {
          statusOfpayout.value = RxStatus.success();
          // saveList();
          Get.toNamed(MyRouters.successRechargeScreen);
          // Get.back();
          showToast(value.message.toString());
        }
        else {
          statusOfpayout.value = RxStatus.success();
          showToast(value.message.toString());
        }
        // showToast(value.message.toString());
      });
    }
  }


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
  final profileController = Get.put(ProfileController());
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double doubleVar;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Your Balance",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: (){ Get.back();},
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),
      ),
      body:  Obx(() {
      return profileController.currentBalanceModel.value.status ==true
          ?


      SingleChildScrollView(
        child: Form(
          key: formKey4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network("https://cdn-icons-png.flaticon.com/512/32/32974.png",color: Colors.black,width: 15,height: 15,),

                    Text(
                    profileController.currentBalanceModel.value.data!.currentBalance.toString(),
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),],
                ),
              ),
              Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.only(
                            right: size.width * .01, left: size.width * .015),
                        child: CircleAvatar(
                          radius: size.height * .07,
                          backgroundImage: const NetworkImage(
                              'https://www.pngitem.com/pimgs/m/128-1284293_marina-circle-girl-picture-in-circle-png-transparent.png'),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Center(
                child: Text(
                  data.accountHolderName.toString() ,
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),

              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 6),
                child: Text(
                  "Amount FEE "+ profileController.currentBalanceModel.value.data!.fee.toString(),
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 6,),
              CommonTextfield(
                keyboardType:
                const TextInputType.numberWithOptions(
                    decimal: true),
                inputFormatters: [
                  // LengthLimitingTextInputFormatter(8),
                  FilteringTextInputFormatter.allow(
                      RegExp('[0-9]+')),
                ],
                onChanged: (value) =>
                doubleVar = double.parse(value),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Please enter amount";
                  }
                  if (double.tryParse(value.trim()) == null) {
                    return "Enter valid amount";
                  }
                  if (double.parse(value.trim()) >
                      (double.tryParse(profileController.currentBalanceModel.value.data!.currentBalance.toString()) ?? 0)) {
                    return "Please enter amount less than balance ";
                  }
                },
                controller: RegistorController.amount1Controller,
                obSecure: false,
                hintText: "Enter  Amount",

              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 6),
                child: Text(
                  "Account Number ",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 6,),
              Padding(
                padding: const EdgeInsets.only(left: 6,right: 6),
                child: CommonTextfield(
                  readOnly: true,
                  controller: RegistorController.accountNoController,
                  obSecure: false,
                  hintText: data.destinationAddress,

                ),
              ),



              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 6),
                child: Text(
                  "Description ",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 6,),
              Padding(
                padding: const EdgeInsets.only(left: 6,right: 6),
                child: CommonTextfield(
                  validator: MultiValidator([
                    RequiredValidator(
                        errorText: 'Please enter your description '),
                  ]),
                  controller: RegistorController.descriptionController,
                  obSecure: false,
                  hintText: "write a note",

                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 6),
                child: Text(
                  "Bank Name ",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 6,),
              Padding(
                padding: const EdgeInsets.only(left: 6,right: 6),
                child: CommonTextfield(
                 readOnly: true,
                  obSecure: false,
                  hintText: data.firstName,

                ),
              ),


              SizedBox(
                height: size.height * .12,
              ),
              InkWell(
                onTap: () {
                  // Get.toNamed(MyRouters.accountsInBank);
                  CreatePayout();
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 10,right: 8),
                  child: CustomOutlineButton(
                    title: "Send",
                  ),
                ),
              ),
          SizedBox(height: 30,)

            ],
          ),
        ),
      ): Center(
        child: CircularProgressIndicator(),
      );
      }),
    );
  }
}
