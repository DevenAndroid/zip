import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../../controller/payout_controller.dart';
import '../../controller/update_user.dart';
import '../../models/model_account_resolve.dart';
import '../../repository/bank_resolve_repo.dart';
import '../../resourses/api_constant.dart';

class SendCash2 extends StatefulWidget {
  const SendCash2({Key? key}) : super(key: key);

  @override
  State<SendCash2> createState() => _SendCash2State();
}

class _SendCash2State extends State<SendCash2> {
  bool isSwitched = false;

  final formKey4 = GlobalKey<FormState>();
  Rx<ModelAccountResolve> resolve = ModelAccountResolve().obs;
  Rx<RxStatus> statusOfResolve = RxStatus.empty().obs;

  Future resolveData() async {
    await resolveRepo(
            accountNumber: payOutcontroller.accountNo.text.trim().toString(),
            bankCode: controller.idController.text.trim().trim(),
            context: context)
        .then((value) {
      resolve.value = value;
      if (value.success == true) {
        payOutcontroller.accountName.text =
            (value.data!.accountName ?? "").toString();
        statusOfResolve.value = RxStatus.success();

        showToast(value.message.toString());
      } else {
        showToast(
            "Account could not be resolved. Please check your selection and try again");
      }
    }
            // showToast(value.message.toString());
            );
  }

  // final TextEditingController bankController = TextEditingController();
  final controller = Get.put(registerController());
  final payOutcontroller = Get.put(PayoutController());

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
          toolbarHeight: 80,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.grey.shade300,
              height: 1.0,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Get.back();
              payOutcontroller.accountNo.toString() == "";
              payOutcontroller.accountName.toString() == "";
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
        bottomNavigationBar: isSwitched == true
            ? Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: InkWell(
                    onTap: () {
                      print(
                        controller.bankController.text.trim(),
                      );
                      if (formKey4.currentState!.validate()) {
                        payOutcontroller.CreateBenificery();
                      }
                    },
                    child: const CustomOutlineButton(
                      title: "Continue",
                    )),
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: InkWell(
                    onTap: () {
                      print(
                        controller.bankController.text.trim(),
                      );
                      if (formKey4.currentState!.validate()) {
                        Get.toNamed(MyRouters.payNow2, arguments: [
                          controller.bankController.text.toString().trim(),
                          payOutcontroller.accountNo.text.toString().trim(),
                          payOutcontroller.accountName.text.toString().trim()
                        ]);
                      }
                    },
                    child: const CustomOutlineButton(
                      title: "Continue",
                    )),
              ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: formKey4,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(MyRouters.yourRecipient);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/images/mark.svg'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Recipient',
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
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonTextfield(
                          onTap: () {
                            Get.toNamed(MyRouters.chooseBank);
                          },
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                          controller: controller.bankController,
                          readOnly: true,
                          obSecure: false,
                          hintText: "Select Bank",
                          // labelText: "Select Bank",
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
                          obSecure: false,
                          hintText: "",
                          labelText: "Account Number",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonTextfield(
                          validator: RequiredValidator(
                              errorText: "please enter account name "),
                          readOnly: true,
                          controller: payOutcontroller.accountName,
                          obSecure: false,
                          hintText: "",
                          labelText: "Account Name",
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5),
                          child: Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Save recipient details',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF1D1D1D)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    height: 16,
                                    child: CupertinoSwitch(
                                      thumbColor: Colors.white,
                                      value: isSwitched,
                                      activeColor: Colors.black,
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitched = value;
                                          print(isSwitched);
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
                      ]),
                ))));
  }
}
