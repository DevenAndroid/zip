import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/model_get_transfre_limit.dart';
import '../models/set_transfre_limit_model.dart';
import '../repository/get_transferlimit_repo.dart';
import '../repository/set_transfrelimit_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class TransferLimit extends StatefulWidget {
  const TransferLimit({Key? key}) : super(key: key);

  @override
  State<TransferLimit> createState() => _TransferLimitState();
}

class _TransferLimitState extends State<TransferLimit> {
  Rx<RxStatus> statusOfSet = RxStatus.empty().obs;
  Rx<ModelSetTransfreLimit> setTransferLimit = ModelSetTransfreLimit().obs;
  TextEditingController amountController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  setTransfer() {
    setTransferRepo(
            context: context,
            tranfer_limit: amountController.text.trim(),
            pin: pinController.text.trim())
        .then((value) {
      setTransferLimit.value = value;
      if (value.status == true) {
        statusOfSet.value = RxStatus.success();
        getTransfer();
        Get.back();

        showToast(value.message.toString());
      } else {
        statusOfSet.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }

  ///get
  Rx<RxStatus> statusOfGet = RxStatus.empty().obs;
  Rx<ModelGetTransfreLimit> getTransferLimit = ModelGetTransfreLimit().obs;

  getTransfer() {
    transferLimitGetRepo().then((value) {
      getTransferLimit.value = value;
      if (value.status!) {
        statusOfGet.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfGet.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTransfer();
  }

  @override
  Widget build(BuildContext context) {
    double doubleVar;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Transfer Limit",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: const Color(0xffFAFAFA)),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/transferlimiticon.png',
                            height: 72,
                          ),
                          InkWell(
                            onTap: () {
                              print(getTransferLimit.value.data.toString());
                            },
                            child: Text(
                              "\$ ${getTransferLimit.value.data != null ? getTransferLimit.value.data.toString() : "0.00"}",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF1D1D1D),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            "Current Daily Limit",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 11,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: CommonTextfield(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(8),
                      FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                    ],
                    onChanged: (value) => doubleVar = double.parse(value),
                    // validator: MultiValidator([
                    //   RequiredValidator(
                    //       errorText:
                    //       'Please enter your  number '),
                    //   MinLengthValidator(1,
                    //       errorText:
                    //       'Please enter minumum  8 digit number'),
                    //   MaxLengthValidator(8,
                    //       errorText:
                    //       'Please enter 8 digit number'),
                    //   PatternValidator(
                    //       r'(^(?:[+0]9)?[0-9]{10,12}$)',
                    //       errorText: '')
                    // ]),
                    controller: amountController,
                    obSecure: false,
                    hintText: "20,000",
                    labelText: "Set daily limit account",
                  ),
                ),
                // SizedBox(
                //   height: 18,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 6, right: 6),
                //   child: CommonTextfield(
                //     keyboardType:
                //     const TextInputType.numberWithOptions(
                //         decimal: true),
                //     inputFormatters: [
                //       LengthLimitingTextInputFormatter(8),
                //       FilteringTextInputFormatter.allow(
                //           RegExp('[0-9]+')),
                //     ],
                //     onChanged: (value) =>
                //     doubleVar = double.parse(value),
                //
                //     obSecure: false,
                //     hintText: "1234",
                //     labelText: "Card number",
                //   ),
                // ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: CommonTextfield(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(8),
                      FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                    ],
                    onChanged: (value) => doubleVar = double.parse(value),
                    obSecure: false,
                    controller: pinController,
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    hintText: "....",
                    labelText: "Card PIN",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 20, bottom: 32),
                  child: Text(
                    "Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor. Cupiditate ut quae sit ipsam. Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor.",
                    style: GoogleFonts.poppins(
                        color: const Color(0x871D1D1D),
                        fontSize: 9,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 32, right: 32, bottom: 32),
                  child: Text(
                    "Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor. Cupiditate ut quae sit ipsam. Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor.",
                    style: GoogleFonts.poppins(
                        color: const Color(0x871D1D1D),
                        fontSize: 9,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setTransfer();
                  },
                  child: const CustomOutlineButton(
                    title: "Done  ",
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
