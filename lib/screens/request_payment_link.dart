import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/controller/profile_controller.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/update_user.dart';
import '../models/model_send_email.dart';
import '../repository/repo_send_email.dart';
import '../resourses/api_constant.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_button.dart';
import '../widgets/common_error_widget.dart';

class RequestPaymentLink extends StatefulWidget {
  const RequestPaymentLink({Key? key}) : super(key: key);

  @override
  State<RequestPaymentLink> createState() => _RequestPaymentLinkState();
}

class _RequestPaymentLinkState extends State<RequestPaymentLink> {
  final register = Get.put(registerController());
  final profile = Get.put(ProfileController());

  Rx<RxStatus> statusOfSendMail = RxStatus.empty().obs;
  Rx<ModelSendEmail> sendEmail = ModelSendEmail().obs;

  send() async {
    sendEmailRepo(
            amount: register.amountController.text.trim(),
            email: register.AddEmailController.text.toString(),
            context: context)
        .then((value) {
      log("response.body.....    ${value}");
      sendEmail.value = value;
      if (value.status == true) {
        Get.offAllNamed(MyRouters.bottomNavbar);
        statusOfSendMail.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfSendMail.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }
            // showToast(value.message.toString());
            );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      register.fetchVritualAccount();
    });
  }

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
            child: const Icon(
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 13, right: 8),
        child: InkWell(
            onTap: () {
              // Get.toNamed(
              //   MyRouters.sharePaymentLink,
              // );
              // register.saveEmails();
              // send();
              register.cashCheckout1(context);
              // emailLogin();
              //
            },
            child: const CustomOutlineButton(
              title: "Request A Payment ",
            )),
      ),
      body: Obx(() {
        return register.statusOfFetchAccount.value.isSuccess
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
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
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                        register.amountController.text.toString(),
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
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
                            register.AddNameController.text.toString(),
                            style: GoogleFonts.poppins(
                                color: const Color(0x851D1D1D),
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
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
                            register.AddEmailController.text.toString(),
                            style: GoogleFonts.poppins(
                                color: const Color(0x851D1D1D),
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payer Phone Number",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            register.AddmobileController.text.toString(),
                            style: GoogleFonts.poppins(
                                color: const Color(0x851D1D1D),
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 35,right: 32),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "Payment due date",
                    //         style: GoogleFonts.poppins(
                    //             color: const Color(0xFF1D1D1D),
                    //             fontSize: 13,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //       Text(
                    //         "30 Mar 2023",
                    //         style: GoogleFonts.poppins(
                    //             color: const Color(0xFFF0D75F),
                    //             fontSize: 11,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 25,
                    // ),
                    // const Divider(
                    //   thickness: 1,
                    //   color: Color(0x1A000000),
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 35),
                    //   child: Text(
                    //     "Add attachment",
                    //     style: GoogleFonts.poppins(
                    //         color: const Color(0xFFF0D75F),
                    //         fontSize: 11,
                    //         fontWeight: FontWeight.w400),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 35),
                    //   child: Text(
                    //     "Description",
                    //     style: GoogleFonts.poppins(
                    //         color: const Color(0xFF1D1D1D),
                    //         fontSize: 13,
                    //         fontWeight: FontWeight.w400),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       left: 32, right: 32, top: 20, bottom: 32),
                    //   child: Text(
                    //     "Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor. Cupiditate ut quae sit ipsam. Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor.",
                    //     style: GoogleFonts.poppins(
                    //         color: const Color(0x871D1D1D),
                    //         fontSize: 9,
                    //         fontWeight: FontWeight.w300),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       left: 32, right: 32, bottom: 32),
                    //   child: Text(
                    //     "Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor. Cupiditate ut quae sit ipsam. Est expedita consequuntur repudiandae ducimus nulla eum. Nihil amet nulla necessitatibus. Quae delectus doloribus dolor.",
                    //     style: GoogleFonts.poppins(
                    //         color: const Color(0x871D1D1D),
                    //         fontSize: 9,
                    //         fontWeight: FontWeight.w300),
                    //   ),
                    // ),
                    // SizedBox(height: 15,),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30.0),
                    //   child: Text("Link",style: GoogleFonts.poppins(
                    //       color:  Colors.black,
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.w500),),
                    // ),
                    // SizedBox(height: 10,),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30,right: 30),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Obx(() => Expanded(
                    //         child: Text(register.link1.value.toString(),style: GoogleFonts.poppins(
                    //             color:  Colors.black,
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.w500),),
                    //       )),
                    //       InkWell(
                    //           onTap: (){
                    //             Clipboard.setData(
                    //                 ClipboardData(text: register.link1.value.toString()))
                    //                 .then((value) =>
                    //                 Fluttertoast.showToast(
                    //                     msg: "Copied",
                    //                     gravity: ToastGravity.CENTER));
                    //               },
                    //
                    //           child: Icon(Icons.copy))
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 15,),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30.0),
                    //   child: Text("Code",style: GoogleFonts.poppins(
                    //       color:  Colors.black,
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.w500),),
                    // ),
                    // SizedBox(height: 10,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Obx(() => Padding(
                    //       padding: const EdgeInsets.only(left: 30,right: 40),
                    //       child: Text(register.code.value.toString(),style: GoogleFonts.poppins(
                    //           color:  Colors.black,
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.w500),),
                    //     )),
                    //     Padding(
                    //       padding: const EdgeInsets.only(right: 28.0),
                    //       child: InkWell(
                    //           onTap: (){
                    //             Clipboard.setData(
                    //                 ClipboardData(text: register.code.value.toString()))
                    //                 .then((value) =>
                    //                 Fluttertoast.showToast(
                    //                     msg: "Copied",
                    //                     gravity: ToastGravity.CENTER));
                    //               },
                    //
                    //           child: Icon(Icons.copy)),
                    //     )
                    //   ],
                    // ),
                    //
                    // CommonTextfield(obSecure: false, hintText: link == null ? '': register.checkout.value.data!.link.toString()),
                    // CommonTextfield(obSecure: false, hintText: link == null ? '': register.checkout.value.data!.link.toString()),

                    const SizedBox(
                      height: 30,
                    ),
                    // InkWell(
                    //     onTap: () {
                    //       // register.cashCheckout(context);
                    //       // emailLogin();
                    //       //
                    //       Get.toNamed(
                    //         MyRouters.sharePaymentLink,
                    //       );
                    //     },
                    //     child: const CustomOutlineBoder(
                    //       title: "Generate Payment Link",
                    //     )),
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
