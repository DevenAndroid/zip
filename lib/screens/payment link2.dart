import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/update_user.dart';
import '../routers/my_routers.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
class VerifyPaymentLink2 extends StatefulWidget {
  const VerifyPaymentLink2({Key? key}) : super(key: key);

  @override
  State<VerifyPaymentLink2> createState() => _VerifyPaymentLink2State();
}

class _VerifyPaymentLink2State extends State<VerifyPaymentLink2> {
  final register = Get.put(registerController());
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
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
                      SizedBox(height: 15,),


                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Enter Amount ",
                          style: GoogleFonts.poppins(
                              color:  Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Description",
                          style: GoogleFonts.poppins(
                              color:  Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 10,),

                      CommonTextfield(



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
                          // controller: register.amountController,
                          obSecure: false, hintText: "enter Description "),




                      SizedBox(height:MediaQuery.of(context).size.height*.3,),

                      InkWell(
                          onTap: (){

                            // register.cashCheckout1(context);
                            Get.toNamed(MyRouters.addAPayer);
                            // emailLogin();
                            //
                          },
                          child: CustomOutlineButton(title: "Request a Payment ",)),
                    ]
                )))
    );
  }
}
