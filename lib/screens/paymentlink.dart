import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/update_user.dart';
import '../routers/my_routers.dart';
import '../widgets/common_colour.dart';
class VerifyPaymentLink extends StatefulWidget {
  const VerifyPaymentLink({Key? key}) : super(key: key);

  @override
  State<VerifyPaymentLink> createState() => _VerifyPaymentLinkState();
}

class _VerifyPaymentLinkState extends State<VerifyPaymentLink> {
  final register = Get.put(registerController());
  @override
  Widget build(BuildContext context) {
    double doubleVar;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Payment Link ",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        body:  SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(18.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const SizedBox(height: 10,),
    Text(
    "Enter Amount ",
    style: GoogleFonts.poppins(
    color:  Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500),
    ),
    const SizedBox(height: 10,),
      
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
          // validator: MultiValidator([
          //   RequiredValidator(
          //       errorText:
          //       'Please enter your amount '),
          //   MinLengthValidator(1,
          //       errorText:
          //       'Please enter amount'),
          //   MaxLengthValidator(11,
          //       errorText:
          //       'Please enter amount'),
          //   PatternValidator(
          //       r'(^(?:[+0]9)?[0-9]{10,12}$)',
          //       errorText: '')
          // ]),
          controller: register.amountController,
          obSecure: false, hintText: "enter amount "),

      ElevatedButton(
          style:  ElevatedButton.styleFrom(
              primary: AppTheme.secondaryColor // Background color
          ),
          onPressed: (){
            Get.toNamed(MyRouters.paymentLink);
            // register.cashCheckout(context);



          }, child: Text("Pay By Card")),
    ]
    )))
    );
  }
}
