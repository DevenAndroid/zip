import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';


import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/model_beneficary_list.dart';
import '../models/model_create_payout.dart';
import '../models/model_favorite_benificery.dart';
import '../models/model_get_binificery.dart';
import '../models/save_transastion_model.dart';
import '../repository/payout_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

  class FavourateBalance extends StatefulWidget {
  const FavourateBalance({Key? key}) : super(key: key);

  @override
  State<FavourateBalance> createState() => _FavourateBalanceState();
}

class _FavourateBalanceState extends State<FavourateBalance> {
  final RegistorController = Get.put(registerController());
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController sourceCurrencyController = TextEditingController();
  TextEditingController destinationCurrencyController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  Rx<RxStatus> statusOfpayout = RxStatus.empty().obs;
  Rx<ModelPayout> payout = ModelPayout().obs;
  Future CreatePayout() async {
    await payoutRepo(
        amount:amountController.text.trim() ,
        context: context,
        accountHolderName:data.accountHolderName.toString() ,
        accountNumber:data.destinationAddress.toString(),
        destinationCurrency:"NGN",
// destinationCurrencyController.text.trim() ,
        sourceCurrency: "NGN",
        // sourceCurrencyController.text.trim(),
        description: descriptionController.text.trim(),
        // email:data.email.toString(),
        firstName:data.firstName.toString() ,
        // lastName:data.lastName.toString() ,
        paymentDestination:"bank_account" ,
        type:"individual" ,
        business:  '64529bd2bfdf28e7c18aa9da'
    ).then((value) {
      payout.value = value;
      if (value.success == true) {
        statusOfpayout.value = RxStatus.success();
        saveList();
        Get.toNamed(MyRouters.successRechargeScreen);
        // Get.back();
        showToast(value.message.toString());
      }
      else{
        statusOfpayout.value = RxStatus.success();
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }


  favouriteData data = favouriteData();

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
        amount:amountController.text.trim() ,
        about: "Send Cash",
        send_type: "otherusers ",
        beneficiary_id: data.id.toString(),
        // complete_response: purchaseData.value.data!.toJson(),
        context: context,
        description:descriptionController.text.trim(),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "\$276.00",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
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
                "Amount ",
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
                controller: amountController,
                obSecure: false,
                hintText: "200",

              ),
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
                controller: accountNoController,
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
                controller: descriptionController,
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
    );
  }
}
