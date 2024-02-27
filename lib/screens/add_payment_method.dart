import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/screens/cashOut_1.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../../controller/payout_controller.dart';
import '../../controller/update_user.dart';
import '../../models/model_account_resolve.dart';
import '../../repository/bank_resolve_repo.dart';
import '../../resourses/api_constant.dart';
import '../controller/profile_controller.dart';
import '../models/model_create_payout.dart';
import '../repository/payout_repo.dart';
import '../resourses/details.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({Key? key}) : super(key: key);

  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  final profileController = Get.put(ProfileController());
  final RegistorController = Get.put(registerController());
  final details = Get.put(DetailsController());
  Rx<RxStatus> statusOfpayout = RxStatus.empty().obs;
  Rx<ModelPayout> payout = ModelPayout().obs;
  Rx<ModelAccountResolve> resolve = ModelAccountResolve().obs;
  Rx<RxStatus> statusOfResolve = RxStatus.empty().obs;

  Future resolveData() async {
    await resolveRepo(
            accountNumber: payOutcontroller.accountNo.text.trim(),
            bankCode: controller.idController1.text.trim(),
            context: context)
        .then((value) {
      resolve.value = value;
      if (value.success == true) {
        payOutcontroller.accountName.text =
            (value.data!.accountName ?? "").toString();
        statusOfResolve.value = RxStatus.success();

        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
      }
    }
            // showToast(value.message.toString());
            );
  }

  // final TextEditingController bankController = TextEditingController();
  final controller = Get.put(registerController());
  final payOutcontroller = Get.put(PayoutController());

  Future CreatePayout() async {
    payoutRepo(
            amount: profileController.amountController.text.toString().trim(),
            context: context,
            user_id: profileController.modal.value.data!.user!.id.toString(),
            key: "payouts",
            bank_code: controller.idController1.text.toString(),
            accountHolderName: payOutcontroller.accountName.toString().trim(),
            accountNumber: payOutcontroller.accountNo.toString().trim(),
            destinationCurrency: "NGN",
            about: "Cash Out",
            customerReference: DateFormat.jm().format(DateTime.now()),
// RegistorController.descriptionController.text.trim(),
// destinationCurrencyController.text.trim() ,
            sourceCurrency: "NGN",
            // sourceCurrencyController.text.trim(),
            description: DateFormat.jm().format(DateTime.now()),
            // email:data.email.toString(),
            firstName: controller.bankController1.toString().trim(),
            // lastName:data.lastName.toString() ,
            paymentDestination: "bank_account",
            type: "individual",
            business: details.businessID)
        .then((value) {
      payout.value = value;
      if (value.success == true) {
        statusOfpayout.value = RxStatus.success();
        // saveList();
        payOutcontroller.accountNo.text = "";
        controller.bankController1.text = "";
        payOutcontroller.accountName.text = "";

        payOutcontroller.saveDetails1(context);
        // Get.back();
        showToast(value.message.toString());
      } else {
        statusOfpayout.value = RxStatus.success();
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }

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
            "Account details",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        bottomNavigationBar: profileController.isSwitched == true
            ? Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10, right: 10),
                child: InkWell(
                  onTap: () {
                    payOutcontroller.saveDetails(context);
                  },
                  child: const CustomOutlineButton(
                    title: "Continue",
                  ),
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10, right: 10),
                child: InkWell(
                  onTap: () {
                    Get.to(() => Withdrawl1Cash());
                  },
                  child: const CustomOutlineButton(
                    title: "Continue",
                  ),
                ),
              ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 8.0, right: 8),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         border: Border.all(color: Colors.grey)),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Row(
                      //         children: [
                      //           SvgPicture.asset('assets/images/mark.svg'),
                      //           const SizedBox(
                      //             width: 10,
                      //           ),
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 'Add account',
                      //                 style: GoogleFonts.poppins(
                      //                   textStyle: const TextStyle(
                      //                       fontSize: 14,
                      //                       fontWeight: FontWeight.w500,
                      //                       color: Color(0xFF1D1D1D)),
                      //                 ),
                      //               ),
                      //               Text(
                      //                 'Send to already saved channels',
                      //                 style: GoogleFonts.poppins(
                      //                   textStyle: const TextStyle(
                      //                       fontSize: 13,
                      //                       fontWeight: FontWeight.w400,
                      //                       color: Colors.grey),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      CommonTextfield(
                        onTap: () {
                          Get.toNamed(MyRouters.chooseBank1);
                        },
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        controller: controller.bankController1,
                        readOnly: true,
                        obSecure: false,
                        hintText: "",
                        labelText: "Select Bank",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonTextfield(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(
                              RegExp('[0-9]+\\.?[0-9]*')),
                        ],
                        onChanged: (value) {
                          if (value.length == 10) {
                            FocusScope.of(context).unfocus();
                            resolveData();
                          }
                        },

                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter your account number '),
                          MinLengthValidator(10,
                              errorText:
                                  'Please enter minumum  10 account number'),
                          MaxLengthValidator(12,
                              errorText: 'Please enter 10 account number'),
                          PatternValidator(r'(^(?:[+0]9)?[0-9]{10,12}$)',
                              errorText: '')
                        ]),
                        controller: payOutcontroller.accountNo,
                        // suffixIcon: InkWell(
                        //     onTap: (){ resolveData();},
                        //
                        //     child: Icon(Icons.arrow_forward)),
                        obSecure: false,
                        hintText: "",
                        labelText: "Account Number",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CommonTextfield(
                        readOnly: true,
                        controller: payOutcontroller.accountName,
                        obSecure: false,
                        hintText: "",
                        labelText: "Account Name",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5),
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Save as Account',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF1D1D1D)),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 20,
                                  child: CupertinoSwitch(
                                    thumbColor: Colors.black,
                                    value: profileController.isSwitched,
                                    activeColor: const Color(0xffF0D75F),
                                    onChanged: (value) {
                                      setState(() {
                                        profileController.isSwitched = value;
                                        print(profileController.isSwitched);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .4,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ]))));
  }
}
