import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/profile_controller.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  final controller1 = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller1.getCard();
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
          title: Text(
            "Card Details",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Obx(() {
                  return controller1.statusOfCard.value.isSuccess
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Card Name',
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    controller1.card.value.data!.cardName
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Card Number',
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    controller1.card.value.data!.cardNumber
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Expiry Month',
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    controller1.card.value.data!.expiryMonth
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Expiry Year',
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    controller1.card.value.data!.expiryYear
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Card Currency',
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    controller1.card.value.data!.cardCurrency
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Brand',
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    controller1.card.value.data!.brand
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF1D1D1D),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'CVV',
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF1D1D1D),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  controller1.card.value.data!.cvv
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF1D1D1D),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                              const SizedBox(
                                height: 15,
                              ),
                            ])
                      : controller1.statusOfCard.value.isError
                          ? CommonErrorWidget(
                              errorText:
                                  controller1.card.value.message.toString(),
                              onTap: () {
                                controller1.getCard();
                              },
                            )
                          : const Center(child: CommonProgressIndicator());
                }))));
  }
}
