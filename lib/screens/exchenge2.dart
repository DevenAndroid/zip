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

import '../models/model_conversion.dart';
import '../repository/conversion_repo.dart';
import '../resourses/api_constant.dart';

class ExchangeMoney2 extends StatefulWidget {
  const ExchangeMoney2({Key? key}) : super(key: key);

  @override
  State<ExchangeMoney2> createState() => _ExchangeMoney2State();
}

class _ExchangeMoney2State extends State<ExchangeMoney2> {
  Rx<ModelConversion> modelConversion = ModelConversion().obs;
  Rx<RxStatus> statusOfConversion = RxStatus.empty().obs;
  TextEditingController amountController = TextEditingController();
  String? usdToNgn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    convertUsd();
  }

  String dropdownvalue = 'NGN';

  List<DropdownMenuItem<String>> get dropdownItemsm1 {
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

  void convertUsd() async {
    var convert = Currency.values.firstWhere((element) =>
        element.name.toString().toLowerCase() ==
        dropdownvalue2.toString().toLowerCase());
    var myCurrency = Currency.values.firstWhere((element) =>
        element.name.toString().toLowerCase() ==
        dropdownvalue.toString().toLowerCase());

    print(convert);
    // Currency myCurrency = await CurrencyConverter.getMyCurrency();
    var usdConvert = await CurrencyConverter.convert(
      from: myCurrency,
      to: convert,
      // Currency.values.firstWhere((element) => element.name.toString().toLowerCase() ==Get.arguments[0].toString().toLowerCase()),
      amount: 3,
    );
    setState(() {
      usdToNgn = usdConvert.toString();
    });
  }

  Future Conversions() async {
    await conversionRepo(
            amount: amountController.text.trim(),
            action: "send",
            sourceCurrency: "NGN",
            destinationCurrency: dropdownvalue2.toString(),
            business: "64529bd2bfdf28e7c18aa9da",
            beneficiaryType: "individual",
            feeBearer: "business",
            paymentDestination: "fliqpay_wallet",
            transactionType: "conversion",
            context: context)
        .then((value) {
      modelConversion.value = value;
      if (value.success == true) {
        statusOfConversion.value = RxStatus.success();
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
              Get.toNamed(MyRouters.yourBalanceScreen);
            },
            child: Text(
              "Exchange Moeney",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          return SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
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
                                  color: AppTheme.primaryColor, width: 1.3),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16)),
                                    color: Color(0xFFEEEEEE)),
                                child: SizedBox(
                                  width: 100,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText:
                                                'Please select your channel'),
                                      ]),
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF585757),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.5),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.5),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.5),
                                        ),
                                      ),
                                      hint: const Text(""),
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                      value: dropdownvalue,
                                      items: dropdownItemsm1,
                                      onChanged: (String? value) {
                                        setState(() {
                                          dropdownvalue = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),

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
                                width: 50,
                              ),
                              SizedBox(
                                width: 50,
                                child: TextFormField(
                                    controller: amountController,
                                    decoration: const InputDecoration(
                                      hintText: "0",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Color(0xFF1D1D1D),
                                          fontSize: 16,
                                          decorationColor: Colors.transparent,
                                          decorationThickness: 0,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
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
                                              color: const Color(0xFF7E7E7E),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        "$usdToNgn",
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFF7E7E7E),
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
                                            color: const Color(0xFF1D1D1D),
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
                                            color: const Color(0xFF7E7E7E),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        fee.value,
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFF7E7E7E),
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
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF0D75F),
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        "assets/images/Vector.svg",
                                        height: 20,
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
                                  color: AppTheme.primaryColor, width: 1.3),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16)),
                                    color: Color(0xFFEEEEEE)),
                                child: SizedBox(
                                  width: 100,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField(
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText:
                                                'Please select your channel'),
                                      ]),
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF585757),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.5),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.5),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.5),
                                        ),
                                      ),
                                      hint: const Text(""),
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                      value: dropdownvalue2,
                                      items: dropdownItemsm2,
                                      onChanged: (String? value) {
                                        setState(() {
                                          dropdownvalue2 = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
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
                                receive.value.toString(),
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
                          height: size.height * .3,
                        ),
                        InkWell(
                            onTap: () {
                              convertUsd();
                              Conversions();
                              // Get.toNamed(MyRouters.bottomNavbar);
                            },
                            child: const CustomOutlineButton(title: "Continue"))
                      ])));
        }));
  }
}
