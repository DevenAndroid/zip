import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/update_user.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_error_widget.dart';

class GeneratePaymentLink extends StatefulWidget {
  const GeneratePaymentLink({Key? key}) : super(key: key);

  @override
  State<GeneratePaymentLink> createState() => _GeneratePaymentLinkState();
}

class _GeneratePaymentLinkState extends State<GeneratePaymentLink> {
  var initStateBlank = Get.arguments[0];
  var initStateBlank1 = Get.arguments[1];
  var initStateBlank2 = Get.arguments[2];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      register.fetchVritualAccount();
    });
  }

  final register = Get.put(registerController());
  String link = " ";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          "Request a payment",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return register.statusOfFetchAccount.value.isSuccess
            ? SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 37,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                        "Amount Requested",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                        initStateBlank,
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payer Name",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            initStateBlank1,
                            style: GoogleFonts.poppins(
                                color: const Color(0x851D1D1D),
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payer Email",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            initStateBlank2,
                            style: GoogleFonts.poppins(
                                color: const Color(0x851D1D1D),
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    SizedBox(
                      height: 25,
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0x1A000000),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                        "Add attachment",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFFF0D75F),
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                        "Description",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
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
                      padding: const EdgeInsets.only(
                          left: 32, right: 32, bottom: 32),
                      child: Text(
                        "Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor. Cupiditate ut quae sit ipsam. Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor.",
                        style: GoogleFonts.poppins(
                            color: const Color(0x871D1D1D),
                            fontSize: 9,
                            fontWeight: FontWeight.w300),
                      ),
                    ),


                    SizedBox(
                      height: 30,
                    ),

                    InkWell(
                        onTap: () {
                          // register.cashCheckout(context);
                          // emailLogin();
                          //
                          Get.toNamed(MyRouters.requestAPaymentContiune,
                              arguments: [initStateBlank1, initStateBlank2]);
                        },
                        child: CustomOutlineButton(
                          title: "Request A Payment ",
                        )),

                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            : register.statusOfFetchAccount.value.isError
                ? CommonErrorWidget(
                    errorText: register.fetchAccount.value.message.toString(),
                    onTap: () {},
                  )
                : const CommonProgressIndicator();
      }),
    );
  }
}
