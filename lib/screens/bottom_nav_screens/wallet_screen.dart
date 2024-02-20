import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/resourses/api_constant.dart';

import '../../controller/profile_controller.dart';
import '../../controller/update_user.dart';
import '../../routers/my_routers.dart';
import '../../widgets/common_boder_button.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_colour.dart';

class WalletScreen1 extends StatefulWidget {
  const WalletScreen1({super.key});

  @override
  State<WalletScreen1> createState() => _WalletScreen1State();
}

class _WalletScreen1State extends State<WalletScreen1> {
  final controller = Get.put(registerController());
  final controller1 = Get.put(ProfileController());
  CarouselController carouselController = CarouselController();

  int cyu = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller1.getCard();
    controller1.getCurrentBalance();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Wallet",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        body: RefreshIndicator(
            color: Colors.white,
            backgroundColor: AppTheme.primaryColor,
            onRefresh: () async {
              controller1.getCard();
            },
            child: Obx(() {
              return controller1.currentBalanceModel.value.status == true
                  ? SingleChildScrollView(
                      child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                      onTap: () {},
                                      child: const CustomOutlineButton(
                                        title: "Cards",
                                      )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    Get.toNamed(MyRouters.accountsInBank);
                                  },
                                  child: CustomOutlineBoder(
                                    title: "Account",
                                    backgroundColor: Colors.white,
                                    textColor: AppTheme.buttonColor,
                                    onPressed: () {
                                      Get.toNamed(MyRouters.mobileNumber);
                                    },
                                  ),
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 33,
                            ),
                            CarouselSlider(
                              carouselController: carouselController,
                              items: [
                                Card(
                                  elevation: 4.0,
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Container(
                                    height: 180,
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 15, bottom: 22.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18, top: 17),
                                          child: Image.asset(
                                            "assets/images/walletlogo.png",
                                            height: 45,
                                            width: 44,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            if (controller1.card.value.data ==
                                                null) ...[
                                              const CircleAvatar(
                                                maxRadius: 4,
                                                backgroundColor: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              const CircleAvatar(
                                                maxRadius: 4,
                                                backgroundColor: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              const CircleAvatar(
                                                maxRadius: 4,
                                                backgroundColor: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              const CircleAvatar(
                                                maxRadius: 4,
                                                backgroundColor: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                            ] else
                                              Text(
                                                "1234",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    letterSpacing: 2,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                          ],
                                        ),
                                        FittedBox(
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Card Holder Name',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  if (controller1
                                                          .card.value.data ==
                                                      null)
                                                    Text(
                                                      '--',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                  else
                                                    Text(
                                                      "----",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Expiry date',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  if (controller1
                                                          .card.value.data ==
                                                      null)
                                                    Text(
                                                      '--/--',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                  else
                                                    Text(
                                                      "--/--",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Stack(
                                                children: [
                                                  Image.network(
                                                    "https://cdn.freebiesupply.com/logos/large/2x/visa-logo-png-transparent.png",
                                                    height: 40,
                                                    width: 55,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 4.0,
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Container(
                                    height: 180,
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 15, bottom: 22.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18, top: 17),
                                          child: Image.asset(
                                            "assets/images/walletlogo.png",
                                            height: 45,
                                            width: 44,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const CircleAvatar(
                                              maxRadius: 4,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            if (controller1.card.value.data ==
                                                null) ...[
                                              const CircleAvatar(
                                                maxRadius: 4,
                                                backgroundColor: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              const CircleAvatar(
                                                maxRadius: 4,
                                                backgroundColor: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              const CircleAvatar(
                                                maxRadius: 4,
                                                backgroundColor: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              const CircleAvatar(
                                                maxRadius: 4,
                                                backgroundColor: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                            ] else
                                              Text(
                                                "1234",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    letterSpacing: 2,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                          ],
                                        ),
                                        FittedBox(
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Card Holder Name',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  if (controller1
                                                          .card.value.data ==
                                                      null)
                                                    Text(
                                                      '--',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                  else
                                                    Text(
                                                      "----",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Expiry date',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  if (controller1
                                                          .card.value.data ==
                                                      null)
                                                    Text(
                                                      '--/--',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                  else
                                                    Text(
                                                      "--/--",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Stack(
                                                children: [
                                                  Image.network(
                                                    "https://www.freepnglogos.com/uploads/mastercard-png/mastercard-logo-transparent-png-stickpng-10.png",
                                                    height: 40,
                                                    width: 55,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],

                              //Slider Container properties
                              options: CarouselOptions(
                                height: 180.0,
                                enlargeCenterPage: true,
                                autoPlay: false,
                                aspectRatio: 16 / 9,
                                onPageChanged: (int index,
                                    CarouselPageChangedReason reason) {
                                  cyu = index;
                                  setState(() {});
                                },
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                viewportFraction: 0.85,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                height: 65,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: const Color(0xff1D1D1D))),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      "assets/images/Group.png",
                                      height: 45,
                                      width: 44,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Get your Virtual Card',
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xff1D1D1D),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          'Rem nemo rerum sint dolor quae repellat.',
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xff1D1D1D),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                // height: 65,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: const Color(0xff1D1D1D))),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SvgPicture.asset(
                                          "assets/images/1.svg",
                                          height: 45,
                                          width: 44,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Card Creation Fees ',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff1D1D1D),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "\$" +
                                                  controller1
                                                      .currentBalanceModel
                                                      .value
                                                      .data!
                                                      .charges
                                                      .toString(),
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff1D1D1D),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(
                                          "assets/images/nh.png",
                                          height: 45,
                                          width: 44,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Card Transition Fees',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff1D1D1D),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              controller1
                                                  .currentBalanceModel
                                                  .value
                                                  .data!
                                                  .fee!
                                                  .bridgeCardFee
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff1D1D1D),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * .02,
                            ),
                            cyu.isEven
                                ? InkWell(
                                    onTap: () {
                                      print("object");

                                      if (controller1.currentBalanceModel.value
                                              .data!.currentBalance! >
                                          controller1.currentBalanceModel.value
                                              .data!.fee!.bridgeCardFee!) {
                                        controller1.create(context);
                                      } else {
                                        showToast(
                                            "Your wallet balance is below to card creation fees");
                                      }

                                      // :controller1. create3();
                                    },
                                    child: const CustomOutlineButton(
                                      title: "Create a Visa Card",
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      if (controller1.currentBalanceModel.value
                                              .data!.fee!.bridgeCardFee! <=
                                          controller1.currentBalanceModel.value
                                              .data!.currentBalance!) {
                                        controller1.create1(context);
                                      } else {
                                        showToast(
                                            "Your wallet balance is below to card creation fees");
                                      }
                                    },
                                    child: const CustomOutlineButton(
                                      title: "Create a Master Card",
                                    ),
                                  ),
                            const SizedBox(
                              height: 100,
                            ),
                          ]),
                    ))
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            })));
  }
}
