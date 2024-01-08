import 'package:country_code_picker/country_code_picker.dart';
import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:dotted_line/dotted_line.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/profile_controller.dart';
import '../models/model_conversion.dart';
import '../models/model_rate.dart';
import '../repository/conversion_repo.dart';
import '../repository/rate_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_boder_button.dart';

class AddFundExchange extends StatefulWidget {
  const AddFundExchange({Key? key}) : super(key: key);

  @override
  State<AddFundExchange> createState() => _AddFundExchangeState();
}

class _AddFundExchangeState extends State<AddFundExchange> {
  final profileController = Get.put(ProfileController());

  String? usdToNgn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    convertUsd();
    profileController.exchangeRate();
  }

  void convertUsd() async {
    Currency myCurrency = await CurrencyConverter.getMyCurrency();
    var usdConvert = await CurrencyConverter.convert(
      from: Currency.ngn,
      to: Currency.usd,
      amount: 1,
    );
    setState(() {
      usdToNgn = usdConvert.toString();
    });
  }

  Future Conversions() async {
    await conversionRepo(
            amount: profileController.fundAmountController.text.trim(),
            action: "send",
            sourceCurrency: "NGN",
            destinationCurrency: "USD",
            business: "64529bd2bfdf28e7c18aa9da",
            beneficiaryType: "individual",
            feeBearer: "business",
            paymentDestination: "fliqpay_wallet",
            transactionType: "conversion",
            context: context)
        .then((value) {
      profileController.modelConversion.value = value;
      if (value.success == true) {
        profileController.statusOfConversion.value = RxStatus.success();
        currency.value = value.data!.destinationAmount.toString();
        fee.value = value.data!.fee.toString();
        receive.value = value.data!.amountToReceive.toString();
        showToast(value.message.toString());
      } else {
        showToast(value.message.toString());
      }
    }
            // showToast(value.message.toString());
            );
  }

  RxString currency = "0".obs;
  RxString fee = "".obs;
  RxString receive = "".obs;

  String dropdownvalue2 = 'NGN';

  List<DropdownMenuItem<String>> get dropdownItemsm2 {
    List<DropdownMenuItem<String>> menuItemsm = [
      const DropdownMenuItem(
          value: "NGN",
          child: Text(
            "NGN",
          )),
      const DropdownMenuItem(value: "GBP", child: Text("GBP")),
      const DropdownMenuItem(value: "EUR", child: Text("EUR")),
      const DropdownMenuItem(value: "USD", child: Text("USD")),
    ];
    return menuItemsm;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
          title: InkWell(
            onTap: () {
              // Get.toNamed(MyRouters.yourBalanceScreen);
            },
            child: Text(
              "Add Fund",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          return profileController.modelRate.value.status == "success"
              ? SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                        key: profileController.formKeyFund,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppTheme.primaryColor,
                                        width: 1.3),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    Container(
                                        height: 70,
                                        width: 100,
                                        padding: const EdgeInsets.all(12),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                bottomLeft:
                                                    Radius.circular(16)),
                                            color: Color(0xFFEEEEEE)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, left: 20),
                                          child: Text(
                                            "NGN",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )

                                        // CountryCodePicker(
                                        //   onChanged: print,
                                        //   initialSelection: 'IT',
                                        //   favorite: ['+39', 'FR'],
                                        //   showCountryOnly: false,
                                        //   showOnlyCountryWhenClosed: true,
                                        //   alignLeft: false,
                                        // ),
                                        ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text(
                                      "You Pay ",
                                      style: TextStyle(
                                          color: Color(0xFFB6B6B6),
                                          fontSize: 16,
                                          decorationColor: Colors.transparent,
                                          decorationThickness: 0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 100,
                                      height: 50,
                                      child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (value) {
                                            if (value!.trim().isEmpty) {
                                              return "Please enter amount";
                                            }
                                            if (double.tryParse(value.trim()) ==
                                                null) {
                                              return "Enter valid amount";
                                            }
                                            if (double.parse(value.trim()) >
                                                (double.tryParse(
                                                        profileController
                                                            .currentBalanceModel
                                                            .value
                                                            .data!
                                                            .currentBalance
                                                            .toString()) ??
                                                    0)) {
                                              return "less than account balance ";
                                            }
                                          },
                                          controller: profileController
                                              .fundAmountController,
                                          decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 3),
                                            hintText: "0",
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Color(0xFF1D1D1D),
                                                fontSize: 16,
                                                decorationColor:
                                                    Colors.transparent,
                                                decorationThickness: 0,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          double result = double.parse(
                                                  profileController
                                                      .fundAmountController
                                                      .text) /
                                              double.parse(profileController
                                                  .divideText
                                                  .trim());
                                          profileController.resulttext =
                                              result.toStringAsPrecision(4);
                                          double resultMultiply = double.parse(
                                                  profileController.resulttext
                                                      .trim()) *
                                              double.parse("100").round();
                                          profileController.multiplyText =
                                              resultMultiply.toInt().toString();
                                          // profileController.multiplyText = int.parse(resultMultiply.toStringAsFixed(2));
                                          print(profileController.multiplyText);
                                        });
                                      },
                                      child: Icon(Icons.arrow_forward),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 13.0),
                                      child: SizedBox(
                                        width: 10,
                                        height: 40,
                                        child: DottedLine(
                                          direction: Axis.vertical,
                                          alignment: WrapAlignment.center,
                                          lineThickness: 1.0,
                                          dashLength: 4.0,
                                          dashColor: Colors.black,
                                          dashRadius: 0.0,
                                          dashGapLength: 4.0,
                                          dashGapColor: Colors.transparent,
                                          dashGapRadius: 0.0,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFF0D75F),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.clear,
                                            size: 18,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                print(usdToNgn.toString());
                                              },
                                              child: Text(
                                                "\$1 = ",
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFF7E7E7E),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Text(
                                              profileController.divideText
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF7E7E7E),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 13.0),
                                      child: SizedBox(
                                        width: 10,
                                        height: 35,
                                        child: DottedLine(
                                          direction: Axis.vertical,
                                          alignment: WrapAlignment.center,
                                          lineThickness: 1.0,
                                          dashLength: 4.0,
                                          dashColor: Colors.black,
                                          dashRadius: 0.0,
                                          dashGapLength: 4.0,
                                          dashGapColor: Colors.transparent,
                                          dashGapRadius: 0.0,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFF0D75F),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              " - ",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF1D1D1D),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Fee =\$",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF7E7E7E),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "500",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF7E7E7E),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 13.0),
                                      child: SizedBox(
                                        width: 10,
                                        height: 35,
                                        child: DottedLine(
                                          direction: Axis.vertical,
                                          alignment: WrapAlignment.center,
                                          lineThickness: 1.0,
                                          dashLength: 4.0,
                                          dashColor: Colors.black,
                                          dashRadius: 0.0,
                                          dashGapLength: 4.0,
                                          dashGapColor: Colors.transparent,
                                          dashGapRadius: 0.0,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(7),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFF0D75F),
                                              shape: BoxShape.circle,
                                            ),
                                            child: SvgPicture.asset(
                                              "assets/images/Vector.svg",
                                              height: 24,
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Instant",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF7E7E7E),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 13.0),
                                      child: SizedBox(
                                        height: 45,
                                        child: DottedLine(
                                          direction: Axis.vertical,
                                          alignment: WrapAlignment.center,
                                          lineThickness: 1.0,
                                          dashLength: 4.0,
                                          dashColor: Colors.black,
                                          dashRadius: 0.0,
                                          dashGapLength: 4.0,
                                          dashGapColor: Colors.transparent,
                                          dashGapRadius: 0.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppTheme.primaryColor,
                                        width: 1.3),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    Container(
                                        height: 70,
                                        width: 100,
                                        padding: const EdgeInsets.all(12),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                bottomLeft:
                                                    Radius.circular(16)),
                                            color: Color(0xFFEEEEEE)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, left: 20),
                                          child: Text(
                                            "USD",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )

                                        // CountryCodePicker(
                                        //   onChanged: print,
                                        //   initialSelection: 'IT',
                                        //   favorite: ['+39', 'FR'],
                                        //   showCountryOnly: false,
                                        //   showOnlyCountryWhenClosed: true,
                                        //   alignLeft: false,
                                        // ),
                                        ),

                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text(
                                      "You Get ",
                                      style: TextStyle(
                                          color: Color(0xFFB6B6B6),
                                          fontSize: 16,
                                          decorationColor: Colors.transparent,
                                          decorationThickness: 0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      profileController.resulttext.toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          decorationColor: Colors.transparent,
                                          decorationThickness: 0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    // SizedBox(
                                    //   width: 120,
                                    //   child: TextFormField(
                                    //       decoration: const InputDecoration(
                                    //         hintText: "You Get            0",
                                    //         border: InputBorder.none,
                                    //         focusedBorder: InputBorder.none,
                                    //         enabledBorder: InputBorder.none,
                                    //         errorBorder: InputBorder.none,
                                    //         disabledBorder: InputBorder.none,
                                    //         hintStyle: TextStyle(
                                    //             color: Color(0xFF1D1D1D),
                                    //             fontSize: 16,
                                    //             decorationColor: Colors.transparent,
                                    //             decorationThickness: 0,
                                    //             fontWeight: FontWeight.w600),
                                    //       )),
                                    // ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: size.height * .2,
                              ),
                              InkWell(
                                  onTap: () {
                                    profileController.addFund(context);
                                    // profileController.getCard();
                                    //  profileController.fundIssuing(context);
                                    // convertUsd();
                                    // Conversions();
                                    // Get.toNamed(MyRouters.bottomNavbar);
                                  },
                                  child: const CustomOutlineButton(
                                      title: "Add Fund ")),
                              SizedBox(
                                height: 30,
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     Get.toNamed(MyRouters.fundIssuingWallet);
                              //   },
                              //   child: const            CustomOutlineBoder(
                              //     title: "Issuing Fund",
                              //   ),
                              // ),
                            ]),
                      )))
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }));
  }
}
