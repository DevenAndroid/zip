import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
            accountNumber: payOutcontroller.accountNo.text.trim(),
            bankCode:  controller.idController.text.trim(),
            context: context)
        .then((value) {
      resolve.value = value;
      if (value.success == true) {
        payOutcontroller.accountName.text = (value.data!.accountName??"").toString();
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
              // Get.toNamed(MyRouters.sendCashReciptant);

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
        bottomNavigationBar: isSwitched==true?
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: InkWell(
              onTap: () {
                print( controller.bankController,);
                if (formKey4.currentState!.validate()) {
                  payOutcontroller.CreateBenificery();
                }
              },
              child: const CustomOutlineButton(
                title: "Continue",
              )),
        ):Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: InkWell(
              onTap: () {
                print( controller.bankController,);
                if (formKey4.currentState!.validate()) {
                  Get.toNamed(MyRouters.payNow2,arguments: [
                    controller.bankController.text.toString(),payOutcontroller.accountNo.text.toString(),payOutcontroller.accountName.text.toString()]);
                  // payOutcontroller.CreateBenificery();
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
                  key:formKey4 ,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){
                            Get.toNamed(MyRouters.yourRecipient);
                          },
                          child: Padding(
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
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextfield(
                          onTap: () {
                            Get.toNamed(MyRouters.chooseBank);
                          },
                          suffixIcon: Icon(Icons.keyboard_arrow_down),
                          controller: controller.bankController,
                          readOnly: true,
                          obSecure: false,
                          hintText: "Select Bank",
                          // labelText: "Select Bank",
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
                            RequiredValidator(
                                errorText:
                                'Please enter your account number '),
                            MinLengthValidator(10,
                                errorText:
                                'Please enter minumum  10 account number'),
                            MaxLengthValidator(12,
                                errorText:
                                'Please enter 10 account number'),
                            PatternValidator(
                                r'(^(?:[+0]9)?[0-9]{10,12}$)',
                                errorText: '')
                          ]),
                          controller: payOutcontroller.accountNo,
                          suffixIcon: InkWell(
                              onTap: (){ resolveData();},

                              child: Icon(Icons.arrow_forward)),
                          obSecure: false,
                          hintText: "",
                          labelText: "Account Number",

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextfield(
                          validator: RequiredValidator(
                            errorText: "please enter account name "
                          ),
                          readOnly: true,
                          controller: payOutcontroller.accountName,
                          obSecure: false,
                          hintText: "",
                          labelText: "Account Name",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Save as Beneficiaries',
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
                                  value: isSwitched,
                                  activeColor: Color(0xffF0D75F),
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
                        SizedBox(
                          height: size.height * .4,
                        ),

                        SizedBox(
                          height: 15,
                        ),
                      ]),
                ))));
  }
}
